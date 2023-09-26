return {
  "Exafunction/codeium.vim",
  enabled = false,
  config = function()
    -- Change '<C-g>' here to any keycode you like.
    -- For example:
    -- vim.keymap.set("i", "<c-j>", function()

    vim.keymap.set("i", "<right>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true, silent = true })
    vim.keymap.set("i", "<c-y>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true, silent = true })
    vim.keymap.set("i", "<c-u>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true, silent = true })
    vim.keymap.set("i", "<c-x>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true, silent = true })
  end,
}
