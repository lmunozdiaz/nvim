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
