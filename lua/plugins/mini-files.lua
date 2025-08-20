return {
	"echasnovski/mini.files",
	enabled = true,
	config = function()
		local opts = {
			config = function(_, opts) end,

			mappings = {
				close = "q",
				go_in = "T",
				go_in_plus = "t",
				go_out = "r",
				go_out_plus = "H",
				reset = "<BS>",
				show_help = "g?",
				synchronize = "<cr>",
				trim_left = "<",
				trim_right = ">",
			},
			-- General options
			options = {
				-- Whether to use for editing directories
				use_as_default_explorer = true,
				permanent_delete = false,
			},

			-- Customization of explorer windows
			windows = {
				-- Maximum number of windows to show side by side
				max_number = math.huge,
				-- Whether to show preview of file/directory under cursor
				preview = true,
				-- Width of focused window
				width_focus = 35,
				-- Width of non-focused window
				width_nofocus = 20,
				-- Width of preview window
				width_preview = 70,
			},
		} -- Provide a default value for opts
		require("mini.files").setup(opts)

		local show_dotfiles = true
		local filter_show = function(fs_entry)
			return true
		end
		local filter_hide = function(fs_entry)
			return not vim.startswith(fs_entry.name, ".")
		end

		local toggle_dotfiles = function()
			show_dotfiles = not show_dotfiles
			local new_filter = show_dotfiles and filter_show or filter_hide
			require("mini.files").refresh({ content = { filter = new_filter } })
		end

		local map_split = function(buf_id, lhs, direction, close_on_file)
			local rhs = function()
				local new_target_window
				local cur_target_window = require("mini.files").get_target_window()
				if cur_target_window ~= nil then
					vim.api.nvim_win_call(cur_target_window, function()
						vim.cmd("belowright " .. direction .. " split")
						new_target_window = vim.api.nvim_get_current_win()
					end)

					require("mini.files").set_target_window(new_target_window)
					require("mini.files").go_in({ close_on_file = close_on_file })
				end
			end

			local desc = "Open in " .. direction .. " split"
			if close_on_file then
				desc = desc .. " and close"
			end
			vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
		end

		local files_set_cwd = function()
			local cur_entry_path = MiniFiles.get_fs_entry().path
			local cur_directory = vim.fs.dirname(cur_entry_path)
			if cur_directory ~= nil then
				vim.fn.chdir(cur_directory)
			end
		end

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local buf_id = args.data.buf_id

				vim.keymap.set(
					"n",
					opts.mappings and opts.mappings.toggle_hidden or "g.",
					toggle_dotfiles,
					{ buffer = buf_id, desc = "Toggle hidden files" }
				)

				vim.keymap.set(
					"n",
					opts.mappings and opts.mappings.change_cwd or "gc",
					files_set_cwd,
					{ buffer = args.data.buf_id, desc = "Set cwd" }
				)

				map_split(buf_id, opts.mappings and opts.mappings.go_in_horizontal or "<C-w>s", "horizontal", false)
				map_split(buf_id, opts.mappings and opts.mappings.go_in_vertical or "<C-w>v", "vertical", false)
				map_split(buf_id, opts.mappings and opts.mappings.go_in_horizontal_plus or "<C-w>S", "horizontal", true)
				map_split(buf_id, opts.mappings and opts.mappings.go_in_vertical_plus or "<C-w>V", "vertical", true)
			end,
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesActionRename",
			callback = function(event)
				LazyVim.lsp.on_rename(event.data.from, event.data.to)
			end,
		})

		-- Git signs part
		local nsMiniFiles = vim.api.nvim_create_namespace("mini_files_git")
		local nsMiniFilesDiagnostics = vim.api.nvim_create_namespace("mini_files_diagnostics")
		local autocmd = vim.api.nvim_create_autocmd
		local _, MiniFiles = pcall(require, "mini.files")

		-- Cache for git status
		local gitStatusCache = {}
		local cacheTimeout = 2000 -- Cache timeout in milliseconds

		---@type table<string, {symbol: string, hlGroup: string}>
		---@param status string
		---@return string symbol, string hlGroup
		local function mapSymbols(status)
			local statusMap = {
				-- stylua: ignore start 
				[" M"] = { symbol = "", hlGroup  = "GitSignsChange"}, -- Modified in the working directory
				["M "] = { symbol = "M", hlGroup  = "GitSignsChange"}, -- modified in index
				["MM"] = { symbol = "MM", hlGroup  = "GitSignsChange"}, -- modified in both working tree and index
				["A "] = { symbol = "", hlGroup  = "GitSignsAdd"   }, -- Added to the staging area, new file
				["AA"] = { symbol = "AA", hlGroup  = "GitSignsAdd"   }, -- file is added in both working tree and index
				["D "] = { symbol = "", hlGroup  = "GitSignsDelete"}, -- Deleted from the staging area
				["AM"] = { symbol = "AM", hlGroup  = "GitSignsChange"}, -- added in working tree, modified in index
				["AD"] = { symbol = "AD", hlGroup = "GitSignsChange"}, -- Added in the index and deleted in the working directory
				["R "] = { symbol = "", hlGroup  = "GitSignsChange"}, -- Renamed in the index
				["U "] = { symbol = "U", hlGroup  = "GitSignsChange"}, -- Unmerged path
				["UU"] = { symbol = "UU", hlGroup  = "GitSignsAdd"   }, -- file is unmerged
				["UA"] = { symbol = "UA", hlGroup  = "GitSignsAdd"   }, -- file is unmerged and added in working tree
				["??"] = { symbol = "", hlGroup  = "GitSignsDelete"}, -- Untracked files
				["!!"] = { symbol = "!!", hlGroup  = "GitSignsChange"}, -- Ignored files
				-- stylua: ignore end
				-- [" M"] = { symbol = "•", hlGroup  = "GitSignsChange"}, -- Modified in the working directory
				-- ["M "] = { symbol = "✹", hlGroup  = "GitSignsChange"}, -- modified in index
				-- ["MM"] = { symbol = "≠", hlGroup  = "GitSignsChange"}, -- modified in both working tree and index
				-- ["A "] = { symbol = "+", hlGroup  = "GitSignsAdd"   }, -- Added to the staging area, new file
				-- ["AA"] = { symbol = "≈", hlGroup  = "GitSignsAdd"   }, -- file is added in both working tree and index
				-- ["D "] = { symbol = "-", hlGroup  = "GitSignsDelete"}, -- Deleted from the staging area
				-- ["AM"] = { symbol = "⊕", hlGroup  = "GitSignsChange"}, -- added in working tree, modified in index
				-- ["AD"] = { symbol = "-•", hlGroup = "GitSignsChange"}, -- Added in the index and deleted in the working directory
				-- ["R "] = { symbol = "→", hlGroup  = "GitSignsChange"}, -- Renamed in the index
				-- ["U "] = { symbol = "‖", hlGroup  = "GitSignsChange"}, -- Unmerged path
				-- ["UU"] = { symbol = "⇄", hlGroup  = "GitSignsAdd"   }, -- file is unmerged
				-- ["UA"] = { symbol = "⊕", hlGroup  = "GitSignsAdd"   }, -- file is unmerged and added in working tree
				-- ["??"] = { symbol = "?", hlGroup  = "GitSignsDelete"}, -- Untracked files
				-- ["!!"] = { symbol = "!", hlGroup  = "GitSignsChange"}, -- Ignored files
			}

			local result = statusMap[status] or { symbol = "?", hlGroup = "NonText" }
			return result.symbol, result.hlGroup
		end

		---@param cwd string
		---@param callback function
		---@return nil
		local function fetchGitStatus(cwd, callback)
			local function on_exit(content)
				if content.code == 0 then
					callback(content.stdout)
					vim.g.content = content.stdout
				else
					vim.notify("Failed to fetch Git status", vim.log.levels.ERROR)
				end
			end
			vim.system({ "git", "status", "--ignored", "--porcelain" }, { text = true, cwd = cwd }, on_exit)
		end

		---@param str string?
		local function escapePattern(str)
			return str:gsub("([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")
		end

		---@param buf_id integer
		---@param gitStatusMap table
		---@return nil
		local function updateMiniWithGit(buf_id, gitStatusMap)
			vim.schedule(function()
				local nlines = vim.api.nvim_buf_line_count(buf_id)
				local cwd = vim.fs.root(buf_id, ".git")
				local escapedcwd = escapePattern(cwd)
				if vim.fn.has("win32") == 1 then
					escapedcwd = escapedcwd:gsub("\\", "/")
				end

				for i = 1, nlines do
					local entry = MiniFiles.get_fs_entry(buf_id, i)
					if not entry then
						break
					end
					local relativePath = entry.path:gsub("^" .. escapedcwd .. "/", "")
					local status = gitStatusMap[relativePath]
					-- Check for directory status
					if not status and entry.type == "directory" then
						for path, stat in pairs(gitStatusMap) do
							if vim.startswith(path, relativePath .. "/") then
								status = stat
								break
							end
						end
					end

					if status then
						local symbol, hlGroup = mapSymbols(status)
						vim.api.nvim_buf_set_extmark(buf_id, nsMiniFiles, i - 1, 0, {
							-- NOTE: if you want the signs on the right uncomment those and comment
							-- the 3 lines after
							virt_text = { { symbol, hlGroup } },
							virt_text_pos = "right_align",
							-- sign_text = symbol,
							-- sign_hl_group = hlGroup,
							-- priority = 2,
						})
					else
					end
				end
			end)
		end

		-- Diagnostics part
		local nsMiniFilesDiagnostics = vim.api.nvim_create_namespace("mini_files_diagnostics")

		---@type table<string, {symbol: string, hlGroup: string}>
		---@param severity number
		---@return string symbol, string hlGroup
		local function mapDiagnostics(severity)
			local severityMap = {
				[vim.diagnostic.severity.ERROR] = { symbol = "E", hlGroup = "DiagnosticError" },
				[vim.diagnostic.severity.WARN] = { symbol = "W", hlGroup = "DiagnosticWarn" },
				[vim.diagnostic.severity.INFO] = { symbol = "I", hlGroup = "DiagnosticInfo" },
				[vim.diagnostic.severity.HINT] = { symbol = "H", hlGroup = "DiagnosticHint" },
			}

			local result = severityMap[severity] or { symbol = "?", hlGroup = "NonText" }
			return result.symbol, result.hlGroup
		end

		---@param buf_id integer
		---@return nil
		local function updateMiniWithDiagnostics(buf_id)
			vim.schedule(function()
				local diagnostics = vim.diagnostic.get(buf_id)
				local nlines = vim.api.nvim_buf_line_count(buf_id)

				for i = 1, nlines do
					local entry = MiniFiles.get_fs_entry(buf_id, i)
					if not entry then
						break
					end

					for _, diagnostic in ipairs(diagnostics) do
						if diagnostic.source == entry.path then
							local symbol, hlGroup = mapDiagnostics(diagnostic.severity)
							vim.api.nvim_buf_set_extmark(buf_id, nsMiniFilesDiagnostics, i - 1, 0, {
								virt_text = { { symbol, hlGroup } },
								virt_text_pos = "right_align",
							})
							break
						end
					end
				end
			end)
		end

		-- Thanks for the idea of getting https://github.com/refractalize/oil-git-status.nvim signs for dirs
		---@param content string
		---@return table
		local function parseGitStatus(content)
			local gitStatusMap = {}
			-- lua match is faster than vim.split (in my experience )
			for line in content:gmatch("[^\r\n]+") do
				local status, filePath = string.match(line, "^(..)%s+(.*)")
				-- Split the file path into parts
				local parts = {}
				for part in filePath:gmatch("[^/]+") do
					table.insert(parts, part)
				end
				-- Start with the root directory
				local currentKey = ""
				for i, part in ipairs(parts) do
					if i > 1 then
						-- Concatenate parts with a separator to create a unique key
						currentKey = currentKey .. "/" .. part
					else
						currentKey = part
					end
					-- Add the status for both files and directories
					gitStatusMap[currentKey] = status
				end
			end
			return gitStatusMap
		end

		---@param buf_id integer
		---@return nil
		local function updateGitStatus(buf_id)
			if not vim.fs.root(vim.uv.cwd(), ".git") then
				return
			end

			local cwd = vim.fn.expand("%:p:h")
			local currentTime = os.time()
			if gitStatusCache[cwd] and currentTime - gitStatusCache[cwd].time < cacheTimeout then
				updateMiniWithGit(buf_id, gitStatusCache[cwd].statusMap)
			else
				fetchGitStatus(cwd, function(content)
					local gitStatusMap = parseGitStatus(content)
					gitStatusCache[cwd] = {
						time = currentTime,
						statusMap = gitStatusMap,
					}
					updateMiniWithGit(buf_id, gitStatusMap)
				end)
			end
		end

		---@return nil
		local function clearCache()
			gitStatusCache = {}
		end

		local function augroup(name)
			return vim.api.nvim_create_augroup("MiniFiles_" .. name, { clear = true })
		end

		autocmd("User", {
			group = augroup("start"),
			pattern = "MiniFilesExplorerOpen",
			-- pattern = { "minifiles" },
			callback = function()
				local bufnr = vim.api.nvim_get_current_buf()
				updateGitStatus(bufnr)
			end,
		})

		autocmd("User", {
			group = augroup("close"),
			pattern = "MiniFilesExplorerClose",
			callback = function()
				clearCache()
			end,
		})

		autocmd("User", {
			group = augroup("update"),
			pattern = "MiniFilesBufferUpdate",
			callback = function(sii)
				local bufnr = sii.data.buf_id
				local cwd = vim.fn.expand("%:p:h")
				if gitStatusCache[cwd] then
					updateMiniWithGit(bufnr, gitStatusCache[cwd].statusMap)
				end
			end,
		})
	end,
}
