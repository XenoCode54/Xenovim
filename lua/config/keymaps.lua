-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- local mark = require("harpoon.mark")
-- local ui = require("harpoon.ui")
--
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED
--
vim.keymap.set("n", "<leader>H", function()
	harpoon:list():add()
end, { noremap = true, desc = "Add File To Harpoon" })
vim.keymap.set("n", "<leader>h", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { noremap = true, desc = "Harpoon List" })

vim.keymap.set("n", "<C-l>", function()
	harpoon:list():select(1)
end, { noremap = true, desc = "Nav File 1" })
vim.keymap.set("n", "<C-u>", function()
	harpoon:list():select(2)
end, { noremap = true, desc = "Nav File 2" })
vim.keymap.set("n", "<C-y>", function()
	harpoon:list():select(3)
end, { noremap = true, desc = "Nav File 3" })
vim.keymap.set("n", "<C-;>", function()
	harpoon:list():select(4)
end, { noremap = true, desc = "Nav File 4" })

-- vim.keymap.set("n", "<leader>cb", function()
-- 	local old_text = vim.fn.input("Old text: ")
-- 	local new_text = vim.fn.input("New text: ")
-- 	if old_text == "" then
-- 		return
-- 	end
--
-- 	-- Perform the substitution
-- 	vim.cmd(":%s/" .. old_text .. "/" .. new_text .. "/g")
--
-- 	-- Move the cursor to the first instance of the old text
-- 	vim.cmd("normal! gg")
-- 	vim.fn.search(old_text)
-- end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>sf", function()
	local old_text = vim.fn.input("Old text: ")
	if old_text == "" then
		return
	end

	local new_text = vim.fn.input("New text: ")
	if new_text == "" then
		return
	end

	-- Create the substitution command with highlighting
	local cmd = ":%s/" .. old_text .. "/" .. new_text .. "/gc"

	-- Execute the command with incremental highlighting
	vim.cmd("set inccommand=nosplit")
	vim.cmd(cmd)
end, { noremap = true, silent = true, desc = "Find and Replace Single File" })

-- vim.keymap.set("n", "<leader>0", mark.add_file, { noremap = true, desc = "Add File To Harpoon" })
-- vim.keymap.set("n", "<leader>i", ui.toggle_quick_menu, { noremap = true, desc = "iHarpoon Menu" })
--
-- -- vim.keymap.set("i", "<S-S>", function()
-- --   vim.api.nvim_command(":<C-l>")
-- -- end, { noremap = true })
--
-- vim.keymap.set("n", "<leader>1", function()
--   ui.nav_file(1)
-- end, { noremap = true, desc = "Nav File 1" })
-- vim.keymap.set("n", "<leader>2", function()
--   ui.nav_file(2)
-- end, { noremap = true, desc = "Nav File 2" })
-- vim.keymap.set("n", "<leader>3", function()
--   ui.nav_file(3)
-- end, { noremap = true, desc = "Nav File 3" })
-- vim.keymap.set("n", "<leader>4", function()
--   ui.nav_file(4)
-- end, { noremap = true, desc = "Nav File 4" })
-- vim.keymap.set("n", "<leader>5", function()
--   ui.nav_file(5)
-- end, { noremap = true, desc = "Nav File 5" })
-- vim.keymap.set("n", "<leader>6", function()
--   ui.nav_file(6)
-- end, { noremap = true, desc = "Nav File 6" })
-- vim.keymap.set("n", "<leader>7", function()
--   ui.nav_file(7)
-- end, { noremap = true, desc = "Nav File 7" })
-- vim.keymap.set("n", "<leader>8", function()
--   ui.nav_file(8)
-- end, { noremap = true, desc = "Nav File 8" })
-- vim.keymap.set("n", "<leader>9", function()
--   ui.nav_file(9)
-- end, { noremap = true, desc = "Nav File 9" })

