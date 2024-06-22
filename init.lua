require("config.lazy")
-- setup must be called before loading the colorscheme
-- Default options:
-- t
-- At the top of your init.lua, ensure you've required the necessary vim functions
-- Pull in the wezterm API
-- local act = wezterm.action
--
--
-- -- In newer versions of wezterm, use the config_builder which will
-- -- help provide clearer error messages
-- if wezterm.config_builder then
-- 	config = wezterm.config_builder()
-- end
--
-- -- This is where you actually apply your config choices
-- config.default_prog = { "pwsh.exe" }
--
-- -- For example, changing the color scheme:
-- config.colors = {
-- 	-- background = "#1A1B26",
-- 	-- background = "#000000",
-- 	-- background = "#24283b",
-- 	background = "#222436",
-- 	-- cursor_bg = "#ffc777",
-- }
-- config.window_background_opacity = 0.9
-- -- config.win32_system_backdrop = "Acrylic"
-- -- config.win32_system_backdrop = "Tabbed"
-- -- config.win32_system_backdrop = "Mica"
-- config.animation_fps = 60

require("nvim-ts-autotag").setup({
	opts = {
		-- Defaults
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = true, -- Auto close on trailing </
	},
	-- Also override individual filetype configs, these take priority.
	-- Empty by default, useful if one of the "opts" global settings
	-- doesn't work well in a specific filetype
	per_filetype = {
		["html"] = {
			enable_close = true,
		},
	},
})

require("image").setup({
	backend = "kitty",
	integrations = {
		markdown = {
			enabled = true,
			clear_in_insert_mode = false,
			download_remote_images = true,
			only_render_image_at_cursor = false,
			filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
		},
		neorg = {
			enabled = true,
			clear_in_insert_mode = false,
			download_remote_images = true,
			only_render_image_at_cursor = false,
			filetypes = { "norg" },
		},
		html = {
			enabled = false,
		},
		css = {
			enabled = true,
		},
	},
	max_width = nil,
	max_height = nil,
	max_width_window_percentage = nil,
	max_height_window_percentage = 50,
	window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
	window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
	editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
	tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
	hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.svg" }, -- render image files as images when opened
})

-- require("obsidian").setup({
--   workspaces = {
--     -- {
--     --   name = "OmerVault",
--     --   path = "/Users/omerhamerman/Obsidian/Omervault",
--     -- },
--     {
--       name = "Notes",
--       path = "/home/xenon/Documents/Obsidian Vault",
--     },
--   },
--   completion = {
--     nvim_cmp = true,
--     min_chars = 2,
--   },
--   new_notes_location = "current_dir",
--   wiki_link_func = function(opts)
--     if opts.id == nil then
--       return string.format("[[%s]]", opts.label)
--     elseif opts.label ~= opts.id then
--       return string.format("[[%s|%s]]", opts.id, opts.label)
--     else
--       return string.format("[[%s]]", opts.id)
--     end
--   end,
--
--   mappings = {
--     -- "Obsidian follow"
--     ["<leader>of"] = {
--       action = function()
--         return require("obsidian").util.gf_passthrough()
--       end,
--       opts = { noremap = false, expr = true, buffer = true, desc = "Obsidian follow" },
--     },
--     -- Toggle check-boxes "obsidian done"
--     ["<leader>od"] = {
--       action = function()
--         return require("obsidian").util.toggle_checkbox()
--       end,
--       opts = { buffer = true, desc = "Toggle checkbox" },
--     },
--     -- Create a new newsletter issue
--     ["<leader>onn"] = {
--       action = function()
--         return require("obsidian").commands.new_note("Newsletter-Issue")
--       end,
--       opts = { buffer = true, desc = "Create a new newsletter issue" },
--     },
--     ["<leader>ont"] = {
--       action = function()
--         return require("obsidian").util.insert_template("Newsletter-Issue")
--       end,
--       opts = { buffer = true, desc = "Insert newsletter template" },
--     },
--   },
--
--   note_frontmatter_func = function(note)
--     -- This is equivalent to the default frontmatter function.
--     local out = { id = note.id, aliases = note.aliases, tags = note.tags, area = "", project = "" }
--
--     -- `note.metadata` contains any manually added fields in the frontmatter.
--     -- So here we just make sure those fields are kept in the frontmatter.
--     if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
--       for k, v in pairs(note.metadata) do
--         out[k] = v
--       end
--     end
--     return out
--   end,
--
--   note_id_func = function(title)
--     -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
--     -- In this case a note with the title 'My new note' will be given an ID that looks
--     -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
--     local suffix = ""
--     if title ~= nil then
--       -- If title is given, transform it into valid file name.
--       suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
--     else
--       -- If title is nil, just add 4 random uppercase letters to the suffix.
--       for _ = 1, 4 do
--         suffix = suffix .. string.char(math.random(65, 90))
--       end
--     end
--     return tostring(os.time()) .. "-" .. suffix
--   end,
--
--   templates = {
--     subdir = "Templates",
--     date_format = "%Y-%m-%d-%a",
--     time_format = "%H:%M",
--     tags = "",
--   },
-- })

