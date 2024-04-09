-- LSP keymaps
-- return {
--   "neovim/nvim-lspconfig",
--   opts = {
--     format = {
--       timeout_ms = 30000,
--       timeout = 30000,
--     },
--   },
--   init = function()
--     local keys = require("lazyvim.plugins.lsp.keymaps").get()
--     -- change a keymap
--     keys[#keys + 1] = { "gd", "<CMD>Glance definitions<CR>" }
--     keys[#keys + 1] = { "gr", "<CMD>Glance references<CR>" }
--   end,
-- }

return {
  "neovim/nvim-lspconfig",
  opts = {
    format = {
      timeout_ms = 30000,
      timeout = 30000,
    },
  },
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- change a keymap
    keys[#keys + 1] = {
      "gd",
      function()
        local params = vim.lsp.util.make_position_params()
        vim.lsp.buf_request(0, "textDocument/definition", params, function(err, result)
          if err then
            vim.notify(err.message, vim.log.levels.ERROR)
            return
          end

          if result and #result == 1 then
            -- If there is only one definition, jump directly to it
            vim.lsp.util.jump_to_location(result[1], "utf-8")
          else
            -- If there are multiple definitions or no definitions, open Glance
            vim.cmd("Glance definitions")
          end
        end)
      end,
      mode = "n",
      desc = "Go to Definition",
    }
    keys[#keys + 1] = { "gr", "<CMD>Glance references<CR>" }
    keys[#keys + 1] = { "gD", "<CMD>Glance definitions<CR>" }
  end,
}