-- Copilot keymaps
--
-- vim.keymap.set("i", "<C-g>", 'copilot#Accept("\\<CR>")', {
--   expr = true,
--   silent = true,
--   replace_keycodes = false,
-- })
-- vim.g.copilot_no_tab_map = true
-- vim.keymap.set("i", "<C-l>", "<Plug>(copilot-accept-word)")
--
-- Quick chat with Copilot
--
-- vim.keymap.set("n", "<leader>nno", function()
--   require("CopilotChat").open()
-- end, { desc = "CopilotChat - Open" })
-- vim.keymap.set("n", "<leader>nnq", function()
--   local input = vim.fn.input("Quick Chat: ")
--   if input ~= "" then
--     require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
--   end
-- end, { desc = "CopilotChat - Quick chat" })
-- vim.keymap.set("n", "<leader>nnh", function()
--   local actions = require("CopilotChat.actions")
--   require("CopilotChat.integrations.telescope").pick(actions.help_actions())
-- end, { desc = "CopilotChat - Help actions" })
--
-- vim.keymap.set("n", "<leader>nnp", function()
--   local actions = require("CopilotChat.actions")
--   require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
-- end, { desc = "CopilotChat - Prompt actions" })
--
-- vim.keymap.set("v", "<leader>nnp", function()
--   local actions = require("CopilotChat.actions")
--   require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
-- end, { desc = "CopilotChat - Prompt actions" })
--
-- -- vim.keymap.set(
-- --   "v",
-- --   "<leader>nnq",
-- --   "<cmd>lua require('CopilotChat').ask(vim.fn.getreg('\"'), { selection = require('CopilotChat.select').buffer })",
-- --   { desc = "CopilotChat - Quick chat" }
-- -- )
-- vim.keymap.set(
--   "n",
--   "<leader>nny",
--   "<cmd>lua require('CopilotChat').ask(vim.fn.input('Ask Copilot: ') .. '\\n' .. vim.fn.getreg('\"'), { selection = require('CopilotChat.select').buffer })<CR>",
--   { desc = "Yanked text - Quick chat" }
-- )
--
-- vim.keymap.set(
--   "v",
--   "<leader>nnq",
--   "<cmd>lua require('CopilotChat').ask(vim.fn.input('Ask Copilot: ') .. '\\n' .. table.concat(vim.fn.getline(\"'<\",\"'>\"), '\\n'), { selection = require('CopilotChat.select').buffer })<cr>",
--   { desc = "CopilotChat - Quick chat" }
-- )

-- vim.keymap.set("n", "<leader>cO", vim.cmd.TSToolsOrganizeImports, { noremap = true, desc = "Organize Imports" })
-- vim.keymap.set("n", "<leader>ci", vim.cmd.TSToolsAddMissingImports, { noremap = true, desc = "Import Missing" })
-- vim.keymap.set("n", "<leader>ct", vim.cmd.TSToolsRemoveUnused, { noremap = true, desc = "Remove Unused Statements" })
-- vim.keymap.set("n", "<leader>ch", vim.cmd.TSToolsFixAll, { noremap = true, desc = "Fix All Fixable Errors" })
-- vim.keymap.set("n", "<leader>ck", vim.cmd.TSToolsRenameFile, { noremap = true, desc = "Rename Current File" })

vim.keymap.set("n", "<leader>z", vim.cmd.UndotreeToggle, { noremap = true, desc = "Undo Tree" })

--
vim.keymap.set(
	"n",
	"<leader>sx",
	require("telescope.builtin").resume,
	{ noremap = true, silent = true, desc = "Resume" }
)

-- vim.api.nvim_set_keymap(
-- 	"i",
-- 	"<Tab>",
-- 	'pumvisible() ? "<C-n>" : "<Tab>"',
-- 	{ expr = true, noremap = true, silent = true }
-- )

vim.keymap.set(
	"n",
	"gp",
	"<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
	{ noremap = true, desc = "Goto Preview Definition" }
)
vim.keymap.set(
	"n",
	"gpd",
	"<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
	{ noremap = true, desc = "Goto Preview Definition" }
)
vim.keymap.set(
	"n",
	"gpc",
	"<cmd>lua require('goto-preview').close_all_win({skip_curr_window = true })<CR>",
	{ noremap = true, desc = "Close All Goto Preview Windows" }
)
vim.keymap.set(
	"n",
	"gpt",
	"<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
	{ noremap = true, desc = "Goto Preview Type Definition" }
)
vim.keymap.set(
	"n",
	"gpi",
	"<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
	{ noremap = true, desc = "Goto Preview Implementation" }
)
vim.keymap.set(
	"n",
	"gpr",
	"<cmd>lua require('goto-preview').goto_preview_references()<CR>",
	{ noremap = true, desc = "Goto Preview References" }
)