vim.opt.termguicolors = true
-- -- config.font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Regular" })
-- -- config.font = wezterm.font("Hasklug Nerd Font Mono", { weight = "Light" })
-- -- config.font = wezterm.font("Iosevka Nerd Font Mono", { weight = "Light" })
-- -- You can specify some parameters to influence the font selection;
-- -- for example, this selects a Bold, Italic font variant.
-- -- config.font = wezterm.font("JetBrains Mono", { weight = "Light" })
--
-- config.window_frame = {
-- 	border_left_width = "0.5cell",
-- 	border_right_width = "0.5cell",
-- 	border_bottom_height = "0.25cell",
-- 	border_top_height = "0.25cell",
-- 	border_left_color = "#1A1B26",
-- 	border_right_color = "#1A1B26",
-- 	border_bottom_color = "#1A1B26",
-- 	border_top_color = "#1A1B26",
-- }
-- -- config.window_background_image = "C:/Users/Xenon/girl.jpg"
--
-- config.window_frame = {
-- 	-- inactive_titlebar_bg = "#353535",
-- 	inactive_titlebar_bg = "#000000",
-- 	active_titlebar_bg = "#1A1B26",
-- 	-- active_titlebar_bg = "#222436",
-- 	-- active_titlebar_bg = "#000000",
-- 	inactive_titlebar_fg = "#cccccc",
-- 	active_titlebar_fg = "#ffffff",
-- 	inactive_titlebar_border_bottom = "#1A1B26",
-- 	active_titlebar_border_bottom = "#1A1B26",
-- 	button_fg = "#cccccc",
-- 	button_bg = "#1A1B26",
-- 	button_hover_fg = "#ffffff",
-- 	button_hover_bg = "#1A1B26",
-- }
--
-- config.window_padding = {
-- 	left = 2,
-- 	right = 2,
-- 	top = 10,
-- 	bottom = 0,
-- }
-- -- config.window_background_image_hsb = {
-- --   -- Darken the background image by reducing it to 1/3rd
-- --   brightness = 0.9,
--
-- --   -- You can adjust the hue by scaling its value.
-- --   -- a multiplier of 1.0 leaves the value unchanged.
-- --   hue = 1.0,
--
-- --   -- You can adjust the saturation also.
-- --   saturation = 1.0,
-- -- }
--
-- config.keys = {
-- 	{
-- 		key = "n",
-- 		mods = "SHIFT|CTRL",
-- 		action = wezterm.action.ToggleFullScreen,
-- 	},
-- }
--
-- config.keys = {
-- 	-- Create a new tab in the same domain as the current pane.
-- 	-- This is usually what you want.
-- 	{
-- 		key = "t",
-- 		mods = "SHIFT|ALT",
-- 		action = act.SpawnTab("CurrentPaneDomain"),
-- 	},
-- 	-- Create a new tab in the default domain
-- 	{ key = "t", mods = "SHIFT|ALT", action = act.SpawnTab("DefaultDomain") },
-- 	-- Create a tab in a named domain
-- 	{
-- 		key = "t",
-- 		mods = "SHIFT|ALT",
-- 		action = act.SpawnTab({
-- 			DomainName = "unix",
-- 		}),
-- 	},
-- }
--
-- config.keys = {}
-- for i = 1, 8 do
-- 	-- CTRL+ALT + number to activate that tab
-- 	table.insert(config.keys, {
-- 		key = tostring(i),
-- 		mods = "CTRL",
-- 		action = act.ActivateTab(i - 1),
-- 	})
-- 	-- F1 through F8 to activate that tab
-- 	table.insert(config.keys, {
-- 		key = "F" .. tostring(i),
-- 		action = act.ActivateTab(i - 1),
-- 	})
-- end
--
-- -- and finally, return the configuration to wezterm
-- return config
--
--
--

-- Set the GUI font
-- vim.opt.guifont = "JetBrainsMonoNerdFont-Medium"
-- vim.opt.guifont = "JetBrainsMono Nerd Font"
-- vim.opt.guifont = "JetBrainsMonoNerdFont-Medium:h12"

