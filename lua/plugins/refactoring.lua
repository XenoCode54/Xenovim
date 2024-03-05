return {
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").select_refactor({
            show_success_message = true,
          })
        end,
        mode = "v",
        desc = "Refactor Selection",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {},
  },
  { "nvim-lua/plenary.nvim" },
}
