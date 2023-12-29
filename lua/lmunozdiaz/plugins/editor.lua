local M = {
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      separator = nil,
    },
    config = function(_, opts)
      require("treesitter-context").setup(opts)
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = {
        enabled = false,
      },
      exclude = {
        filetypes = { "dashboard" }
      },
    },
    config = function (_, opts)
      require("ibl").setup(opts)
    end
  },
  {
    "utilyre/sentiment.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {
      pairs = {
        { "(", ")" },
        { "{", "}" },
        { "[", "]" },
        { "<", ">" },
      },
    },
    init = function()
      vim.g.loaded_matchparen = 1
    end,
  },
  -- {
  --   "RRethy/vim-illuminate",
  --   opts = {},
  --   config = function(_, opts)
  --     require('illuminate').configure(opts)
  --   end
  -- },
  {
    "windwp/nvim-ts-autotag",
    opts = {},
    config = function(_, opts)
      require("nvim-ts-autotag").setup(opts)
    end
  },
  {
    "abecodes/tabout.nvim",
    opts = {},
    config = function(_, opts)
      require("tabout").setup(opts)
    end
  },
  { 'echasnovski/mini.comment',
    version = '*',
    opts = {
      ignore_blank_line = true,
    },
    config = function(_, opts)
      require('mini.comment').setup(opts)
    end
  },
  {
    'echasnovski/mini.pairs',
    version = '*',
    opts = {},
    config = function(_, opts)
      require('mini.pairs').setup(opts)
    end
  },
  {
    'echasnovski/mini.surround',
    version = '*',
    opts = {},
    config = function(_, opts)
      require('mini.surround').setup(opts)
    end
  },
  {
    'echasnovski/mini.jump',
    version = '*',
    opts = {},
    config = function(_, opts)
      require('mini.jump').setup(opts)
    end
  },
}

return M