-- Enable icons for file nodes
-- vim.g.WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = 1
local user = "XENON"
local ai = "BELLA"
require("CopilotChat").setup({
	question_header = "   " .. user .. " ",
	answer_header = "   " .. ai .. " ",
	context = "buffers", -- Default context to use, 'buffers', 'buffer' or none (can be specified manually in prompt via @).
	show_help = false, -- Shows help message as virtual lines when waiting for user input
	window = {
		layout = "float",
		width = 0.8, -- fractional width of parent
		height = 0.6, -- fractional height of parent
		relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
		title = "", -- title of chat window
	},
})

local cmd = vim.cmd
local fn = vim.fn
require("highlight-undo").setup({
	duration = 2000,
})
-- Place this code in your init.lua
cmd([[
augroup my_neotree_configs
    autocmd!
    autocmd FileType neotree lua ToggleNeotreePreview()
augroup END
]])
-- Define the Lua function to toggle the preview
_G.ToggleNeotreePreview = function()
	fn.defer_fn(function()
		cmd("normal P")
	end, 50) -- Delay of 50ms
end

-- vim.cmd("set colorcolumn=107")

-- local function my_custom_on_attach(client, bufnr) end

-- Sourcegraph configuration. All keys are optional
-- require("sg").setup({
--   chatModel = "ChatGPT 4 Turbo Preview",
--   -- width = 200,
--   -- Pass your own custom attach function
--   --    If you do not pass your own attach function, then the following maps are provide:
--   --        - gd -> goto definition
--   --        - gr -> goto references
--   on_attach = my_custom_on_attach,
-- })
vim.api.nvim_set_hl(0, "CmpItemKindCody", { fg = "#7aa2f7" })

-- vim.g.sg_nvim_node_executable = "C:\\Program Files\\nodejs\\node.exe"
vim.g.codeium_log_level = "INFO"
-- Neovide settings start
-- vim.opt.guifont = "JetBrainsMonoNerdFontCompleteM"
vim.opt.guifont = "JetBrains Mono:h12"
-- vim.opt.guifont = "DejaVu Sans Mono"
vim.g.neovide_transparency = 0.9
vim.g.neovide_fullscreen = false
vim.g.neovide_refresh_rate = 60
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_cursor_vfx_mode = "ripple"
vim.g.neovide_background_color = "#7aa2f7"

