-- local function path_to_dir(p)
-- 	if not p or p == "" then
-- 		return vim.loop.fs_realpath(vim.fn.getcwd()) or vim.fn.getcwd()
-- 	end
-- 	p = vim.fn.expand(p)
-- 	local stat = vim.loop.fs_stat(p)
-- 	if stat and stat.type == "directory" then
-- 		return vim.loop.fs_realpath(p) or p
-- 	end
-- 	local parent = vim.fn.fnamemodify(p, ":p:h")
-- 	return vim.loop.fs_realpath(parent) or parent
-- end
--
-- local function safe_buf_name(bufnr)
-- 	local api = vim.api
-- 	-- if bufnr not provided, use current buf (pcall in case odd state)
-- 	if not bufnr then
-- 		local ok_get, cur = pcall(api.nvim_get_current_buf)
-- 		if not ok_get or not cur then
-- 			return ""
-- 		end
-- 		bufnr = cur
-- 	end
-- 	local ok_valid, valid = pcall(api.nvim_buf_is_valid, bufnr)
-- 	if not ok_valid or not valid then
-- 		return ""
-- 	end
-- 	local ok_name, name = pcall(api.nvim_buf_get_name, bufnr)
-- 	if not ok_name or not name then
-- 		return ""
-- 	end
-- 	return name
-- end
--
-- local function sane_current_path()
-- 	-- Prefer current buffer name if valid and not a mini.files buffer,
-- 	-- else try alternate buffer, else fallback to cwd.
-- 	local cur_name = safe_buf_name()
-- 	if cur_name ~= "" and not cur_name:match("^minifiles:") then
-- 		return cur_name
-- 	end
--
-- 	-- Try alternate buffer (#)
-- 	local ok_alt, alt_nr = pcall(vim.fn.bufnr, "#")
-- 	if ok_alt and type(alt_nr) == "number" and alt_nr > 0 then
-- 		local alt_name = safe_buf_name(alt_nr)
-- 		if alt_name ~= "" and not alt_name:match("^minifiles:") then
-- 			return alt_name
-- 		end
-- 	end
--
-- 	return vim.fn.getcwd()
-- end
--
-- -- Toggle used in keys (lazy-friendly)
-- local function toggle_mini_files()
-- 	local ok, mf = pcall(require, "mini.files")
-- 	if not ok then
-- 		mf = require("mini.files")
-- 	end
--
-- 	local bufname = safe_buf_name()
-- 	local is_mini = bufname:match("^minifiles:")
--
-- 	if not is_mini then
-- 		local dir = path_to_dir(sane_current_path())
-- 		_G.__mini_files_last_path = dir
-- 		mf.open(dir, true)
-- 		return
-- 	end
--
-- 	local explorer_path = bufname:match("^minifiles:.*(/.*)$")
-- 	if not explorer_path then
-- 		local ok2, entry = pcall(mf.get_fs_entry)
-- 		if ok2 and entry and entry.path then
-- 			explorer_path = entry.path
-- 		end
-- 	end
--
-- 	local cur_dir = explorer_path and path_to_dir(explorer_path) or nil
-- 	local cwd_dir = path_to_dir(vim.uv.cwd())
--
-- 	if cur_dir and cur_dir == cwd_dir then
-- 		local target = _G.__mini_files_last_path or path_to_dir(sane_current_path())
-- 		mf.open(target, true)
-- 	else
-- 		_G.__mini_files_last_path = cur_dir or path_to_dir(sane_current_path())
-- 		mf.open(cwd_dir, true)
-- 	end
-- end
--
-- return {
-- 	"nvim-mini/mini.files",
-- 	opts = {
-- 		mappings = {
-- 			close = "q",
-- 			go_in = "T",
-- 			go_in_plus = "t",
-- 			go_out = "r",
-- 			go_out_plus = "H",
-- 			reset = "<BS>",
-- 			show_help = "g?",
-- 			synchronize = "<cr>",
-- 			trim_left = "<",
-- 			trim_right = ">",
-- 		},
-- 		options = {
-- 			use_as_default_explorer = true,
-- 			permanent_delete = false,
-- 		},
-- 		windows = {
-- 			max_number = math.huge,
-- 			preview = true,
-- 			width_focus = 35,
-- 			width_nofocus = 20,
-- 			width_preview = 70,
-- 		},
-- 	},
-- 	keys = {
-- 		{ "<leader>e", toggle_mini_files, desc = "Toggle mini.files (file dir ↔ root)" },
-- 		{
-- 			"<leader>E",
-- 			function()
-- 				require("mini.files").open(vim.uv.cwd(), true)
-- 			end,
-- 			desc = "Open mini.files at root",
-- 		},
-- 	},
-- 	config = function(_, opts)
-- 		local api = vim.api
-- 		local mf = require("mini.files")
-- 		mf.setup(opts)
--
-- 		-- dotfiles toggle
-- 		local show_dotfiles = true
-- 		local filter_show = function()
-- 			return true
-- 		end
-- 		local filter_hide = function(fs_entry)
-- 			return not vim.startswith(fs_entry.name, ".")
-- 		end
-- 		local function toggle_dotfiles()
-- 			show_dotfiles = not show_dotfiles
-- 			local new_filter = show_dotfiles and filter_show or filter_hide
-- 			mf.refresh({ content = { filter = new_filter } })
-- 		end
--
-- 		-- safe get_fs_entry wrapper
-- 		local function get_fs_entry_safe(buf_id, i)
-- 			local ok, res = pcall(function()
-- 				return mf.get_fs_entry(buf_id, i)
-- 			end)
-- 			if ok and res then
-- 				return res
-- 			end
-- 			ok, res = pcall(function()
-- 				return mf.get_fs_entry(i)
-- 			end)
-- 			if ok and res then
-- 				return res
-- 			end
-- 			ok, res = pcall(function()
-- 				return mf.get_fs_entry()
-- 			end)
-- 			if ok and res then
-- 				return res
-- 			end
-- 			return nil
-- 		end
--
-- 		local function map_split(buf_id, lhs, direction, close_on_file)
-- 			local rhs = function()
-- 				local new_target_window
-- 				local cur_target_window = mf.get_explorer_state().target_window
-- 				if cur_target_window ~= nil then
-- 					vim.api.nvim_win_call(cur_target_window, function()
-- 						vim.cmd("belowright " .. direction .. " split")
-- 						new_target_window = vim.api.nvim_get_current_win()
-- 					end)
--
-- 					mf.set_target_window(new_target_window)
-- 					mf.go_in({ close_on_file = close_on_file })
-- 				end
-- 			end
--
-- 			local desc = "Open in " .. direction .. " split"
-- 			if close_on_file then
-- 				desc = desc .. " and close"
-- 			end
-- 			vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
-- 		end
--
-- 		local function files_set_cwd()
-- 			local ok, entry = pcall(mf.get_fs_entry)
-- 			if not ok or not entry or not entry.path then
-- 				return
-- 			end
-- 			local cur_directory = vim.fs.dirname(entry.path)
-- 			if cur_directory then
-- 				vim.fn.chdir(cur_directory)
-- 			end
-- 		end
--
-- 		-- ----------------------
-- 		-- Git integration (safe)
-- 		-- ----------------------
-- 		local nsGit = api.nvim_create_namespace("mini_files_git")
-- 		local gitStatusCache = {} -- keyed by repo_root -> { time = now, statusMap, repo_root }
-- 		local cacheTTL = 2000 -- ms
-- 		_G.__mini_files_git_cache = gitStatusCache
--
-- 		local function escapePattern(s)
-- 			return (s:gsub("([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1"))
-- 		end
--
-- 		local function parseGitStatus(content)
-- 			local map = {}
-- 			for line in content:gmatch("[^\r\n]+") do
-- 				local status, path = line:match("^(..)%s+(.*)")
-- 				if status and path then
-- 					map[path] = status
-- 				end
-- 			end
-- 			for p, s in pairs(map) do
-- 				local parts = {}
-- 				for part in p:gmatch("[^/]+") do
-- 					table.insert(parts, part)
-- 				end
-- 				if #parts > 1 then
-- 					for i = 1, (#parts - 1) do
-- 						local dir = table.concat(parts, "/", 1, i)
-- 						if not map[dir] then
-- 							map[dir] = s
-- 						end
-- 					end
-- 				end
-- 			end
-- 			return map
-- 		end
--
-- 		-- fetchGitStatus schedules all API-using callbacks
-- 		local function fetchGitStatus(repo_dir, cb)
-- 			vim.system({ "git", "rev-parse", "--show-toplevel" }, { cwd = repo_dir, text = true }, function(res1)
-- 				vim.schedule(function()
-- 					if not res1 or res1.code ~= 0 then
-- 						cb(nil)
-- 						return
-- 					end
-- 					local repo_root = (res1.stdout or ""):gsub("%s+$", "")
-- 					if repo_root == "" then
-- 						cb(nil)
-- 						return
-- 					end
--
-- 					vim.system(
-- 						{ "git", "status", "--ignored", "--porcelain" },
-- 						{ cwd = repo_root, text = true },
-- 						function(res2)
-- 							vim.schedule(function()
-- 								if not res2 or res2.code ~= 0 then
-- 									cb(nil)
-- 									return
-- 								end
-- 								local statusMap = parseGitStatus(res2.stdout or "")
-- 								cb({ statusMap = statusMap, repo_root = repo_root })
-- 							end)
-- 						end
-- 					)
-- 				end)
-- 			end)
-- 		end
--
-- 		local function updateMiniWithGit(buf_id, gitStatusMap, repo_root)
-- 			vim.schedule(function()
-- 				if not api.nvim_buf_is_valid(buf_id) then
-- 					return
-- 				end
-- 				api.nvim_buf_clear_namespace(buf_id, nsGit, 0, -1)
-- 				if not gitStatusMap or not repo_root then
-- 					return
-- 				end
--
-- 				local escaped_root = escapePattern(repo_root)
-- 				if vim.fn.has("win32") == 1 then
-- 					escaped_root = escaped_root:gsub("\\", "/")
-- 				end
--
-- 				local nlines = api.nvim_buf_line_count(buf_id)
-- 				for i = 1, nlines do
-- 					local entry = get_fs_entry_safe(buf_id, i)
-- 					if not entry or not entry.path then
-- 						break
-- 					end
-- 					local full = entry.path
-- 					if vim.fn.has("win32") == 1 then
-- 						full = full:gsub("\\", "/")
-- 					end
-- 					local rel = full:gsub("^" .. escaped_root .. "/", "")
-- 					local status = gitStatusMap[rel]
-- 					if status then
-- 						local mapping = {
-- 							[" M"] = { "", "GitSignsChange" },
-- 							["M "] = { "M", "GitSignsChange" },
-- 							["A "] = { "", "GitSignsAdd" },
-- 							["D "] = { "", "GitSignsDelete" },
-- 							["R "] = { "", "GitSignsChange" },
-- 							["??"] = { "", "GitSignsDelete" },
-- 							["!!"] = { "!!", "GitSignsChange" },
-- 							["UU"] = { "UU", "GitSignsAdd" },
-- 							["U "] = { "U", "GitSignsChange" },
-- 						}
-- 						local sym, hl = unpack(mapping[status] or { "?", "NonText" })
-- 						api.nvim_buf_set_extmark(buf_id, nsGit, i - 1, 0, {
-- 							virt_text = { { sym, hl } },
-- 							virt_text_pos = "right_align",
-- 						})
-- 					end
-- 				end
-- 			end)
-- 		end
--
-- 		local function updateGitStatus_for_buf(buf_id)
-- 			if not api.nvim_buf_is_valid(buf_id) then
-- 				return
-- 			end
-- 			local bname = safe_buf_name(buf_id)
-- 			local explorer_path = bname:match("^minifiles:.*(/.*)$")
-- 			if not explorer_path then
-- 				local ok, entry = pcall(mf.get_fs_entry, buf_id, 1)
-- 				if ok and entry and entry.path then
-- 					explorer_path = entry.path
-- 				end
-- 			end
-- 			local explorer_dir = explorer_path and path_to_dir(explorer_path) or path_to_dir(vim.uv.cwd())
--
-- 			-- check cached repo roots that prefix explorer_dir
-- 			for repo_root, cache in pairs(gitStatusCache) do
-- 				if explorer_dir:sub(1, #repo_root) == repo_root then
-- 					updateMiniWithGit(buf_id, cache.statusMap, cache.repo_root)
-- 					return
-- 				end
-- 			end
--
-- 			fetchGitStatus(explorer_dir, function(res)
-- 				if not res or not res.repo_root then
-- 					vim.schedule(function()
-- 						if api.nvim_buf_is_valid(buf_id) then
-- 							api.nvim_buf_clear_namespace(buf_id, nsGit, 0, -1)
-- 						end
-- 					end)
-- 					return
-- 				end
-- 				gitStatusCache[res.repo_root] =
-- 					{ time = vim.loop.now(), statusMap = res.statusMap, repo_root = res.repo_root }
-- 				updateMiniWithGit(buf_id, res.statusMap, res.repo_root)
-- 			end)
-- 		end
--
-- 		local function clearGitCache()
-- 			gitStatusCache = {}
-- 			_G.__mini_files_git_cache = gitStatusCache
-- 		end
--
-- 		-- Autocmds
-- 		vim.api.nvim_create_autocmd("User", {
-- 			pattern = "MiniFilesExplorerOpen",
-- 			callback = function(args)
-- 				local bufnr = args and args.data and args.data.buf_id or api.nvim_get_current_buf()
-- 				if api.nvim_buf_is_valid(bufnr) then
-- 					updateGitStatus_for_buf(bufnr)
-- 				end
-- 			end,
-- 		})
--
-- 		vim.api.nvim_create_autocmd("User", {
-- 			pattern = "MiniFilesBufferUpdate",
-- 			callback = function(args)
-- 				local bufnr = args and args.data and args.data.buf_id or api.nvim_get_current_buf()
-- 				if api.nvim_buf_is_valid(bufnr) then
-- 					updateGitStatus_for_buf(bufnr)
-- 				end
-- 			end,
-- 		})
--
-- 		vim.api.nvim_create_autocmd("User", {
-- 			pattern = "MiniFilesExplorerClose",
-- 			callback = function()
-- 				clearGitCache()
-- 				_G.__mini_files_last_path = nil
-- 			end,
-- 		})
--
-- 		-- Buffer-local keymaps
-- 		vim.api.nvim_create_autocmd("User", {
-- 			pattern = "MiniFilesBufferCreate",
-- 			callback = function(args)
-- 				local buf_id = args.data.buf_id
-- 				vim.keymap.set(
-- 					"n",
-- 					opts.mappings and opts.mappings.toggle_hidden or "g.",
-- 					toggle_dotfiles,
-- 					{ buffer = buf_id, desc = "Toggle hidden files" }
-- 				)
-- 				vim.keymap.set(
-- 					"n",
-- 					opts.mappings and opts.mappings.change_cwd or "gc",
-- 					files_set_cwd,
-- 					{ buffer = buf_id, desc = "Set cwd" }
-- 				)
-- 				map_split(buf_id, opts.mappings and opts.mappings.go_in_horizontal or "<C-w>s", "horizontal", false)
-- 				map_split(buf_id, opts.mappings and opts.mappings.go_in_vertical or "<C-w>v", "vertical", false)
-- 				map_split(buf_id, opts.mappings and opts.mappings.go_in_horizontal_plus or "<C-w>S", "horizontal", true)
-- 				map_split(buf_id, opts.mappings and opts.mappings.go_in_vertical_plus or "<C-w>V", "vertical", true)
-- 			end,
-- 		})
-- 	end,
-- }

-- Filename: ~/github/dotfiles-latest/neovim/neobean/lua/plugins/mini-files.lua
-- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/mini-files.lua
--
-- https://github.com/echasnovski/mini.files
--
-- I got this configuration from LazyVim.org
-- http://www.lazyvim.org/extras/editor/mini-files

-- I migrated my custom keymaps config and also the git status config to
-- separate files, as this file was growing too big
-- I also use this file as a centralized place for all the different keymaps,
-- including my custom ones
--
-- Load external modules first
local mini_files_km = require("config.modules.mini-files-km")

-- -- git config is slowing mini.files too much, so disabling it
local mini_files_git = require("config.modules.mini-files-git")

return {
  "nvim-mini/mini.files",
  opts = function(_, opts)
    -- I didn't like the default mappings, so I modified them
    -- Module mappings created only inside explorer.
    -- Use `''` (empty string) to not create one.
    opts.mappings = vim.tbl_deep_extend("force", opts.mappings or {}, {
      close = "q",
      -- Use this if you want to open several files
      go_in = "T",
      -- This opens the file, but quits out of mini.files (default L)
      go_in_plus = "t",
      -- I swapped the following 2 (default go_out: h)
      -- go_out_plus: when you go out, it shows you only 1 item to the right
      -- go_out: shows you all the items to the right
      go_out = "r",
      go_out_plus = "H",
      -- Default <BS>
      reset = "<BS>",
      -- Default @
      reveal_cwd = ".",
      show_help = "g?",
      -- Default =
      synchronize = "<cr>",
      trim_left = "<",
      trim_right = ">",

      -- Below I created an autocmd with the "," keymap to open the highlighted
      -- directory in a tmux pane on the right
    })

    -- Here I define my custom keymaps in a centralized place
    opts.custom_keymaps = {
      open_tmux_pane = "<M-t>",
      copy_to_clipboard = "<space>yy",
      zip_and_copy = "<space>yz",
      paste_from_clipboard = "<space>p",
      copy_path = "<M-c>",
      -- Don't use "i" as it conflicts wit insert mode
      preview_image = "<space>i",
      preview_image_popup = "<M-i>",
    }

    opts.windows = vim.tbl_deep_extend("force", opts.windows or {}, {
      preview = true,
      width_focus = 30,
      width_preview = 80,
    })

    opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
      -- Whether to use for editing directories
      -- Disabled by default in LazyVim because neo-tree is used for that
      use_as_default_explorer = true,
      -- If set to false, files are moved to the trash directory
      -- To get this dir run :echo stdpath('data')
      -- ~/.local/share/neobean/mini.files/trash
      permanent_delete = false,
    })
    return opts
  end,

  keys = {
    {
      -- Open the directory of the file currently being edited
      -- If the file doesn't exist because you maybe switched to a new git branch
      -- open the current working directory
      "<leader>e",
      function()
        local buf_name = vim.api.nvim_buf_get_name(0)
        local dir_name = vim.fn.fnamemodify(buf_name, ":p:h")
        if vim.fn.filereadable(buf_name) == 1 then
          -- Pass the full file path to highlight the file
          require("mini.files").open(buf_name, true)
        elseif vim.fn.isdirectory(dir_name) == 1 then
          -- If the directory exists but the file doesn't, open the directory
          require("mini.files").open(dir_name, true)
        else
          -- If neither exists, fallback to the current working directory
          require("mini.files").open(vim.uv.cwd(), true)
        end
      end,
      desc = "File explorer",
    },
    -- Open the current working directory
    {
      "<leader>E",
      function()
        require("mini.files").open(vim.uv.cwd(), true)
      end,
      desc = "File explorer in root",
    },
  },

  config = function(_, opts)
    -- Set up mini.files
    require("mini.files").setup(opts)
    -- Load custom keymaps
    mini_files_km.setup(opts)

    -- Load Git integration
    -- git config is slowing mini.files too much, so disabling it
    mini_files_git.setup()
  end,
}
