-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

vim.api.nvim_set_keymap(
  "i",
  "<Tab>",
  'pumvisible() ? "<C-n>" : "<Tab>"',
  { expr = true, noremap = true, silent = true }
)

-- Remap j key to n key to move down in normal modes
-- Normal modes
vim.keymap.set("n", "e", "k", { noremap = true, silent = true })
vim.keymap.set("n", "k", "e", { noremap = true, silent = true })
vim.keymap.set("n", "j", "n", { noremap = true, silent = true })
vim.keymap.set("n", "n", "j", { noremap = true, silent = true })
vim.keymap.set("n", "s", "i", { noremap = true, silent = true })
vim.keymap.set("n", "i", "l", { noremap = true, silent = true })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "move right" })
vim.keymap.set("n", "<C-n>", "<C-w>j", { desc = "move left" })
vim.keymap.set("n", "<C-e>", "<C-w>k", { desc = "move top" })
vim.keymap.set("n", "<C-i>", "<C-w>l", { desc = "move down" })

-- Visual modes
vim.keymap.set("v", "e", "k", { noremap = true, silent = true })
vim.keymap.set("v", "k", "e", { noremap = true, silent = true })
vim.keymap.set("v", "j", "n", { noremap = true, silent = true })
vim.keymap.set("v", "n", "j", { noremap = true, silent = true })
vim.keymap.set("v", "s", "i", { noremap = true, silent = true })
vim.keymap.set("v", "i", "l", { noremap = true, silent = true })

-- Remap yn key to yank down
-- Normal modes
-- ehoehoa
vim.keymap.set("n", "yn", "yj", { noremap = true, silent = true })
vim.keymap.set("n", "ye", "yk", { noremap = true, silent = true })
vim.keymap.set("n", "yk", "ye", { noremap = true, silent = true })
vim.keymap.set("n", "yj", "yn", { noremap = true, silent = true })
vim.keymap.set("n", "ys", "yi", { noremap = true, silent = true })

vim.keymap.set("n", "cn", "cj", { noremap = true, silent = true })
vim.keymap.set("n", "ce", "ck", { noremap = true, silent = true })
vim.keymap.set("n", "ck", "ce", { noremap = true, silent = true })
vim.keymap.set("n", "cj", "cn", { noremap = true, silent = true })
vim.keymap.set("n", "cs", "ci", { noremap = true, silent = true })

vim.keymap.set("n", "dn", "dj", { noremap = true, silent = true })
vim.keymap.set("n", "de", "dk", { noremap = true, silent = true })
vim.keymap.set("n", "dk", "de", { noremap = true, silent = true })
vim.keymap.set("n", "dj", "dn", { noremap = true, silent = true })
vim.keymap.set("n", "ds", "di", { noremap = true, silent = true })

-- Remap hh to <esc>
-- Insert modes
vim.keymap.set("i", "hh", "<esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>a", "<cmd>w<CR>", { noremap = true, silent = true, desc = "Save Changes" })
-- vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true, desc = "Terminal" })
--
-- Open the main terminal
vim.api.nvim_set_keymap(
  "n",
  "<leader>op",
  '<cmd>lua require("toggleterm").toggle(1)<CR>',
  { noremap = true, silent = true, desc = "Primary Terminal" }
)
--
--integer is the index of the terminal
-- -- Open the first terminal
vim.api.nvim_set_keymap(
  "n",
  "<leader>os",
  '<cmd>lua require("toggleterm").toggle(2)<CR>',
  { noremap = true, silent = true, desc = "Secondary Terminal" }
)
--
--ast
-- -- Open the second terminal
vim.api.nvim_set_keymap(
  "n",
  "<leader>ot",
  '<cmd>lua require("toggleterm").toggle(3)<CR>',
  { noremap = true, silent = true, desc = "Tetiary Terminal" }
)

-- -- Open the third terminal
vim.api.nvim_set_keymap(
  "n",
  "<leader>oo",
  '<cmd>lua require("toggleterm").toggle(4)<CR>',
  { noremap = true, silent = true, desc = "Origin Terminal" }
)

-- -- Remaps for the refactoring operations currently offered by the plugin
-- vim.keymap.set(
--   "v",
--   "<leader>re",
--   [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
--   { noremap = true, silent = true, expr = false, desc = "Extract into a function" }
-- )
-- vim.keymap.set(
--   "v",
--   "<leader>rf",
--   [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
--   { noremap = true, silent = true, expr = false, desc = "Extract Function To File" }
-- )
-- vim.api.nvim_set_keymap(
--   "v",
--   "<leader>rv",
--   [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
--   { noremap = true, silent = true, expr = false, desc = "Extract Variable" }
-- )
-- vim.api.nvim_set_keymap(
--   "v",
--   "<leader>ri",
--   [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
--   { noremap = true, silent = true, expr = false, desc = "Inline Variable" }
-- )

-- Extract block doesn't need visual mode
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>rb",
--   [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
--   { noremap = true, silent = true, expr = false, desc = "Extract Block" }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>rbf",
--   [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
--   { noremap = true, silent = true, expr = false, desc = "Extract Block To File" }
-- )
--
-- -- Inline variable can also pick up the identifier currently under the cursor without visual mode
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>ri",
--   [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
--   { noremap = true, silent = true, expr = false, desc = "Inline Variable" }
-- )
--
-- prompt for a refactor to apply when the remap is triggered
vim.api.nvim_set_keymap(
  "v",
  "<leader>r",
  ":lua require('refactoring').select_refactor()<CR>",
  { noremap = true, silent = true, expr = false, desc = "refactor" }
)

-- You can also use below = true here to to change the position of the printf
-- statement (or set two remaps for either one). This remap must be made in normal mode.
vim.api.nvim_set_keymap(
  "n",
  "<leader>pp",
  ":lua require('refactoring').debug.printf({below = false})<CR>",
  { noremap = true, desc = "console.log", silent = true }
)

-- Print var
--

-- Remap in normal mode and passing { normal = true } will automatically find the variable under the cursor and print it
vim.api.nvim_set_keymap(
  "n",
  "<leader>pv",
  ":lua require('refactoring').debug.print_var({ normal = true })<CR>",
  { noremap = true, desc = "console.log variable", silent = true }
)
-- Remap in visual mode will print whatever is in the visual selection
vim.api.nvim_set_keymap(
  "v",
  "<leader>pv",
  ":lua require('refactoring').debug.print_var({})<CR>",
  { noremap = true, desc = "Print variable", silent = true }
)

-- Cleanup function: this remap should be made in normal mode
vim.api.nvim_set_keymap(
  "n",
  "<leader>pc",
  ":lua require('refactoring').debug.cleanup({})<CR>",
  { noremap = true, desc = "CleanUp logs", silent = true }
)

-- Move highlighted lines in visual mode
vim.keymap.set("v", "<Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Let cursor stay in the middle of screen during page up and down
vim.keymap.set("n", "<Down>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<Up>", "<C-u>zz", { noremap = true, silent = true })

-- Let search terms stay in the middle of screen
vim.keymap.set("n", "j", "nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "J", "Nzzzv", { noremap = true, silent = true })
-- Remap j key to n key to move down in normal modes
--
-- Comment out code
-- local keys = {
--   { "<C-/>", "<cmd>CommentToggle<cr>" }, -- comment toggle with Ctrl+/
-- }
vim.keymap.set(
  "n",
  "<leader>m",
  -- ":lua MiniFiles.open()<CR>",
  function()
    require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
  end,
  { noremap = true, silent = true, desc = "Mini File Explorer" }
)
