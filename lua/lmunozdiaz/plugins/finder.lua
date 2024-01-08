local M = {
  {
    {
      "echasnovski/mini.files",
      version = "*",
      opts = {},
      config = function(_, opts)
        require("mini.files").setup(opts)
      end,
    },
    {
      "echasnovski/mini.pick",
      version = "*",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {},
      config = function(_, opts)
        require("mini.pick").setup(opts)
      end,
    },
    {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { { "nvim-lua/plenary.nvim" } },
      opts = {},
      config = function(_, opts)
        require("harpoon").setup(opts)
      end,
    },
  },
}

return M
