return {
	"folke/which-key.nvim",
	opts = {
		defaults = {
			["<leader>o"] = { name = "+Other AI" },
			-- ["<leader>o"] = { name = "+Obsidian" },
			-- ["<leader>nn"] = { name = "+Copilot" },
			["<leader>oc"] = { name = "+ChatGPT" },
			["<leader>ocr"] = { name = "+ChatGPT Run" },
			["<leader>os"] = { name = "+SourceGraph" },
			-- ["<leader>o"] = { name = "+terminals" },
			["<leader>p"] = { name = "+print logs" },
			["<leader>i"] = { name = "+iHarpoon" },
		},
		window = {
			border = "double", -- none, single, double, shadow
			position = "bottom", -- bottom, top
			-- margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
			-- padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
			winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
			zindex = 1000, -- positive value to position WhichKey above other floating windows.
		},
		layout = {
			-- height = { min = 4, max = 25 }, -- min and max height of the columns
			-- width = { min = 20, max = 50 }, -- min and max width of the columns
			spacing = 5, -- spacing between columns
			align = "left", -- align columns left, center or right
		},
		icons = {
			-- breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			-- separator = "➜", -- symbol used between a key and it's label
			group = "[+] ", -- symbol prepended to a group
		},
		key_labels = {
			-- override the label used to display some keys. It doesn't effect WK in any other way.
			-- For example:
			["<space>"] = "SPC",
			["<cr>"] = "CON",
			["<tab>"] = "TAB",
		},
	},
}