-- Create a function to prompt for old and new text, perform the substitution, and place the cursor

-- Map the function to a key, for example <leader>r

-- vim.keymap.set(
-- 	"n",
-- 	"<leader>i",
-- 	'<cmd>lua require("fastaction").code_action()<CR>',
-- 	{ buffer = bufnr, desc = "iAction" }
-- )
-- vim.keymap.set(
-- 	"v",
-- 	"<leader>i",
-- 	"<esc><cmd>lua require('fastaction').range_code_action()<CR>",
-- 	{ buffer = bufnr, desc = "iAction" }
-- )

-- Remap j key to n key to move down in normal modes
-- Normal modes
vim.keymap.set("n", "e", "k", { noremap = true, silent = true })
vim.keymap.set("n", "k", "e", { noremap = true, silent = true })
vim.keymap.set("n", "j", "n", { noremap = true, silent = true })
vim.keymap.set("n", "n", "j", { noremap = true, silent = true })
vim.keymap.set("n", "s", "i", { noremap = true, silent = true })
vim.keymap.set("n", "i", "l", { noremap = true, silent = true })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "move left" })
vim.keymap.set("n", "<C-n>", "<C-w>j", { desc = "move down" })
vim.keymap.set("n", "<C-e>", "<C-w>k", { desc = "move top" })
vim.keymap.set("n", "<C-i>", "<C-w>l", { desc = "move right" })

-- Visual modes
vim.keymap.set("v", "e", "k", { noremap = true, silent = true })
vim.keymap.set("v", "k", "e", { noremap = true, silent = true })
vim.keymap.set("v", "j", "n", { noremap = true, silent = true })
vim.keymap.set("v", "n", "j", { noremap = true, silent = true })
vim.keymap.set("v", "s", "i", { noremap = true, silent = true })
vim.keymap.set("v", "i", "l", { noremap = true, silent = true })

-- Remap yn key to yank down
-- Normal modes

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

-- Tab navigation
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-i>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Focus autoresize
vim.keymap.set("n", "<leader>wf", "<cmd>FocusAutoresize<cr>", { desc = "Focus Autoresize" })

-- Change '<C-g>' here to any keycode you like.
vim.keymap.set("i", "<C-g>", function()
	return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-;>", function()
	return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-,>", function()
	return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-x>", function()
	return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true })
vim.keymap.set("n", "<leader>al", function()
	return vim.fn["codeium#Chat"]()
end, { expr = true, silent = true, desc = "Toggle (Codeium)" })

vim.keymap.set("n", "<leader>gd", "<cmd>LazyDocker<CR>", { desc = "LazyDocker", noremap = true, silent = true })
-- Remap hh to <esc>
-- Insert modes
vim.keymap.set("i", "hh", "<esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>k", "<cmd>w<CR>", { noremap = true, silent = true, desc = "Save Changes" })
-- vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true, desc = "Terminal" })
--
-- Open the main terminal
vim.api.nvim_set_keymap(
	"n",
	"<leader>oo",
	'<cmd>lua require("toggleterm").toggle(1)<CR>',
	{ noremap = true, silent = true, desc = "Primary Terminal" }
)
--
--integer is the index of the terminal
-- Open the first terminal
vim.keymap.set(
	"n",
	"<leader>os",
	'<cmd>lua require("toggleterm").toggle(2)<CR>',
	{ noremap = true, silent = true, desc = "Secondary Terminal" }
)

-- Open the second terminal
vim.keymap.set(
	"n",
	"<leader>ot",
	'<cmd>lua require("toggleterm").toggle(3)<CR>',
	{ noremap = true, silent = true, desc = "Tertiary Terminal" }
)

-- Open the third terminal
vim.keymap.set(
	"n",
	"<leader>oa",
	'<cmd>lua require("toggleterm").toggle(4)<CR>',
	{ noremap = true, silent = true, desc = "Adequate Terminal" }
)

-- vim.keymap.set("n", "<leader>cq", function()
-- 	Snacks.picker.search_history()
-- end, { noremap = true, silent = true, desc = "cccccc" })