--
-- vim.api.nvim_set_hl(0, "Normal", { fg = "none", bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { fg = "none", bg = "none" })

vim.wo.cursorline = false
-- Default options:
-- require("gruvbox").setup({
--   terminal_colors = true, -- add neovim terminal colors
--   undercurl = true,
--   underline = true,
--   bold = true,
--   italic = {
--     strings = true,
--     emphasis = true,
--     comments = true,
--     operators = false,
--     folds = true,
--   },
--   strikethrough = true,
--   invert_selection = false,
--   invert_signs = false,
--   invert_tabline = false,
--   invert_intend_guides = false,
--   inverse = true, -- invert background for search, diffs, statuslines and errors
--   contrast = "hard", -- can be "hard", "soft" or empty string
--   palette_overrides = {},
--   overrides = {},
--   dim_inactive = false,
--   transparent_mode = true,
-- })
-- vim.cmd("colorscheme gruvbox")
-- Keep cursor fat like in vim
-- vim.opt.guicursor = "n-v-c:block-Cursor/1Cursor-blinkon0,i-ci:block-Cursor/1Cursor,r-cr:hor20-Cursor/1Cursor"
-- Make the cursor normalnn
vim.opt.guicursor = "n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor"

-- Change and sync color of cursor to lua line
vim.cmd("augroup custom_cursor")
vim.cmd("autocmd!")
vim.cmd("highlight Cursor guifg=none guibg=#7aa2f7")
vim.cmd("autocmd InsertEnter * highlight Cursor guibg=#9ece6a")
vim.cmd("autocmd InsertLeave * highlight Cursor guibg=#7aa2f7")
vim.cmd("augroup END")

-- vim.cmd("autocmd!")
-- vim.cmd("augroup custom_cursor")
-- vim.cmd("highlight Cursor guifg=none guibg=#a89984")
-- vim.cmd("autocmd InsertEnter * highlight Cursor guibg=#83a598")
-- vim.cmd("autocmd InsertLeave * highlight Cursor guibg=#a89984")
-- vim.cmd("augroup END")

-- vim.cmd("augroup custom_cursor")
-- vim.cmd("autocmd!")
-- vim.cmd("highlight Cursor guifg=none guibg=#ffcc00")
-- vim.cmd("autocmd InsertEnter * highlight Cursor guibg=#bfe48b")
-- vim.cmd("autocmd InsertLeave * highlight Cursor guibg=#ffcc00")
-- vim.cmd("augroup END")

-- vim.cmd("autocmd InsertEnter * norm zz")

-- -- Set the highlight group for the Cursor
-- require("codewindow").setup({
--   minitap_width = 10,
--   max_minimap_height = 20,
-- })

-- require("nvim-treesitter.configs").setup({
--   rainbow = {
--     enable = true,
--     -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
--     extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
--     -- max_file_lines = nil, -- Do not enable for files with more than n lines, int
--     -- colors = {}, -- table of hex strings
--     -- termcolors = {} -- table of colour name strings
--   },
-- })

require("goto-preview").setup({
	width = 120, -- Width of the floating window
	height = 25, -- Height of the floating window
	border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
	default_mappings = false, -- Bind default mappings
	debug = false, -- Print debug information
	opacity = 0, -- 0-100 opacity level of the floating window where 100 is fully transparent.
	resizing_mappings = true, -- Binds arrow keys to resizing the floating window.
	post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
	-- references = { -- Configure the telescope UI for slowing the references cycling window.
	--   telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
	-- },
	-- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
	focus_on_open = true, -- Focus the floating window when opening it.
	dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
	force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
	bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
	stack_floating_preview_windows = true, -- Whether to nest floating windows
	preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
})

-- require("codewindow").apply_default_keybinds()
require("telescope").setup({
	defaults = {
		-- layout_strategy = "vertical",
		layout_config = { height = 0.95 },
		mappings = {
			i = {
				-- ["<C-u>"] = false,
				-- ["<C-d>"] = false,
				["<C-e>"] = "preview_scrolling_up",
				["<C-n>"] = "preview_scrolling_down",
			},
			n = {
				["n"] = "move_selection_next",
				["e"] = "move_selection_previous",
				["<C-e>"] = "preview_scrolling_up",
				["<C-n>"] = "preview_scrolling_down",
			},
		},
	},
	--   layout_config = {
	--     vertical = { width = 1, height = 1 },
	--     -- other layout configuration here
	--   },
	--   -- other defaults configuration here
	--   theme = "dropdown",
	-- },
	-- pickers = {
	--   theme = "dropdown",
	--   find_files = {
	--     theme = "dropdown",
	--   },
	--   git_files = {
	--     theme = "dropdown",
	--   },
	--   lsp_definitions = {
	--     theme = "dropdown",
	--   },
	--   buffers = {
	--     theme = "dropdown",
	--   },
	-- },
	-- other configuration values here
})

vim.api.nvim_set_keymap(
	"i",
	"<Tab>",
	'pumvisible() ? "<C-n>" : "<Tab>"',
	{ expr = true, noremap = true, silent = true }
)

-- require("neodim").setup({
--   alpha = 0.3, -- make the dimmed text even dimmer
--   hide = {
--     virtual_text = false,
--     signs = false,
--     underline = false,
--   },
--   blend_color = "#1a1b26",
--   -- blend_color = "#282828",
-- })

require("refactoring").setup({
	-- overriding printf statement for cpp
	printf_statements = {
		-- add a custom printf statement for cpp
		cpp = {
			'std::cout << "%s" << std::endl;',
		},
	},
	-- prompt for return type
	prompt_func_return_type = {
		go = true,
		cpp = true,
		c = true,
		java = true,
	},
	-- prompt for function parameters
	prompt_func_param_type = {
		go = true,
		cpp = true,
		c = true,
		java = true,
	},
})

require("gitsigns").setup({
	-- signs = {
	--   add = { text = "│" },
	--   change = { text = "│" },
	--   delete = { text = "_" },
	--   topdelete = { text = "‾" },
	--   changedelete = { text = "~" },
	--   untracked = { text = "┆" },
	-- },
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 0,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
})

-- require("gruvbox").setup({
--   transparent_mode = true,
-- })
-- vim.cmd("colorscheme gruvbox")
local colors = require("tokyonight.colors").setup()
require("tokyonight").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	light_style = "night", -- The theme is used when the background is set to light
	transparent = true, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	styles = {
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "transparent", -- style for sidebars, see below
		floats = "transparent", -- style for floating windows
	},
	sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
	dim_inactive = true, -- dims inactive windows
	lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
})
vim.cmd("colorscheme tokyonight")

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "tokyonight",
	-- group = ...,
	callback = function()
		vim.api.nvim_set_hl(0, "CopilotSuggestion", {
			-- fg = "#555555",
			fg = "#555b8a",
			ctermfg = 8,
			force = true,
		})
	end,
})

