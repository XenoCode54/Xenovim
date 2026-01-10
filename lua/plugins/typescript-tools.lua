return {
  "pmizio/typescript-tools.nvim",
  enabled = false,
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
  config = function()
    require("typescript-tools").setup({
      -- settings = {
      --   code_lens = "all",
      --   expose_as_code_action = { "all" },
      --   complete_function_calls = true,
      --   disable_member_code_lens = true,
      --   tsserver_format_options = {
      --     allowIncompleteCompletions = true,
      --     allowRenameOfImportPath = true,
      --   },
      -- },
    })
  end,
}
