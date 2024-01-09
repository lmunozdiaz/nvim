local M = {
  {
    "echasnovski/mini.starter",
    version = "*",
    opts = {},
    config = function(_, opts)
      require("mini.starter").setup(opts)
    end,
  },
  {
    "echasnovski/mini.notify",
    version = "*",
    opts = {},
    config = function(_, opts)
      require("mini.notify").setup(opts)
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<C-\>]],
      direction = "horizontal",
      shade_terminals = false,
      float_opts = {
        border = "curved",
        width = function()
          return math.floor(vim.o.columns * 0.9)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.9)
        end,
      },
      highlights = {
        NormalFloat = { link = "NormalFloat" },
        FloatBorder = { link = "FloatBorder" },
      },
      size = function(term)
        if term.direction == "horizontal" then
          return math.floor(vim.o.lines * 0.4)
        elseif term.direction == "vertical" then
          return math.floor(vim.o.columns * 0.4)
        end
      end,
      init = function()
        local autocmd = vim.api.nvim_create_autocmd
        autocmd("TermOpen", {
          pattern = { "term://*toggleterm#*" },
          callback = function()
            vim.keymap.set("t", "<C-\\>", "<CMD>exe v:count1 . 'ToggleTerm'<CR>", { silent = true })
          end,
        })
      end,
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)
    end,
  },
}

return M
