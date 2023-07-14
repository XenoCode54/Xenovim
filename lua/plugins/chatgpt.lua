return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  config = function()
    require("chatgpt").setup({
      -- api_key_cmd = "echo $OPENAI_API_KEY",
      api_key_cmd = [[lua -e "print(os.getenv('OPENAI_API_KEY'))"]],
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