-- vim.cmd("highlight ColorColumn guibg=#3e7478")
-- vim.cmd("highlight ColorColumn guibg=#000000")
vim.cmd("highlight ColorColumn guibg=none")

require("scrollbar").setup({
	handle = {
		-- color = colors.bg_highlight,
		--#1a1b26
		-- color = "#282828",
		-- color = "#1a1b26",
		-- color = "#9c8e7c",
		-- color = "#ffc777",
		-- color = "#9ece6a",
		-- color = "#ffcc00",
		-- color = "#84ffff",
		-- color = "#3e7478",
		color = "#000000",
	},
	marks = {
		Search = { color = colors.orange },
		Error = { color = colors.error },
		Warn = { color = colors.warning },
		Info = { color = colors.info },
		Hint = { color = colors.hint },
		Misc = { color = colors.purple },
	},
})

require("sos").setup({
	-- Whether to enable the plugin
	enabled = true,

	-- Time in ms after which `on_timer()` will be called. By default, `on_timer()`
	-- is called 20 seconds after the last buffer change. Whenever an observed
	-- buffer changes, the global timer is statartarted (or reset, if it was already
	-- started), and a countdown of `timeout` milliseconds begins. Further buffer
	-- changes will then debounce the timer. After firing, the timer is not
	-- started again until the next buffer change.
	timeout = 20000,

	-- Set, and manage, Vim's 'autowrite' option (see :h 'autowrite'). Allowing
	-- sos to "manage" the option makes it so that all autosaving functionality
	-- can be enabled or disabled altogether in a synchronized fashion as
	-- otherwise it is possible for autosaving to still occur even after sos has
	-- been explicitly disabled (via :SosDisable for example). There are 3
	-- possible values:
	--
	--     "all": set and manage 'autowriteall'
	--
	--     true: set and manage 'autowrite'
	--
	--     false: don't set, touch, or manage any of Vim's 'autowwrite' options
	autowrite = true,

	-- Automatically write all modified buffers before executing a command on
	-- the cmdline. Aborting the cmdline (e.g. via `<Esc>`) also aborts the
	-- write. The point of this is so that you don't have to manually write a
	-- buffer before running commands such as `:luafile`, `:source`, or a `:!`
	-- shell command which reads files (such as git or a code formatter).
	-- Autocmds will be executed as a result of the writing (i.e. `nested = true`).
	--
	--     false: don't write changed buffers prior to executing a command
	--
	--     "all": write on any `:` command that gets executed (but not `<Cmd>`
	--            mappings)
	--
	--     "some": write only if certain commands (source/luafile etc.) appear
	--             in the cmdline (not perfect, but may lead to fewer unneeded
	--             file writes; implementation still needs some work, see
	--             lua/sos/impl.lua)
	--
	--     table<string, true>: table that specifies which commands should trigger
	--                          a write
	--                          keys: the full/long names of commands that should
	--                                trigger write
	--                          values: true
	save_on_cmd = "some",

	-- Save/write a changed buffer before leaving it (i.e. on the `BufLeave`
	-- autocmd event). This will lead to fewer buffers having to be written
	-- at once when the global/shared timer fires. Another reason for this is
	-- the fact that neither `'autowrite'` nor `'autowriteall'` cover this case,
	-- so it combines well with those options too.
	save_on_bufleave = true,

	-- Save all buffers when Neovim loses focus. This is provided because
	-- 'autowriteall' does not cover this case. It is particularly useful when
	-- swapfiles have been disabled and you (knowingly or unknowingly) start
	-- editing the same file in another Neovim instance while having unsaved
	-- changes. It helps keep the file/version on the filesystem synchronized
	-- with your latest changes when switching applications so that another
	-- application won't accidentally open old versions of files that you are
	-- still currently editing. Con: it could be that you actually intended to
	-- open an older version of a file in another application/Neovim instance,
	-- although in that case you're probably better off disabling autosaving
	-- altogether (or keep it enabled but utilize a VCS to get the version you
	-- need - that is, if you commit frequently enough).
	save_on_focuslost = true,

	-- Predicate fn which receives a buf number and should return true if it
	-- should be observed for changes (i.e. whether the buffer should debounce
	-- the shared/global timer). You probably don't want to change this unless
	-- you absolutely need to and know what you're doing. Setting this option
	-- will replace the default fn/behavior which is to observe buffers which
	-- have: a normal 'buftype', 'ma', 'noro'. See lua/sos/impl.lua for the
	-- default behavior/fn.
	---@type fun(bufnr: integer): boolean
	-- should_observe_buf = require("sos.impl").should_observe_buf,

	-- The function that is called when the shared/global timer fires. You
	-- probably don't want to change this unless you absolutely need to and know
	-- what you're doing. Setting this option will replace the default
	-- fn/behavior, which is simply to write all modified (i.e. 'mod' option is
	-- set) buffers. See lua/sos/impl.lua for the default behavior/fn. Any value
	-- returned by this function is ignored. `vim.api.*` can be used inside this
	-- fn (this fn will be called with `vim.schedule()`).
	-- on_timer = require("sos.impl").on_timer,
})

