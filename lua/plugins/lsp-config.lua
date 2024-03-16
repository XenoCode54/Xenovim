-- LSP keymaps
return {
  "neovim/nvim-lspconfig",
  opts = {
    format = {
      timeout_ms = 10000,
      timeout = 10000,
    },
  },
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- change a keymap
    keys[#keys + 1] = { "gD", "<CMD>Glance definitions<CR>" }
    keys[#keys + 1] = { "gr", "<CMD>Glance references<CR>" }
  end,
}
