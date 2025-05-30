return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		opts = {
			filesystem = {
				follow_current_file = {
					enabled = true, -- This will find and focus the file in the active buffer every time
					--               -- the current file is changed while the tree is open.
					leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
				},
				components = {
					harpoon_index = function(config, node, _)
						local harpoon_list = require("harpoon"):list()
						local path = node:get_id()
						local harpoon_key = vim.uv.cwd()

						for i, item in ipairs(harpoon_list.items) do
							local value = item.value
							if string.sub(item.value, 1, 1) ~= "/" then
								value = harpoon_key .. "/" .. item.value
							end

							if value == path then
								vim.print(path)
								return {
									text = string.format(" ⥤ %d", i), -- <-- Add your favorite harpoon like arrow here
									highlight = config.highlight or "NeoTreeDirectoryIcon",
								}
							end
						end
						return {}
					end,
				},
				renderers = {
					file = {
						{ "icon" },
						{ "name", use_git_status_colors = true },
						{ "harpoon_index" }, --> This is what actually adds the component in where you want it
						{ "diagnostics" },
						{ "git_status", highlight = "NeoTreeDimText" },
					},
				},
			},
			default_component_configs = {
				file_size = {
					enabled = true,
					required_width = 24, -- min width of window required to show this column
				},
				type = {
					enabled = true,
					required_width = 32, -- min width of window required to show this column
				},
			},
			window = {
				mappings = {
					["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
					-- ["<space>"] = "none",
					-- ["n"] = "move_cursor_down",
					-- ["o"] = "move_cursor_up",
					-- ["v"] = "image_wezterm",
					["e"] = "move_cursor_up",
					-- ["t"] = "open",
				},
				fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
					["<down>"] = "move_cursor_down",
					["<up>"] = "move_cursor_up",
				},
			},
		},
	},
}