require("nvim-treesitter.configs").setup({
	rainbow = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
})

-- require("nvim-ts-autotag").setup()
-- print("vim o shell", vim.o.shell)
require("toggleterm").setup({
	size = 50,
	autochdir = true,
	-- shell = "pwsh",
	-- shell = "C:\\Program Files\\Git\\bin\\bash.exe", -- replace with your path to Git Bash
	-- shell = "C:\\ProgramFiles\\Git\\bin\\bash.exe",
	-- shell = "bash",
	shell = vim.o.shell,
	-- shell = "C:\\Program Files\\Git\\bin\\bash.exe -c 'cd /usr/bin && exec bash'",
	-- direction = "float",
	persist_size = true,
	hide_numbers = false,
	persist_mode = true,
	auto_scroll = true,
	shade_terminals = true,
	shading_factor = -3,
	float_opts = {
		border = "curved",
		winblend = 3,
		highlights = {
			border = "Normal",
			background = "Transparent",
		},
	},
	winbar = {
		enabled = true,
		name_formatter = function(term) --  term: Terminal
			return term.name
		end,
	},
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "hh", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-n>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-e>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-i>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- require("nvim-treesitter.configs").setup({
--   highlight = {
--     enable = false,
--   },
-- })
require("nvim-lightbulb").setup({ autocmd = { enabled = true } })

vim.opt.scrolloff = 11

-- Material deep ocean
--Lua:
-- vim.g.material_style = "deep ocean"
-- vim.g.material_disable_background = 0

-- require("material").setup({
--
--   contrast = {
--     terminal = true, -- Enable contrast for the built-in terminal
--     sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
--     floating_windows = false, -- Enable contrast for floating windows
--     cursor_line = false, -- Enable darker background for the cursor line
--     non_current_windows = true, -- Enable contrasted background for non-current windows
--     filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
--   },
--
--   styles = { -- Give comments style such as bold, italic, underline etc.
--     comments = { [[ italic = true ]] },
--     strings = { [[ bold = true ]] },
--     keywords = { [[ underline = true ]] },
--     functions = { [[ bold = true, undercurl = true ]] },
--     variables = {},
--     operators = {},
--     types = {},
--   },
--
--   plugins = { -- Uncomment the plugins that you use to highlight them
--     -- Available plugins:
--     "dap",
--     "dashboard",
--     "gitsigns",
--     "hop",
--     "indent-blankline",
--     "lspsaga",
--     "mini",
--     "neogit",
--     "neorg",
--     "nvim-cmp",
--     "nvim-navic",
--     "nvim-tree",
--     "nvim-web-devicons",
--     "sneak",
--     "telescope",
--     "trouble",
--     -- "which-key",
--   },
--
--   disable = {
--     colored_cursor = false, -- Disable the colored cursor
--     borders = false, -- Disable borders between vertically split windows
--     background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
--     term_colors = false, -- Prevent the theme from setting terminal colors
--     eob_lines = false, -- Hide the end-of-buffer lines
--   },
--
--   high_visibility = {
--     lighter = false, -- Enable higher contrast text for lighter style
--     darker = false, -- Enable higher contrast text for darker style
--   },
--
--   lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )
--
--   async_loading = true, -- Load parts of the theme asynchronously for faster startup (turned on by default)
--
--   custom_colors = nil, -- If you want to everride the default colors, set this to a function
--
--   custom_highlights = {}, -- Overwrite highlights with your own
-- })
-- vim.g.material_disable_background = 0

require("mini.files").setup({
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
})

-- to use this, make sure to set `opts.modes.char.enabled = false`
local Config = require("flash.config")
local Char = require("flash.plugins.char")
for _, motion in ipairs({ "f", "t", "F", "T" }) do
	vim.keymap.set({ "n", "x", "o" }, motion, function()
		require("flash").jump(Config.get({
			mode = "char",
			search = {
				mode = Char.mode(motion),
				max_length = 1,
			},
		}, Char.motions[motion]))
	end)
end

require("notify").setup({
	background_colour = "#000000",
})

vim.cmd([[highlight IndentBlanklineIndent1 guifg=#24283b gui=nocombine]])

vim.opt.list = true
vim.opt.listchars:append("space:⋅")

-- vim.opt.listchars:append("eol:↴")

-- require("indent_blankline").setup({
--   space_char_blankline = " ",
--   show_current_context = true,
--   show_current_context_start = true,
--   char_highlight_list = {
--     "IndentBlanklineIndent1",
--   },
--   show_trailing_blankline_indent = false,
-- })
--
-- require("ibl").setup({
--   scope = {
--     enabled = true,
--     show_start = true,
--     show_end = false,
--     injected_languages = false,
--     highlight = { "Function", "Label", "Operator", "Keyword" },
--     priority = 500,
--   },
-- })

-- vim.cmd([[
-- command! LazyMerge term lazygit
-- autocmd TermClose * DiffviewOpen
-- ]])

-- Lua configuration
local glance = require("glance")
local actions = glance.actions

glance.setup({
	height = 30, -- Height of the window
	zindex = 45,

	-- By default glance will open preview "embedded" within your active window
	-- when `detached` is enabled, glance will render above all existing windows
	-- and won't be restiricted by the width of your active window
	detached = true,

	-- Or use a function to enable `detached` only when the active window is too small
	-- (default behavior)
	detached = function(winid)
		return vim.api.nvim_win_get_width(winid) < 100
	end,

	preview_win_opts = { -- Configure preview window options
		cursorline = true,
		number = true,
		wrap = true,
	},
	border = {
		enable = true, -- Show window borders. Only horizontal borders allowed
		top_char = "―",
		bottom_char = "―",
	},
	list = {
		position = "right", -- Position of the list window 'left'|'right'
		width = 0.33, -- 33% width relative to the active window, min 0.1, max 0.5
	},
	theme = { -- This feature might not work properly in nvim-0.7.2
		enable = true, -- Will generate colors for the plugin based on your current colorscheme
		mode = "brighten", -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme
	},
	mappings = {
		list = {
			["n"] = actions.next, -- Bring the cursor to the next item in the list
			["e"] = actions.previous, -- Bring the cursor to the previous item in the list
			["<Down>"] = actions.next,
			["<Up>"] = actions.previous,
			["<Tab>"] = actions.next_location, -- Bring the cursor to the next location skipping groups in the list
			["<S-Tab>"] = actions.previous_location, -- Bring the cursor to the previous location skipping groups in the list
			["N"] = actions.preview_scroll_win(5),
			["E"] = actions.preview_scroll_win(-5),
			["v"] = actions.jump_vsplit,
			["s"] = actions.jump_split,
			["t"] = actions.jump_tab,
			["<CR>"] = actions.jump,
			["l"] = actions.open_fold,
			["h"] = actions.close_fold,
			["<C-c>"] = actions.close,
			["<C-h>"] = actions.enter_win("preview"), -- Focus preview window
			["<i>"] = actions.enter_win("preview"), -- Focus preview window
			["q"] = actions.close,
			["Q"] = actions.close,
			["<Esc>"] = actions.close,
			["o"] = actions.quickfix,
			-- ['<Esc>'] = false -- disable a mapping
		},
		preview = {
			["Q"] = actions.close,
			["<C-c>"] = actions.close,
			["<Tab>"] = actions.next_location,
			["<S-Tab>"] = actions.previous_location,
			["<A-o>"] = actions.jump,
			["<C-h>"] = actions.enter_win("list"), -- Focus list window
		},
	},
	hooks = {},
	folds = {
		fold_closed = "",
		fold_open = "",
		folded = true, -- Automatically fold list on startup
	},
	indent_lines = {
		enable = true,
		icon = "│",
	},
	winbar = {
		enable = true, -- Available starting from nvim-0.8+
	},
})

require("treesitter-context").setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	max_lines = 2, -- How many lines the window should span. Values <= 0 mean no limit.
	min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	line_numbers = true,
	multiline_threshold = 20, -- Maximum number of lines to show for a single context
	trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
	-- Separator between context and content. Should be a single character string, like '-'.
	-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
	separator = "=",
	zindex = 20, -- The Z-index of the context window
	on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})

-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if client.server_capabilities.inlayHintProvider then
--       vim.lsp.inlay_hint(args.buf, true)
--     end
--     -- whatever other lsp config you want
--   end,
-- })

