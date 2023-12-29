local M = {}

function M.bootstrap()
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

  local lazy = require("lazy")

  lazy.setup({
    spec = "lmunozdiaz.plugins"
  })
end

function M.load(mod)
  require("lmunozdiaz.config." .. mod)
end

function M.setup()
  M.load("options")
  M.bootstrap()
  M.load("keymaps")
end

return M
