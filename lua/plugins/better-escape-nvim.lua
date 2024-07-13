return {
	"max397574/better-escape.nvim",
	config = function()
		-- lua, default settings
		require("better_escape").setup({
			timeout = vim.o.timeoutlen,
			mappings = {
				i = {
					h = {
						-- These can all also be functions
						h = "<Esc>",
						h = "<Esc>",
					},
				},
				c = {
					h = {
						h = "<Esc>",
						h = "<Esc>",
					},
				},
				t = {
					h = {
						h = "<Esc>",
						h = "<Esc>",
					},
				},
				v = {
					h = {
						h = "<Esc>",
					},
				},
				s = {
					h = {
						h = "<Esc>",
					},
				},
			},
		})
	end,
}