vim.diagnostic.config({ virtual_text = true })

require("rainbow-delimiters.setup").setup({})

require("lab").setup({
	code_runner = {
		enabled = true,
	},
	quick_data = {
		enabled = true,
	},
})

require("telescope").setup({
	extensions = {
		media_files = {
			-- filetypes whitelist
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "webm", "pdf" },
			-- find command (defaults to `fd`)
			find_cmd = "rg",
		},
	},
})

-- local cmp = require("cmp")

-- cmp.setup({
--   sources = cmp.config.sources({
--     { name = "cody" },
--     -- keep existing sources
--   }),
-- })
-- cmp.setup({
--   sources = cmp.config.sources({
--     -- Keep existing sources
--     { name = "cody" },
--     { name = "Codeium" },
--     { name = "Tabnine" },
--     { name = "nvim_lsp" },
--     { name = "luasnip" },
--     { name = "buffer" },
--     { name = "path" },
--
--     -- Add Cody as a new source
--   }),
-- })

-- cmp.setup.filetype({
--   -- list of filetypes
--   "python",
--   "javascript",
--   "typescript",
--   "html",
--   "lua",
--   "rust",
--   "typescriptreact",
--   "javascriptreact",
--   "vue",
--   "css",
--   "scss",
--   "json",
--   "yaml",
--   "markdown",
-- }, {
--   sources = cmp.config.sources({
--     -- other sources for this filetype
--     { name = "cody" },
--     { name = "Codeium" },
--     { name = "Tabnine" },
--     { name = "nvim_lsp" },
--     { name = "luasnip" },
--     { name = "buffer" },
--     { name = "path" },
--   }),
-- })
--
require("actions-preview").setup({
	diff = {
		algorithm = "patience",
		ignore_whitespace = true,
	},
	-- telescope = require("telescope.themes").get_dropdown({ winblend = 10 }),
	telescope = {
		sorting_strategy = "ascending",
		-- layout_strategy = "vertical",
		-- layout_config = {
		--   width = 0.6,
		--   height = 0.7,
		--   prompt_position = "top",
		--   preview_cutoff = 20,
		--   preview_height = function(_, _, max_lines)
		--     return max_lines - 15
		--   end,
		-- },
	},
})

