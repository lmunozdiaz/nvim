local M = {
  "rose-pine/neovim",
  name = 'rose-pine',
  opts = {
    highlight_groups = {
      CursorLine = { bg = "none" },
      MatchParen = { bg = "base", fg = "love" },
    },
  },
  config = function(_, opts)
    require("rose-pine").setup(opts)
    vim.cmd('colorscheme rose-pine')
  end,
}

return M
