return {
  "LunarVim/bigfile.nvim",
  event = "BufReadPre",
  opts = {
    filesize = 2, -- size of the file in MiB
  },
  config = function(_, opts)
    return require("bigfile").setup(opts)
  end,
}