-- require("obsidian").setup()
-- require("lspconfig").tsserver.setup({
--   on_attach = function(client, bufnr)
--     local ts_utils = require("nvim-lsp-ts-utils")
--     ts_utils.setup({})
--     ts_utils.setup_client(client)
--
--     -- Optional: setup key mappings
--     local opts = { silent = true, desc = "Import All Missing" }
--     -- vim.api.nvim_buf_set_keymap(bufnr, "n", "oi", ":TSLspOrganize<CR>", opts)
--     vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ci", ":TSLspImportAll<CR>", opts)
--     -- Inlay hints
--     vim.lsp.inlay_hint(bufnr)
--   end,
--   -- Add any additional lspconfig settings here
-- })

-- local dap = require("dap")
-- -- print("home dir: ", os.getenv("HOME"))
--
-- dap.adapters.chrome = {
--   type = "executable",
--   command = "node",
--   args = { os.getenv("HOME") .. "/vscode-chrome-debug/out/src/chromeDebug.js" }, -- TODO adjust
-- }
--
-- dap.configurations.javascriptreact = { -- change this to javascript if needed
--   {
--     type = "chrome",
--     request = "attach",
--     program = "${file}",
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = "inspector",
--     port = 9222,
--     webRoot = "${workspaceFolder}",
--   },
-- }
--
-- dap.configurations.typescriptreact = { -- change to typescript if needed
--   {
--     type = "chrome",
--     request = "attach",
--     program = "${file}",
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = "inspector",
--     port = 9222,
--     webRoot = "${workspaceFolder}",
--   },
-- }
-- vim.cmd("colorscheme tokyonight")
-- vim.cmd.colorscheme("catppuccin")
require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true, -- disables setting the background color.
	show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
	term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
	dim_inactive = {
		enabled = false, -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15, -- percentage of the shade to apply to the inactive window
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	no_underline = false, -- Force no underline
	styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
		comments = { "italic" }, -- Change the style of comments
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
		-- miscs = {}, -- Uncomment to turn off hard-coded styles
	},
	color_overrides = {},
	custom_highlights = {},
	default_integrations = true,
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- setup must be called before loading
-- vim.cmd.colorscheme("catppuccin")

-- Check if the current buffer is suitable for the LSP to activate
-- local function lsp_buffer_enabled()
--   local filetype = vim.bo.filetype
--   -- Disable LSP for terminal and other non-code filetypes
--   return not (filetype == "" or filetype == "TelescopePrompt" or filetype == "terminal")
-- end

-- Only initialize the LSP client if it's enabled for the buffer
-- if lsp_buffer_enabled() then
--   require("lspconfig").your_language_server.setup()
-- end