-- { "<leader>r", "", desc = "Recent" },
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<leader>r",
-- 	"<cmd>FzfLua oldfiles<cr>",
-- 	{ noremap = true, silent = true, desc = "Recent Files" }
-- )

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
-- 	"n",
-- 	"<leader>pb",
-- 	[[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
-- 	{ noremap = true, silent = true, expr = false, desc = "Extract Block" }
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
-- vim.api.nvim_set_keymap(
--   "v",
--   "<leader>r",
--   ":lua require('refactoring').select_refactor()<CR>",
--   { noremap = true, silent = true, expr = false, desc = "refactor" }
-- )
--
-- You can also use below = true here to to change the position of the printf
-- statement (or set two remaps for either one). This remap must be made in normal mode.
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<leader>pp",
-- 	":lua require('refactoring').debug.printf({below = false})<CR>",
-- 	{ noremap = true, desc = "log", silent = true }
-- )

-- Print var
--

-- Remap in normal mode and passing { normal = true } will automatically find the variable under the cursor and print it
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<leader>pv",
-- 	":lua require('refactoring').debug.print_var({ normal = true })<CR>",
-- 	{ noremap = true, desc = "log variable", silent = true }
-- )
-- -- Remap in visual mode will print whatever is in the visual selection
-- vim.api.nvim_set_keymap(
-- 	"v",
-- 	"<leader>pv",
-- 	":lua require('refactoring').debug.print_var({})<CR>",
-- 	{ noremap = true, desc = "log variable", silent = true }
-- )

-- Cleanup function: this remap should be made in normal mode
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<leader>pc",
-- 	":lua require('refactoring').debug.cleanup({})<CR>",
-- 	{ noremap = true, desc = "cleanUp logs", silent = true }
-- )

