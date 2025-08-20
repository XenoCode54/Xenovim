return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		-- animate = {
		-- 	duration = 700, -- Adjust this value to increase animation speed
		-- 	total_duration = 200, -- Adjust this value to increase animation speed
		-- 	easing = "easeInOutSine",
		-- 	fps = 60,
		-- },
		picker = {
			sources = {
				explorer = {
					finder = "explorer",
					sort = { fields = { "sort" } },
					supports_live = true,
					tree = true,
					watch = true,
					diagnostics_open = true,
					git_status = true,
					git_status_open = true,
					git_untracked = true,
					follow_file = true,
					focus = "list",
					auto_close = true,
					layout = {
						preset = "ivy",
						reverse = false,
						layout = {
							reverse = false,
							border = "rounded",
							height = 0.99,
							width = 0.99,
						},
						preview = true,
					},
					win = {
						list = {
							keys = {
								["<BS>"] = "explorer_up",
								["t"] = "confirm",
								["h"] = "explorer_close", -- close directory
								["a"] = "explorer_add",
								["d"] = "explorer_del",
								["r"] = "explorer_rename",
								["c"] = "explorer_copy",
								["m"] = "explorer_move",
								["o"] = "explorer_open", -- open with system application
								["P"] = "toggle_preview",
								["y"] = { "explorer_yank", mode = { "n", "x" } },
								["p"] = "explorer_paste",
								["u"] = "explorer_update",
								["<c-c>"] = "tcd",
								["<leader>/"] = "picker_grep",
								["<c-t>"] = "terminal",
								["."] = "explorer_focus",
								["I"] = "toggle_ignored",
								["H"] = "toggle_hidden",
								["Z"] = "explorer_close_all",
								["]g"] = "explorer_git_next",
								["[g"] = "explorer_git_prev",
								["]d"] = "explorer_diagnostic_next",
								["[d"] = "explorer_diagnostic_prev",
								["]w"] = "explorer_warn_next",
								["[w"] = "explorer_warn_prev",
								["]e"] = "explorer_error_next",
								["[e"] = "explorer_error_prev",
							},
						},
					},
				},
			},
			theme = "ivy",
			prompt = " ",
			preset = "ivy_split",
			layout = {
				preset = "ivy_split",
				position = "bottom",
				layout = {
					-- position = "top",
					height = 0.3,
					-- width = 0.8,
					border = "rounded",
				},
			},
			-- prompt = " ",
			-- preset = "ivy",
			-- layout = {
			-- 	preset = "ivy",
			-- 	reverse = true,
			-- 	position = "top",
			-- 	layout = {
			-- 		-- position = "top",
			-- 		height = 0.99,
			-- 		width = 0.99,
			-- 		border = "rounded",
			-- 		-- {
			-- 		-- 	win = "vertical",
			-- 		-- 	width = 0.3,
			-- 		-- },
			-- 		-- {
			-- 		-- 	win = "preview",
			-- 		-- 	width = 0.7,
			-- 		-- },
			-- 	},
			-- },
			win = {
				-- input window
				input = {
					keys = {
						-- to close the picker on ESC instead of going to normal mode,
						-- add the following keymap to your config
						-- ["<Esc>"] = { "close", mode = { "n", "i" } },
						["/"] = "toggle_focus",
						["<C-Down>"] = { "history_forward", mode = { "i", "n" } },
						["<C-Up>"] = { "history_back", mode = { "i", "n" } },
						["<C-c>"] = { "close", mode = "i" },
						["<C-w>"] = { "<c-s-w>", mode = { "i" }, expr = true, desc = "delete word" },
						["<CR>"] = { "confirm", mode = { "n", "i" } },
						-- ["<Down>"] = { "list_down", mode = { "i", "n" } },
						["<Esc>"] = "close",
						["<S-CR>"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
						["<c-e>"] = { "select_and_prev", mode = { "i", "n" } },
						["<c-n>"] = { "select_and_next", mode = { "i", "n" } },
						-- ["<Up>"] = { "list_up", mode = { "i", "n" } },
						["<a-d>"] = { "inspect", mode = { "n", "i" } },
						["<a-f>"] = { "toggle_follow", mode = { "i", "n" } },
						["<a-h>"] = { "toggle_hidden", mode = { "i", "n" } },
						["<a-i>"] = { "toggle_ignored", mode = { "i", "n" } },
						["<a-m>"] = { "toggle_maximize", mode = { "i", "n" } },
						["<a-p>"] = { "toggle_preview", mode = { "i", "n" } },
						["<c-l>"] = { "cycle_win", mode = { "i", "n" } },
						["<c-a>"] = { "select_all", mode = { "n", "i" } },
						["<Up>"] = { "preview_scroll_up", mode = { "i", "n" } },
						["<c-k>"] = { "list_scroll_down", mode = { "i", "n" } },
						["<Down>"] = { "preview_scroll_down", mode = { "i", "n" } },
						["<c-g>"] = { "toggle_live", mode = { "i", "n" } },
						["<c-u>"] = { "list_down", mode = { "i", "n" } },
						["<c-d>"] = { "list_up", mode = { "i", "n" } },
						["<Tab>"] = { "list_down", mode = { "i", "n" } },
						["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
						["<c-q>"] = { "qflist", mode = { "i", "n" } },
						["<c-s>"] = { "edit_split", mode = { "i", "n" } },
						["<c-j>"] = { "list_scroll_up", mode = { "i", "n" } },
						["<c-v>"] = { "edit_vsplit", mode = { "i", "n" } },
						["?"] = "toggle_help_input",
						["G"] = "list_bottom",
						["gg"] = "list_top",
						["j"] = "list_down",
						["k"] = "list_up",
						["q"] = "close",
					},
				},
				-- result list window
				list = {
					keys = {
						["/"] = "toggle_focus",
						["<2-LeftMouse>"] = "confirm",
						["<CR>"] = "confirm",
						["<Esc>"] = "close",
						["<S-CR>"] = { { "pick_win", "jump" } },
						["<c-e>"] = { "select_and_prev", mode = { "n", "x" } },
						["<c-n>"] = { "select_and_next", mode = { "n", "x" } },
						["<a-d>"] = "inspect",
						["<a-f>"] = "toggle_follow",
						["<a-h>"] = "toggle_hidden",
						["<a-i>"] = "toggle_ignored",
						["<a-m>"] = "toggle_maximize",
						["<a-p>"] = "toggle_preview",
						["<c-l>"] = "cycle_win",
						["<c-a>"] = "select_all",
						["<Up>"] = "preview_scroll_up",
						["<c-d>"] = "list_scroll_down",
						["<Down>"] = "preview_scroll_down",
						["<Tab>"] = "list_down",
						["<S-Tab>"] = "list_up",
						["<c-s>"] = "edit_split",
						["<c-u>"] = "list_scroll_up",
						["<c-v>"] = "edit_vsplit",
						["?"] = "toggle_help_list",
						["G"] = "list_bottom",
						["gg"] = "list_top",
						["i"] = "focus_input",
						["k"] = "list_down",
						["j"] = "list_up",
						["q"] = "close",
						["zb"] = "list_scroll_bottom",
						["zt"] = "list_scroll_top",
						["zz"] = "list_scroll_center",
					},
				},
				-- preview window
				preview = {
					keys = {
						["<Esc>"] = "close",
						["q"] = "close",
						["i"] = "focus_input",
						["<ScrollWheelDown>"] = "list_scroll_wheel_down",
						["<ScrollWheelUp>"] = "list_scroll_wheel_up",
						["<a-w>"] = "cycle_win",
						["<c-l>"] = "cycle_win",
						["<CR>"] = "confirm",
					},
				},
			},
		},
		notifier = {
			enabled = true,
			timeout = 8000,
		},
		dashboard = {
			sections = {
				{ section = "header" },
				{
					pane = 2,
					section = "terminal",
					cmd = "colorscript -e square",
					height = 5,
					padding = 1,
				},
				{ section = "keys", gap = 1, padding = 1 },
				{
					pane = 2,
					icon = " ",
					title = "Recent Files",
					limit = 15,
					section = "recent_files",
					indent = 2,
					padding = 1,
				},
				{
					pane = 2,
					icon = " ",
					title = "Projects",
					section = "projects",
					indent = 2,
					padding = 1,
					limit = 6,
				},
				{
					pane = 2,
					icon = " ",
					title = "Git Status",
					section = "terminal",
					enabled = function()
						return Snacks.git.get_root() ~= nil
					end,
					cmd = "git status --short --branch --renames",
					height = 5,
					padding = 1,
					ttl = 5 * 60,
					indent = 3,
				},
				{ section = "startup" },
			},
			-- sections = {
			-- 	{
			-- 		section = "terminal",
			-- 		cmd = "chafa ~/custom_wallpapers/now/White Tailed Eagle.png --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
			-- 		height = 17,
			-- 		padding = 2,
			-- 	},
			-- 	{
			-- 		pane = 1,
			-- 		{ section = "header", gap = 1, padding = 1 },
			-- 	},
			-- 	{
			-- 		pane = 2,
			-- 		{ section = "keys", gap = 1, padding = 1 },
			-- 		{ section = "startup" },
			-- 	},
			--
			-- 	{ section = "recent_files", limit = 8, padding = 1, pane = 2 },
			-- },
			-- formats = {
			-- 	key = function(item)
			-- 		return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
			-- 	end,
			-- },
			-- sections = {
			-- 	-- { section = "terminal", cmd = "fortune -s | cowsay", hl = "header", padding = 1, indent = 8 },
			-- 	{ section = "header" },
			-- 	{ title = "MRU", padding = 1, pane = 2 },
			-- 	{ section = "recent_files", limit = 8, padding = 1, pane = 2 },
			-- 	{ title = "MRU ", file = vim.fn.fnamemodify(".", ":~"), padding = 1, pane = 2 },
			-- 	{ section = "recent_files", cwd = true, limit = 8, padding = 1, pane = 2 },
			-- 	{ title = "Sessions", padding = 1, pane = 2 },
			-- 	{ section = "projects", padding = 1, pane = 2 },
			-- 	{ title = "Bookmarks", padding = 1, pane = 2 },
			-- 	{ section = "keys", pane = 1 },
			-- },
			-- sections = {
			-- 	{ section = "header" },
			-- 	{
			-- 		pane = 2,
			-- 		section = "terminal",
			-- 		cmd = "colorscript -e square",
			-- 		height = 5,
			-- 		padding = 1,
			-- 	},
			-- 	{ section = "keys", gap = 1, padding = 1 },
			-- 	{ pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
			-- 	{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
			-- 	{
			-- 		pane = 2,
			-- 		icon = " ",
			-- 		title = "Git Status",
			-- 		section = "terminal",
			-- 		enabled = function()
			-- 			return Snacks.git.get_root() ~= nil
			-- 		end,
			-- 		cmd = "hub status --short --branch --renames",
			-- 		height = 5,
			-- 		padding = 1,
			-- 		ttl = 5 * 60,
			-- 		indent = 3,
			-- 	},
			-- 	{ section = "startup" },
			-- },
			preset = {
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						action = "lua Snacks.picker.projects()",
						desc = " Projects",
						icon = " ",
						key = "p",
					},
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{ icon = " ", key = "b", desc = "Search Note", action = ":ObsidianSearch" },
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{
						icon = "󰒲 ",
						key = "x",
						desc = "Lazy Extras",
						action = ":LazyExtras",
					},
					{
						icon = "󰒲 ",
						key = "l",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
				header = [[
-- ██╗  ██╗███████╗███╗   ██╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ╚██╗██╔╝██╔════╝████╗  ██║██╔═══██╗██║   ██║██║████╗ ████║
--  ╚███╔╝ █████╗  ██╔██╗ ██║██║   ██║██║   ██║██║██╔████╔██║
--  ██╔██╗ ██╔══╝  ██║╚██╗██║██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██╔╝ ██╗███████╗██║ ╚████║╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
                                                                                  
                                                          
	              [ Mac Xenon et NEOVIM ]
    ]],
			},
		},
	},
}
