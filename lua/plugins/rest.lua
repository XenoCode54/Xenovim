return {
  "rest-nvim/rest.nvim",
  ft = "http",
  enabled = false,
  dependencies = { "luarocks.nvim" },
  config = function()
    require("rest-nvim").setup()
  end,
}
