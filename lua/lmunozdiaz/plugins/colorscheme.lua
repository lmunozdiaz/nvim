local M = {
	"rose-pine/neovim",
	name = "rose-pine",
	opts = {
		groups = {
			-- border = "overlay",
			-- panel = "base",
		},
		highlight_groups = {
			-- Normal = { bg = "base" },
			-- NormalFloat = { bg = "base" },
			-- StatusLine = { bg = "base" },
			-- StatusLineNC = { bg = "base" },
			CursorLine = { bg = "#13121c" },
			MatchParen = { bg = "base", fg = "love" },
			MiniStarterHeader = { fg = "love" },
			MiniStarterFooter = { fg = "rose" },
			MiniFilesBorder = { fg = "overlay" },
			MiniNotifyBorder = { fg = "overlay" },
			MiniPickBorder = { fg = "overlay" },
			MiniFilesNormal = { bg = "base" },
			MiniNotifyNormal = { bg = "base" },
			MiniPickNormal = { bg = "base" },
			MiniNotifyTitle = { fg = "foam" },
			MiniFilesDirectory = { fg = "rose" },
		},
	},
	config = function(_, opts)
		require("rose-pine").setup(opts)
		vim.cmd("colorscheme rose-pine")
	end,
}

return M