-- Move highlighted lines in visual mode
vim.keymap.set("v", "N", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move highlighted line down" })
vim.keymap.set("v", "E", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move highlighted line up" })

-- Let cursor stay in the middle of screen during page up and down
vim.keymap.set("n", "N", "<C-d>zz", { noremap = true, silent = true, desc = "Page down and center" })
vim.keymap.set("n", "E", "<C-u>zz", { noremap = true, silent = true, desc = "Page up and center" })

-- Let search terms stay in the middle of screen
vim.keymap.set("n", "j", "nzzzv", { noremap = true, silent = true, desc = "Move down and center" })
vim.keymap.set("n", "J", "Nzzzv", { noremap = true, silent = true, desc = "Move up and center" })
-- Remap j key to n key to move down in normal modes
--
-- Comment out code
-- local keys = {
--   { "<C-/>", "<cmd>CommentToggle<cr>" }, -- comment toggle with Ctrl+/
-- }
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>m",
-- 	-- ":lua MiniFiles.open()<CR>",
-- 	function()
-- 		require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
-- 	end,
-- 	{ noremap = true, silent = true, desc = "Mini File Explorer" }
-- )
-- vim.keymap.set("n", "<leader>M", function()
-- 	require("mini.files").open(vim.uv.cwd(), true)
-- end, {
-- 	desc = "Mini File Explorer (cwd)",
-- 	noremap = true,
-- 	silent = true,
-- })

-- vim.keymap.set(
-- 	"n",
-- 	"<leader>e",
-- 	-- ":lua MiniFiles.open()<CR>",
-- 	function()
-- 		require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
-- 	end,
-- 	{ noremap = true, silent = true, desc = "Mini File Explorer" }
-- )
-- vim.keymap.set("n", "<leader>E", function()
-- 	require("mini.files").open(vim.uv.cwd(), true)
-- end, {
-- 	desc = "Mini File Explorer (cwd)",
-- 	noremap = true,
-- 	silent = true,
-- })

-- vim.keymap.set("n", "<leader>n", function()
--   require("edgy").toggle()
-- end, { noremap = true, silent = true, desc = "Edgy Explorer" })

-- vim.keymap.set(
--   "n",
--   "<leader>m",
--   ":Neotree reveal toggle<CR>",
--   { noremap = true, silent = true, desc = "Neotree Reveal File" }
-- )

vim.keymap.set(
	"n",
	"<leader>aot",
	":Augment chat-toggle<cr>",
	{ noremap = true, silent = true, desc = "Toggle Augment Chat" }
)
vim.keymap.set("n", "<leader>aoa", ":Augment chat<cr>", { noremap = true, silent = true, desc = "Open Augment Chat" })
vim.keymap.set(
	"n",
	"<leader>aon",
	":Augment chat-new<cr>",
	{ noremap = true, silent = true, desc = "New Augment Chat" }
)

-- Visual mode mapping
vim.keymap.set(
	"v",
	"<leader>aoa",
	":Augment chat<cr>",
	{ noremap = true, silent = true, desc = "Open Augment Chat with Selection" }
)

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer.fish<CR>")

vim.keymap.set("n", "<leader>asx", ":CodyToggle<cr>", { noremap = true, silent = true, desc = "Toggle Cody View" })
vim.keymap.set("n", "<leader>aso", ":CodyChat<cr>", { noremap = true, silent = true, desc = "Open Cody Chat" })
vim.keymap.set("n", "<leader>ast", ":CodyTaskView<cr>", { noremap = true, silent = true, desc = "Show Cody Tasks" })
vim.keymap.set("n", "<leader>asa", ":CodyAsk ", { noremap = true, silent = false, desc = "Ask Cody a Question" })
vim.keymap.set("n", "<leader>asd", ":CodyTask ", { noremap = true, silent = false, desc = "Assign Cody a Task" })
vim.keymap.set(
	"n",
	"<leader>ass",
	require("sg.extensions.telescope").fuzzy_search_results,
	{ noremap = true, silent = false, desc = "Sourcegraph Search" }
)

vim.keymap.set("v", "<leader>asa", ":CodyAsk ", { noremap = true, silent = false, desc = "Cody Ask" })
vim.keymap.set("v", "<leader>asd", ":CodyTask ", { noremap = true, silent = false, desc = "Cody Do Task" })
-- vim.keymap.set("n", "<leader>nsx", ":CodyToggle<cr>", { noremap = true, silent = true, desc = "AI Toggle View" })

vim.keymap.set("n", "<leader>aco", ":ChatGPT<cr>", { noremap = true, silent = true, desc = "Open ChatGPT View" })
-- vim.keymap.set("n", "<leader>ao", ":ChatGPT<cr>", { noremap = true, silent = true, desc = "Toggle (ChatGPT)" })
vim.keymap.set(
	"n",
	"<leader>acp",
	":ChatGPTActAs<cr>",
	{ noremap = true, silent = true, desc = "Activate ChatGPT Role-Play Mode" }
)
vim.keymap.set(
	"n",
	"<leader>acat",
	":ChatGPTRun add_tests<cr>",
	{ noremap = true, silent = true, desc = "Add Tests Using ChatGPT" }
)
vim.keymap.set(
	"n",
	"<leader>acaa",
	":ChatGPTRun code_readability_analysis<cr>",
	{ noremap = true, silent = true, desc = "Analyze Code Readability with ChatGPT" }
)
vim.keymap.set(
	"n",
	"<leader>acac",
	":ChatGPTRun complete_code<cr>",
	{ noremap = true, silent = true, desc = "Use ChatGPT to Complete Code" }
)
vim.keymap.set(
	"n",
	"<leader>acad",
	":ChatGPTRun docstring<cr>",
	{ noremap = true, silent = true, desc = "Generate Docstrings with ChatGPT" }
)
vim.keymap.set(
	"n",
	"<leader>acae",
	":ChatGPTRun explain_code<cr>",
	{ noremap = true, silent = true, desc = "Explain Code Snippets with ChatGPT" }
)
vim.keymap.set(
	"n",
	"<leader>acaf",
	":ChatGPTRun fix_bugs<cr>",
	{ noremap = true, silent = true, desc = "Fix Bugs Using ChatGPT" }
)
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>af",
-- 	":ChatGPTRun fix_bugs<cr>",
-- 	{ noremap = true, silent = true, desc = "Fix Bugs (ChatGPT)" }
-- )
vim.keymap.set(
	"n",
	"<leader>acag",
	":ChatGPTRun grammar_correction<cr>",
	{ noremap = true, silent = true, desc = "Correct Grammar with ChatGPT" }
)
vim.keymap.set(
	"n",
	"<leader>acak",
	":ChatGPTRun keywords<cr>",
	{ noremap = true, silent = true, desc = "Extract Keywords Using ChatGPT" }
)
vim.keymap.set(
	"n",
	"<leader>acao",
	":ChatGPTRun optimize_code<cr>",
	{ noremap = true, silent = true, desc = "Enhance code efficiency with ChatGPT" }
)
vim.keymap.set(
	"n",
	"<leader>acar",
	":ChatGPTRun roxygen_edit<cr>",
	{ noremap = true, silent = true, desc = "Refine Roxygen documentation with ChatGPT" }
)
vim.keymap.set(
	"n",
	"<leader>acas",
	":ChatGPTRun summarize<cr>",
	{ noremap = true, silent = true, desc = "Generate concise text summary using ChatGPT" }
)
vim.keymap.set(
	"n",
	"<leader>acal",
	":ChatGPTRun translate<cr>",
	{ noremap = true, silent = true, desc = "Translate Text with ChatGPT" }
)
vim.keymap.set(
	"n",
	"<leader>acc",
	":ChatGPTCompleteCode<cr> ",
	{ noremap = true, silent = true, desc = "Complete Code Blocks with ChatGPT" }
)
vim.keymap.set(
	"n",
	"<leader>ace",
	":ChatGPTEditWithInstructions<cr> ",
	{ noremap = true, silent = true, desc = "Edit Code with Specific Instructions in ChatGPT" }
)
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>ae",
-- 	":ChatGPTEditWithInstructions<cr> ",
-- 	{ noremap = true, silent = true, desc = "Edit Code (ChatGPT)" }
-- )

