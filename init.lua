-- bootstrap lazy.nvim, LazyVim and your pluginsgru
require("config.lazy")
-- setup must be called before loading the colorscheme
-- Default options:
--
-- At the top of your init.lua, ensure you've required the necessary vim functions
local cmd = vim.cmd
local fn = vim.fn
require("highlight-undo").setup({
  duration = 5000,
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

vim.g.sg_nvim_node_executable = "C:\\Program Files\\nodejs\\node.exe"

-- Neovide settings start
vim.g.neovide_transparency = 0.97
vim.g.neovide_fullscreen = false
vim.g.neovide_refresh_rate = 60
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_background_color = "#ff0000"
-- Neovide settings end
--
vim.api.nvim_set_hl(0, "Normal", { fg = "none", bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = "none", bg = "none" })

vim.wo.cursorline = false

-- Keep cursor fat like in vim
vim.opt.guicursor = "n-v-c:block-Cursor/1Cursor-blinkon0,i-ci:block-Cursor/1Cursor,r-cr:hor20-Cursor/1Cursor"

-- Change and sync color of cursor to lua line
vim.cmd("augroup custom_cursor")
vim.cmd("autocmd!")
vim.cmd("highlight Cursor guifg=none guibg=#7aa2f7")
vim.cmd("autocmd InsertEnter * highlight Cursor guibg=#9ece6a")
vim.cmd("autocmd InsertLeave * highlight Cursor guibg=#7aa2f7")
vim.cmd("augroup END")

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

--
-- require("codewindow").apply_default_keybinds()
require("telescope").setup({
  defaults = {
    layout_strategy = "vertical",
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

require("neodim").setup({
  alpha = 0.3, -- make the dimmed text even dimmer
  hide = {
    virtual_text = false,
    signs = false,
    underline = false,
  },
  blend_color = "#1a1b26",
  -- blend_color = "#282828",
})

require("refactoring").setup({
  -- overriding printf statement for cpp
  printf_statements = {
    -- add a custom printf statement for cpp
    cpp = {
      'std::cout << "%s" << std::endl;',
    },
  },
})

require("refactoring").setup({
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
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },
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
require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "night", -- The theme is used when the background is set to light
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "transparent", -- style for sidebars, see below
    floats = "transparent", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = true, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
})

local colors = require("tokyonight.colors").setup()

require("scrollbar").setup({
  handle = {
    -- color = colors.bg_highlight,
    --#1a1b26
    -- color = "#282828",
    color = "#1a1b26",
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
  -- buffer before running commands such as `:luafile`, `:soruce`, or a `:!`
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

require("nvim-ts-autotag").setup()

require("toggleterm").setup({
  size = 70,
  autochdir = true,
  shell = "pwsh",
  direction = "vertical",
  persist_size = true,
  persist_mode = true,
  auto_scroll = true,
  float_opts = {
    border = "curved",
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
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
-- vim.g.material_disable_background = 1
--
-- require("material").setup({
--
--   contrast = {
--     terminal = true, -- Enable contrast for the built-in terminal
--     sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
--     floating_windows = true, -- Enable contrast for floating windows
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
--     borders = false, -- Disable borders between verticaly split windows
--     background = true, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
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
--   async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
--
--   custom_colors = nil, -- If you want to everride the default colors, set this to a function
--
--   custom_highlights = {}, -- Overwrite highlights with your own
-- })
-- vim.g.material_disable_background = 1

require("mini.files").setup({
  mappings = {
    close = "q",
    go_in = "T",
    go_in_plus = "t",
    go_out = "b",
    go_out_plus = "H",
    reset = "<BS>",
    show_help = "g?",
    synchronize = "=",
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
    width_nofocus = 30,
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
  height = 20, -- Height of the window
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
      ["<C-h>"] = actions.enter_win("preview"), -- Focus preview window
      ["q"] = actions.close,
      ["Q"] = actions.close,
      ["<Esc>"] = actions.close,
      ["o"] = actions.quickfix,
      -- ['<Esc>'] = false -- disable a mapping
    },
    preview = {
      ["Q"] = actions.close,
      ["<Tab>"] = actions.next_location,
      ["<S-Tab>"] = actions.previous_location,
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
    enable = true, -- Available strating from nvim-0.8+
  },
})

require("treesitter-context").setup({
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 1, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to show for a single context
  trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint(args.buf, true)
    end
    -- whatever other lsp config you want
  end,
})

vim.diagnostic.config({ virtual_text = true })
-- Sourcegraph configuration. All keys are optional
require("sg").setup({
  -- Pass your own custom attach function
  --    If you do not pass your own attach function, then the following maps are provide:
  --        - gd -> goto definition
  --        - gr -> goto references
  on_attach = your_custom_lsp_attach_function,
})
