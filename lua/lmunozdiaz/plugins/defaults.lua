local M = {
  { 'echasnovski/mini.basics',
    version = '*',
    opts = {},
    config = function(_, opts)
      require("mini.basics").setup(opts)
    end,
  },
}

return M
