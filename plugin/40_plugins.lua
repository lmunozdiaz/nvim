-- ┌─────────────────────────┐
-- │ Plugins outside of MINI │
-- └─────────────────────────┘
--
-- This file contains installation and configuration of plugins outside of MINI.
-- They significantly improve user experience in a way not yet possible with MINI.
-- These are mostly plugins that provide programming language specific behavior.
--
-- Use this file to install and configure other such plugins.

-- Make concise helpers for installing/adding plugins in two stages
local add = vim.pack.add
local now_if_args, later = Config.now_if_args, Config.later
local github = 'https://github.com'

-- Tree-sitter ================================================================
now_if_args(function()
  -- Define hook to update tree-sitter parsers after plugin is updated
  local ts_update = function() vim.cmd('TSUpdate') end
  Config.on_packchanged('nvim-treesitter', { 'update' }, ts_update, ':TSUpdate')

  add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  })

  local languages = { 'java', 'xml', 'yaml', 'javascript', 'html', 'css' }

  local isnt_installed = function(lang)
    return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
  end
  local to_install = vim.tbl_filter(isnt_installed, languages)
  if #to_install > 0 then require('nvim-treesitter').install(to_install) end

  -- Enable tree-sitter after opening a file for a target language
  local filetypes = {}
  for _, lang in ipairs(languages) do
    for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
      table.insert(filetypes, ft)
    end
  end
  local ts_start = function(ev) vim.treesitter.start(ev.buf) end
  Config.new_autocmd('FileType', filetypes, ts_start, 'Start tree-sitter')
end)

-- LSP ========================================================================
later(function()
  add({ github .. '/neovim/nvim-lspconfig' })
  add({ github .. '/mason-org/mason.nvim' })
  add({ github .. '/mason-org/mason-lspconfig.nvim' })

  require('mason').setup()
  require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'jdtls' }
  })
end)
