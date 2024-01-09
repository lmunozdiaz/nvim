local M = {
	{
		"echasnovski/mini.completion",
		version = "*",
		opts = {},
		config = function(_, opts)
			require("mini.completion").setup(opts)
		end,
	},
}

return M
