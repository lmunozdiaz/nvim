local M = {
  {
    'nvimdev/dashboard-nvim',
    dependencies = { {'nvim-tree/nvim-web-devicons'} },
    event = 'VimEnter',
    opts = {
      -- 'hyper' | 'doom'
      theme = 'hyper',
    },
    config = function(_, opts)
      require('dashboard').setup(opts)
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
    config = function(_, opts)
      require("noice").setup(opts)
    end
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
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      theme = "catppuccin",
      options = {
        section_separators = "",
        component_separators = "",
      }
    },
    config = function(_, opts)
      require("lualine").setup(opts)
    end
  },
}

return M
