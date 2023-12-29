local M = {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {},
    config = function(_, opts)
      require("neogit").setup(opts)
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        delete       = { text = '│' },
        topdelete    = { text = '│' },
        changedelete = { text = '│' },
        untracked    = { text = '│' },
      }
    },
    config = function(_, opts) 
      require('gitsigns').setup(opts)
    end
  },
}

return M
