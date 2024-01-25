local M = {
  {
    "echasnovski/mini.basics",
    version = "*",
    opts = {},
    config = function(_, opts)
      require("mini.basics").setup(opts)
    end,
  },
  {
    "echasnovski/mini.animate",
    version = "*",
    opts = {},
    config = function(_, opts)
      require("mini.animate").setup(opts)
    end,
  },
  {
    "sQVe/sort.nvim",
    opts = {},
    config = function(_, opts)
      require("sort").setup(opts)
    end,
  },
}

return M
