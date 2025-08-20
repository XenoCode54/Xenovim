-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.winbar = "%=%m %f"

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })

-- vim.g.lazyvim_picker = "fzf"
vim.g.lazyvim_picker = "snacks"

vim.g.lazyvim_rust_diagnostics = "rust-analyzer"

vim.g.snacks_animate = false
-- vim.g.snacks_animate.Duration = 500

-- views can only be fully collapsed with the global statusline
-- vim.opt.laststatus = 3
-- Default splitting will cause your main splits to jump when opening an edgebar.
-- To prevent this, set `splitkeep` to either `screen` or `topline`.
-- vim.opt.splitkeep = "screen"
vim.g.copilot_enabled = false

