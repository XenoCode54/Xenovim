return {
	{
		"neovim/nvim-lspconfig",
		opts = function(_, opts)
			local Keys = require("lazyvim.plugins.lsp.keymaps").get()

			-- Remove default gd keymap
			Keys[#Keys + 1] = { "gd", false }
			Keys[#Keys + 1] = { "gr", false }
			Keys[#Keys + 1] = { "gp", false }
			Keys[#Keys + 1] = { "<leader>ca", false }
			Keys[#Keys + 1] = { "<leader>cr", false }
			Keys[#Keys + 1] = { "<leader>cd", false }
			Keys[#Keys + 1] = { "[e", false }
			Keys[#Keys + 1] = { "]e", false }
			Keys[#Keys + 1] = { "[d", false }
			Keys[#Keys + 1] = { "]d", false }
			Keys[#Keys + 1] = { "<leader>ci", false }
			Keys[#Keys + 1] = { "<leader>co", false }

			-- Add your custom gd keymap
			Keys[#Keys + 1] = {
				"gd",
				function()
					vim.cmd("Lspsaga goto_definition")
				end,
				desc = "Goto Definition",
			}

			Keys[#Keys + 1] = {
				"gr",
				function()
					vim.cmd("Lspsaga finder")
				end,
				desc = "References and Implementations",
			}

			Keys[#Keys + 1] = {
				"gp",
				function()
					vim.cmd("Lspsaga peek_definition")
				end,
				desc = "Peek Definition",
				noremap = true,
				silent = true,
			}

			Keys[#Keys + 1] = {
				"<leader>ca",
				function()
					vim.cmd("Lspsaga code_action")
				end,
				desc = "Code Action",
			}

			Keys[#Keys + 1] = {
				"<leader>cr",
				function()
					vim.cmd("Lspsaga rename")
				end,
				desc = "Rename",
			}

			Keys[#Keys + 1] = {
				"<leader>cd",
				function()
					vim.cmd("Lspsaga show_line_diagnostics")
				end,
				desc = "Show Line Diagnostics",
			}

			Keys[#Keys + 1] = {
				"[d",
				function()
					vim.cmd("Lspsaga diagnostic_jump_prev")
				end,
				desc = "Previous Diagnostic",
			}

			Keys[#Keys + 1] = {
				"]d",
				function()
					vim.cmd("Lspsaga diagnostic_jump_next")
				end,
				desc = "Next Diagnostic",
			}

			Keys[#Keys + 1] = {
				"[e",
				function()
					require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
				end,
				desc = "Previous Error Diagnostic",
			}

			Keys[#Keys + 1] = {
				"]e",
				function()
					require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
				end,
				desc = "Next Error Diagnostic",
			}

			Keys[#Keys + 1] = {
				"<leader>ci",
				function()
					vim.cmd("Lspsaga incoming_calls")
				end,
				desc = "Incoming Calls",
			}

			return opts
		end,
	},
}
