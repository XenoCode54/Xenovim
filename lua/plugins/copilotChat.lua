return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "github/copilot.vim" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = false, -- Enable debug logging
      allow_insecure = true, -- Allow insecure server connections

      -- system_prompt = prompts.COPILOT_INSTRUCTIONS, -- System prompt to use
      model = "gpt-4", -- GPT model to use, 'gpt-3.5-turbo' or 'gpt-4'
      temperature = 0.1, -- GPT temperature

      question_header = "--> Xenon ", -- Header to use for user questions
      answer_header = "--> Xenon's Copilot ", -- Header to use for AI answers
      error_header = "## Error ", -- Header to use for errors
      separator = "---", -- Separator to use in chat

      show_folds = true, -- Shows folds for sections in chat
      show_help = false, -- Shows help message as virtual lines when waiting for user input
      auto_follow_cursor = false, -- Auto-follow cursor in chat
      auto_insert_mode = false, -- Automatically enter insert mode when opening window and if auto follow cursor is enabled on new prompt
      clear_chat_on_new_prompt = false, -- Clears chat on every new prompt

      context = nil, -- Default context to use, 'buffers', 'buffer' or none (can be specified manually in prompt via @).
      history_path = vim.fn.stdpath("data") .. "/copilotchat_history", -- Default path to stored history
      callback = nil, -- Callback to use when ask response is received

      -- default selection (visual or line)
      selection = function(source)
        return select.visual(source) or select.line(source)
      end,

      -- default prompts
      -- default window options
      window = {
        layout = "float", -- 'vertical', 'horizontal', 'float'
        -- Options below only apply to floating windows
        relative = "cursor", -- 'editor', 'win', 'cursor', 'mouse'
        border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
        width = 0.8, -- fractional width of parent
        height = 0.6, -- fractional height of parent
        row = nil, -- row position of the window, default is centered
        col = nil, -- column position of the window, default is centered
        title = "Copilot Chat", -- title of chat window
        footer = nil, -- footer of chat window
        zindex = 1, -- determines if window is on top or below other floating windows
      },

      -- default mappings
      mappings = {
        complete = {
          detail = "Use @<Tab> or /<Tab> for options.",
          insert = "<Tab>",
        },
        close = {
          normal = "q",
          insert = "<C-c>",
        },
        reset = {
          normal = "<C-l>",
          insert = "<C-l>",
        },
        submit_prompt = {
          normal = "<CR>",
          insert = "<C-m>",
        },
        accept_diff = {
          normal = "<C-y>",
          insert = "<C-y>",
        },
        yank_diff = {
          normal = "gy",
        },
        show_diff = {
          normal = "gd",
        },
        show_system_prompt = {
          normal = "gp",
        },
        show_user_selection = {
          normal = "gs",
        },
      },
    },
  },
}