vim.keymap.set("v", "<leader>aco", ":ChatGPT<cr>", { noremap = true, silent = true, desc = "Open ChatGPT View" })
vim.keymap.set(
	"v",
	"<leader>acr",
	":ChatGPTActAs<cr>",
	{ noremap = true, silent = true, desc = "Activate ChatGPT Role-Play Mode" }
)
vim.keymap.set(
	"v",
	"<leader>acat",
	":ChatGPTRun add_tests<cr>",
	{ noremap = true, silent = true, desc = "Add Tests Using ChatGPT" }
)
vim.keymap.set(
	"v",
	"<leader>acaa",
	":ChatGPTRun code_readability_analysis<cr>",
	{ noremap = true, silent = true, desc = "Analyze Code Readability with ChatGPT" }
)
vim.keymap.set(
	"v",
	"<leader>acac",
	":ChatGPTRun complete_code<cr>",
	{ noremap = true, silent = true, desc = "Use ChatGPT to Complete Code" }
)
vim.keymap.set(
	"v",
	"<leader>acad",
	":ChatGPTRun docstring<cr>",
	{ noremap = true, silent = true, desc = "Generate Docstrings with ChatGPT" }
)
vim.keymap.set(
	"v",
	"<leader>acae",
	":ChatGPTRun explain_code<cr>",
	{ noremap = true, silent = true, desc = "Explain Code Snippets with ChatGPT" }
)
vim.keymap.set(
	"v",
	"<leader>acaf",
	":ChatGPTRun fix_bugs<cr>",
	{ noremap = true, silent = true, desc = "Fix Bugs Using ChatGPT" }
)
vim.keymap.set(
	"v",
	"<leader>acag",
	":ChatGPTRun grammar_correction<cr>",
	{ noremap = true, silent = true, desc = "Correct Grammar with ChatGPT" }
)
vim.keymap.set(
	"v",
	"<leader>acak",
	":ChatGPTRun keywords<cr>",
	{ noremap = true, silent = true, desc = "Extract Keywords Using ChatGPT" }
)
vim.keymap.set(
	"n",
	"<leader>acao",
	":ChatGPTRun optimize_code<cr>",
	{ noremap = true, silent = true, desc = "Optimize Code with ChatGPT's Help" }
)
vim.keymap.set(
	"v",
	"<leader>acar",
	":ChatGPTRun roxygen_edit<cr>",
	{ noremap = true, silent = true, desc = "Edit Roxygen Comments Using ChatGPT" }
)
vim.keymap.set(
	"v",
	"<leader>acas",
	":ChatGPTRun summarize<cr>",
	{ noremap = true, silent = true, desc = "Summarize Text with ChatGPT" }
)
vim.keymap.set(
	"v",
	"<leader>acal",
	":ChatGPTRun translate<cr>",
	{ noremap = true, silent = true, desc = "Translate Text with ChatGPT" }
)
vim.keymap.set(
	"v",
	"<leader>acc",
	":ChatGPTCompleteCode<cr> ",
	{ noremap = true, silent = true, desc = "Complete Code Blocks with ChatGPT" }
)
vim.keymap.set(
	"v",
	"<leader>ace",
	":ChatGPTEditWithInstructions<cr> ",
	{ noremap = true, silent = true, desc = "Edit Code with Specific Instructions in ChatGPT" }
)
vim.keymap.set(
	"v",
	"<leader>ae",
	":ChatGPTEditWithInstructions<cr> ",
	{ noremap = true, silent = true, desc = "Edit Code (ChatGPT)" }
)

