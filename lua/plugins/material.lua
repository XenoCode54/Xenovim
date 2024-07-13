vim.g.material_style = "deep ocean"
vim.g.material_disable_background = 0
return {
	"marko-cerovac/material.nvim",
	-- enable = false,
	opts = {
		transparent = true,
		styles = {
			sidebars = "transparent",
			floats = "solid",
		},
		colorscheme = "material",
		transparent_background = true,
		background = "",
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "material",
			transparent_background = true,
			background = "",
		},
	},
}
