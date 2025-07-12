return {
	{
		"SmiteshP/nvim-navic",
		enabled = false,
		config = function(_, opts)
			local navic = require("nvim-navic")
			navic.setup(opts)

			-- Patch get_location to suppress winbar output
			local orig = navic.get_location
			navic.get_location = function(...)
				-- only render navic when explicitly needed
				return ""
			end
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		opts = {
			symbol_in_winbar = {
				enable = true,
				separator = " › ",
				show_file = true,
				folder_level = 3,
			},
		},
	},
}
