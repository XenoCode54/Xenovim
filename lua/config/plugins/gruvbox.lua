-- give gruvbox a transparent background
-- return {
--   {
--     "ellisonleao/gruvbox.nvim",
--     opts = {
--       colorscheme = "gruvbox",
--       transparent_background = true,
--       background = "",
--       opacity = 0.8,
--     },
--   },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "gruvbox",
--       transparent_background = true,
--       background = "",
--       opacity = 0.8,
--     },
--   },
-- }
--
return {
  "tokyonight.nvim",
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
}
