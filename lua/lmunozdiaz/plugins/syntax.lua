local M = {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cmd = { "TSUpdateSync" },
    opts = {
      -- Specify which servers to install
      -- ensure_installed = {
      --   "bash",
      --   "css",
      --   "dot",
      --   "gitignore",
      --   "html",
      --   "javascript",
      --   "json",
      --   "lua",
      --   "markdown",
      --   "python",
      --   "scss",
      --   "tsx",
      --   "typescript",
      --   "vim",
      -- },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}

return M
