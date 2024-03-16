-- give gruvbox a transparent background
return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      colorscheme = "gruvbox",
      transparent_background = true,
      background = "",
      opacity = 0.2,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
      transparent_background = true,
      background = "",
      opacity = 0.2,
    },
  },
}
