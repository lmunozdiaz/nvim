local M = {
	{
		"lunarvim/darkplus.nvim",
		config = function()
			vim.cmd("colorscheme darkplus")
		end,
	},
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		styles = {
	-- 			keywords = { "italic" },
	-- 			functions = { "bold" },
	-- 		},
	-- 		term_colors = true,
	-- 		highlight_overrides = {
	-- 			all = function(colors)
	-- 				return {
	-- 					-- MatchParen = { fg = colors.peach, bg = colors.none },
	-- 				}
	-- 			end,
	-- 		},
	-- 		integrations = {
	-- 			mason = true,
	-- 			native_lsp = {
	-- 				enabled = true,
	-- 				virtual_text = {
	-- 					errors = { "italic" },
	-- 					hints = { "italic" },
	-- 					warnings = { "italic" },
	-- 					information = { "italic" },
	-- 				},
	-- 				underlines = {
	-- 					errors = { "underline" },
	-- 					hints = { "underline" },
	-- 					warnings = { "underline" },
	-- 					information = { "underline" },
	-- 				},
	-- 				inlay_hints = {
	-- 					background = true,
	-- 				},
	-- 			},
	-- 			gitsigns = true,
	-- 			indent_blankline = {
	-- 				enabled = true,
	-- 				-- scope_color = "lavender"
	-- 				colored_indent_levels = false,
	-- 			},
	-- 			mini = {
	-- 				enabled = true,
	-- 			},
	-- 			treesitter = true,
	-- 			treesitter_context = true,
	-- 			semantic_tokens = true,
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("catppuccin").setup(opts)
	-- 		vim.cmd.colorscheme("catppuccin")
	-- 	end,
	-- },
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	opts = {
	-- 		styles = {
	-- 			bold = true,
	-- 			italic = true,
	-- 		},
	-- 		highlight_groups = {
	-- 			MiniStarterHeader = { fg = "love" },
	-- 			MiniStarterFooter = { fg = "rose" },
	-- 			MiniFilesBorder = { link = "FloatBorder" },
	-- 			MiniNotifyBorder = { link = "FloatBorder" },
	-- 			MiniPickBorder = { link = "FloatBorder" },
	-- 			MiniFilesNormal = { link = "NormalFloat" },
	-- 			MiniNotifyNormal = { link = "NormalFloat" },
	-- 			MiniPickNormal = { link = "NormalFloat" },
	-- 			MiniNotifyTitle = { fg = "foam" },
	-- 			MiniFilesDirectory = { fg = "rose" },
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("rose-pine").setup(opts)
	-- 		-- vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- },
}

return M
