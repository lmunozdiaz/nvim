if vim.g.vscode then
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)

	require("lazy").setup({
		{ "echasnovski/mini.nvim", version = "*" },
	})

	require("mini.basics").setup({})
	require("mini.comment").setup({})
	require("mini.move").setup({})
	require("mini.surround").setup({})
else
	require("lmunozdiaz.config").setup()
end

local rainbow = require("rainbow-delimiters")
local highlight = vim.api.nvim_set_hl
vim.g.rainbow_delimiters = {
	strategy = {
		html = rainbow.strategy["noop"],
	},
	-- query = {
	-- 	javascript = { "rainbow-parens" },
	-- },
	highlight = {
		highlight(0, "RainbowDelimiterRed", { fg = "#ffd602" }),
		highlight(0, "RainbowDelimiterYellow", { fg = "#da70d6" }),
		highlight(0, "RainbowDelimiterBlue", { fg = "#169fff" }),
		highlight(0, "RainbowDelimiterOrange", { fg = "#da70d6" }),
		highlight(0, "RainbowDelimiterGreen", { fg = "#169fff" }),
		highlight(0, "RainbowDelimiterViolet", { fg = "#169fff" }),
		highlight(0, "RainbowDelimiterCyan", { fg = "#ffd602" }),
	},
}
