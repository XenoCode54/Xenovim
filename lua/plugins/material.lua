vim.g.material_style = "deep ocean"
vim.g.material_disable_background = 0
return {
  "marko-cerovac/material.nvim",
  opts = {
    transparent = false,
    styles = {
      sidebars = "transparent",
      floats = "solid",
    },
    colorscheme = "material",
    transparent_background = false,
    -- background = "",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "material",
      transparent_background = false,
      -- background = "",
    },
  },
}
