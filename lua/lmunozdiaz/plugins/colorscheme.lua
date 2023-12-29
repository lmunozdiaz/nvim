local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    styles = {
      keywords = { "bold" },
      functions = { "italic" },
    },
    term_colors = true,
    highlight_overrides = {
      all = function(colors)
        return {
          MatchParen = { fg = colors.peach, bg = colors.none },
          CursorLine = { bg = colors.mantle },
          NeoTreeNormal = { bg = colors.none },
          NeoTreeNormalNC = { bg = colors.none },
        }
      end,
    },
    integrations = {
      mason = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      gitsigns = true,
      noice = true,
      indent_blankline = {
        enabled = true,
        -- scope_color = "lavender"
        colored_indent_levels = false,
      },
      mini = {
        enabled = true,
      },
      neogit = true,
      neotree = true,
      treesitter = true,
      treesitter_context = true,
      telescope = {
        enabled = true,
      },
      illuminate = {
        enabled = true,
        lsp = false
      },
      semantic_tokens = true,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}

return M
