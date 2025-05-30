-- return {
-- 	"aznhe21/actions-preview.nvim",
-- 	-- config = function()
-- 	-- 	vim.keymap.set({ "v", "n" }, "<leader>i", require("actions-preview").code_actions)
-- 	-- end,
-- }

return {
	"rachartier/tiny-code-action.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim" },
	},
	event = "LspAttach",
	opts = {
		--- The backend to use, currently only "vim", "delta", "difftastic", "diffsofancy" are supported
		backend = "delta",

		-- The picker to use, "telescope", "snacks", "select" are supported
		-- And it's opts that will be passed at the picker's creation, optional
		-- If you want to use the `fzf-lua` picker, you can simply set it to `select`
		--
		-- You can also set `picker = "telescope"` without any opts.
		picker = {
			"snacks",
		},
	},
}
