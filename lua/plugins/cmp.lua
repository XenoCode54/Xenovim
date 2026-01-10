return {
  "nvim-cmp",
  dependencies = {
    -- codeium
    {
      "sourcegraph/sg.nvim",
      cmd = "Cody",
      build = "nvim -l build/init.lua",
      opts = {},
    },
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    table.insert(opts.sources, 1, {
      name = "cody",
      group_index = 1,
      priority = 100,
    })
  end,
}
