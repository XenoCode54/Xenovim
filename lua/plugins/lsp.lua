return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      format = {
        timeout_ms = 30000,
        timeout = 30000,
      },
      diagnostics = {
        underline = true,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
      },
      inlay_hints = { enabled = true },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              hint = { enable = true },
            },
          },
        },
        tsserver = {
          keys = {
            {
              "<leader>co",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.organizeImports.ts" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Sort Imports",
            },
            {
              "<leader>cR",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.removeUnused.ts" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Remove Unused Imports",
            },
          },
          settings = {
            completions = {
              completeFunctionCalls = true,
            },
            typescript = {
              inlayHints = {
                -- taken from https://github.com/typescript-language-server/typescript-language-server#workspacedidchangeconfiguration
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true, -- false
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true, -- false
              },
            },
            javascript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              },
            },
          },
        },
      },
    },
  },
}

-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       format = {
--         timeout_ms = 30000,
--         timeout = 30000,
--       },
--       diagnostics = {
--         underline = true,
--         virtual_text = {
--           spacing = 4,
--           source = "if_many",
--           prefix = "●",
--         },
--       },
--       inlay_hints = { enabled = true },
--       servers = {
--         lua_ls = {
--           settings = {
--             Lua = {
--               hint = { enable = true },
--             },
--           },
--         },
--         tsserver = {
--           init_options = {
--             preferences = {
--               importModuleSpecifierPreference = "relative",
--               quotePreference = "single",
--             },
--           },
--           commands = {
--             OrganizeImports = {
--               function()
--                 vim.lsp.buf.execute_command({
--                   command = "_typescript.organizeImports",
--                   arguments = { vim.api.nvim_buf_get_name(0) },
--                   title = "",
--                 })
--               end,
--               description = "Organize Imports",
--             },
--           },
--           keys = {
--             {
--               "<leader>co",
--               function()
--                 vim.lsp.buf.code_action({
--                   apply = true,
--                   context = {
--                     only = { "source.organizeImports.ts" },
--                     diagnostics = {},
--                   },
--                 })
--               end,
--               desc = "Organize Imports",
--             },
--             {
--               "<leader>cR",
--               function()
--                 vim.lsp.buf.code_action({
--                   apply = true,
--                   context = {
--                     only = { "source.removeUnused.ts" },
--                     diagnostics = {},
--                   },
--                 })
--               end,
--               desc = "Remove Unused Imports",
--             },
--             {
--               "<leader>cz",
--               function()
--                 vim.lsp.buf.code_action({
--                   apply = true,
--                   context = {
--                     -- This tries to organize imports which can include adding missing imports
--                     only = { "source.organizeImports.ts" },
--                     diagnostics = {},
--                   },
--                 })
--               end,
--               desc = "Auto-import Missing Imports",
--             },
--             {
--               "<leader>ce",
--               function()
--                 vim.lsp.buf.code_action({
--                   apply = true,
--                   context = {
--                     only = { "source.fixAll.ts" },
--                     diagnostics = {},
--                   },
--                 })
--               end,
--               desc = "Fix All",
--             },
--           },
--           settings = {
--             completions = {
--               completeFunctionCalls = true,
--             },
--             typescript = {
--               inlayHints = {
--                 includeInlayEnumMemberValueHints = true,
--                 includeInlayFunctionLikeReturnTypeHints = true,
--                 includeInlayFunctionParameterTypeHints = true,
--                 includeInlayParameterNameHints = "all",
--                 includeInlayParameterNameHintsWhenArgumentMatchesName = true, -- false
--                 includeInlayPropertyDeclarationTypeHints = true,
--                 includeInlayVariableTypeHints = true,
--                 includeInlayVariableTypeHintsWhenTypeMatchesName = true, -- false
--               },
--             },
--             javascript = {
--               inlayHints = {
--                 includeInlayEnumMemberValueHints = true,
--                 includeInlayFunctionLikeReturnTypeHints = true,
--                 includeInlayFunctionParameterTypeHints = true,
--                 includeInlayParameterNameHints = "all",
--                 includeInlayParameterNameHintsWhenArgumentMatchesName = true,
--                 includeInlayPropertyDeclarationTypeHints = true,
--                 includeInlayVariableTypeHints = true,
--                 includeInlayVariableTypeHintsWhenTypeMatchesName = true,
--               },
--             },
--           },
--         },
--       },
--     },
--   },
-- }
