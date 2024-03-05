return {
  "smjonas/inc-rename.nvim",
  cmd = "IncRename",
  keys = {
    {
      "<leader>cr",
      function()
        return ":IncRename" .. vim.fn.expand("<cword>")
      end,
      desc = "Rename the current word",
      mode = "n",
      noremap = true,
      expr = true,
    },
  },
  config = true,
}
