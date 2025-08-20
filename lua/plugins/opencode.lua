return {
	"NickvanDyke/opencode.nvim",
	dependencies = { "folke/snacks.nvim" },
	---@type opencode.Config
	opts = {
		-- Your configuration, if any
	},
  -- stylua: ignore
  keys = {
    { '<leader>at', function() require('opencode').toggle() end, desc = 'Toggle embedded Opencode', },
    { '<leader>aa', function() require('opencode').ask() end, desc = 'Ask Opencode', mode = 'n', },
    { '<leader>aa', function() require('opencode').ask('@selection: ') end, desc = 'Ask Opencode about selection', mode = 'v', },
    { '<leader>ap', function() require('opencode').select_prompt() end, desc = 'Select prompt', mode = { 'n', 'v', }, },
    { '<leader>an', function() require('opencode').command('session_new') end, desc = 'New session', },
    { '<leader>ay', function() require('opencode').command('messages_copy') end, desc = 'Copy last message', },
    { '<Up>',    function() require('opencode').command('messages_half_page_up') end, desc = 'Scroll messages up', },
    { '<Down>',    function() require('opencode').command('messages_half_page_down') end, desc = 'Scroll messages down', },
  },
}
