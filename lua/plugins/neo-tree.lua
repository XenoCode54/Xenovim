return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    opts = {
      window = {
        mappings = {
          -- ["<space>"] = "none",
          -- ["n"] = "move_cursor_down",
          -- ["o"] = "move_cursor_up",
          -- ["v"] = "image_wezterm",
          ["e"] = "move_cursor_up",
        },
        fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
          ["<down>"] = "move_cursor_down",
          ["<up>"] = "move_cursor_up",
        },
      },
    },
  },
}