-- AI ends here

vim.keymap.set(
	"n",
	"<leader>gb",
	-- ":lua MiniFiles.open()<CR>",
	":Gitsigns blame_line<cr>",
	{ noremap = true, silent = true, desc = "blame info" }
)

-- vim.keymap.set(
--   "n",
--   "<leader>h",
--   -- ":lua MiniFiles.open()<CR>",
--   ":CodeActionMenu<cr>",
--   { noremap = true, silent = true, desc = "Help code fix" }
-- )

-- vim.keymap.set({ "v", "n" }, "<leader>h", require("actions-preview").code_actions, { desc = "Code Action" })
-- vim.keymap.set({ "v", "n" }, "<leader>h", ":CodeActionMenu<cr>", { desc = "Code Action", silent = true })
-- vim.keymap.set({ "v", "n" }, "<leader>i", require("actions-preview").code_actions, { desc = "iAction", noremap = true })
vim.keymap.set({ "v", "n" }, "<leader>i", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true, desc = "iAction" })

vim.keymap.set(
	"n",
	"<leader>gf",
	-- ":lua MiniFiles.open()<CR>",
	":DiffviewFileHistory<cr>",
	{ noremap = true, silent = true, desc = "File History" }
)

vim.keymap.set(
	"n",
	"<leader>go",
	-- ":lua MiniFiles.open()<CR>",
	":DiffviewOpen<cr>",
	{ noremap = true, silent = true, desc = "Diffview Open" }
)

vim.keymap.set(
	"n",
	"<leader>gt",
	-- ":lua MiniFiles.open()<CR>",
	":DiffviewToggleFiles<cr>",
	{ noremap = true, silent = true, desc = "Toggle Diffview Files" }
)

vim.keymap.set(
	"n",
	"<leader>gx",
	-- ":lua MiniFiles.open()<CR>",
	":DiffviewClose!<cr>",
	{ noremap = true, silent = true, desc = "Diffview Close" }
) -- Lua

vim.keymap.set("n", "gS", "<CMD>Glance definitions<CR>", { noremap = true, silent = true, desc = "Glance Definitions" })
-- vim.keymap.set("n", "gR", "<CMD>Glance references<CR>", { noremap = true, silent = true, desc = "Glance References" })
vim.keymap.set(
	"n",
	"gY",
	"<CMD>Glance type_definitions<CR>",
	{ noremap = true, silent = true, desc = "Glance Type Definitions" }
)
vim.keymap.set(
	"n",
	"gM",
	"<CMD>Glance implementations<CR>",
	{ noremap = true, silent = true, desc = "Glance Implementations" }
)

vim.keymap.set("n", "qm", "<CMD>Dashboard<CR>", { noremap = true, silent = true, desc = "Quit to Main Menu" })

vim.keymap.set("n", "gp", "<CMD>Gitsigns preview_hunk<CR>", { noremap = true, silent = true, desc = "Preview hunk" })

vim.keymap.set("n", "X", "<CMD>LazyExtras<CR>", { noremap = true, silent = true, desc = "Extensions" })

vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })
-- vim.keymap.set("n", "<leader>p", ":YankyRingHistory<CR>", { noremap = true, silent = true, desc = "Yank history" })
--
--
--
--
