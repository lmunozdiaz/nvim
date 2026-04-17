-- ┌──────────────────────────┐
-- │ Java LSP config (jdtls)  │
-- └──────────────────────────┘
--
-- This file sets up nvim-jdtls whenever a Java file is opened.
-- Location: after/ftplugin/java.lua
--
-- Prerequisites (installed via Mason):
--   :MasonInstall jdtls lombok-nls
-- OR install lombok.jar manually and update LOMBOK_JAR below.
--
-- IMPORTANT: Do NOT call vim.lsp.enable('jdtls') anywhere in your config.
-- nvim-jdtls manages its own attach lifecycle via start_or_attach().

-- ── Paths ──────────────────────────────────────────────────────────────────

-- jdtls binary (installed by Mason, or available on your $PATH)
local jdtls_bin = vim.fn.exepath('jdtls')
if jdtls_bin == '' then
  vim.notify('[java] jdtls not found in PATH. Install via :MasonInstall jdtls', vim.log.levels.ERROR)
  return
end

-- Lombok: Mason puts it here when you :MasonInstall jdtls
-- If you installed lombok.jar manually, replace this path.
local mason_share = vim.fn.stdpath('data') .. '/mason/share/jdtls'
local lombok_jar  = mason_share .. '/lombok.jar'
-- Fallback: look for a manually placed jar next to this config
if vim.fn.filereadable(lombok_jar) == 0 then
  local fallback = vim.fn.stdpath('config') .. '/lombok.jar'
  if vim.fn.filereadable(fallback) == 1 then
    lombok_jar = fallback
  else
    lombok_jar = nil
  end
end

-- ── Workspace ──────────────────────────────────────────────────────────────

-- Give each project its own workspace so Eclipse state doesn't bleed across.
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('cache') .. '/jdtls/workspaces/' .. project_name

-- ── Command ────────────────────────────────────────────────────────────────

local cmd = { jdtls_bin }

-- Attach Lombok as a Java agent so annotations (@Getter, @Builder, etc.) work.
if lombok_jar then
  table.insert(cmd, '--jvm-arg=-javaagent:' .. lombok_jar)
  -- Older JDK versions also need this on the boot classpath:
  -- table.insert(cmd, '--jvm-arg=-Xbootclasspath/a:' .. lombok_jar)
end

-- Point jdtls at the per-project workspace
table.insert(cmd, '-data')
table.insert(cmd, workspace_dir)

-- ── Root detection ─────────────────────────────────────────────────────────

-- Walk up the directory tree until we find one of these markers.
local root_markers = {
  '.git',
  'mvnw', 'pom.xml',           -- Maven
  'gradlew', 'build.gradle',   -- Gradle
  '.project',                  -- Eclipse project
}
local root_dir = vim.fs.root(vim.api.nvim_buf_get_name(0), root_markers)

if not root_dir then
  vim.notify('[java] Could not determine project root; LSP may behave oddly', vim.log.levels.WARN)
  root_dir = vim.fn.getcwd()
end

-- ── Capabilities ───────────────────────────────────────────────────────────

-- Pull in whatever completion capabilities mini.completion advertised, if any.
local capabilities = vim.lsp.protocol.make_client_capabilities()
if MiniCompletion then
  capabilities = vim.tbl_deep_extend(
    'force',
    capabilities,
    MiniCompletion.get_lsp_capabilities()
  )
end

-- ── Settings ───────────────────────────────────────────────────────────────

local settings = {
  java = {
    -- Inline hints for parameter names and types
    inlayHints = {
      parameterNames = { enabled = 'all' },
    },
    -- Let jdtls format code (pairs with conform.nvim if you prefer that)
    format = { enabled = true },
    -- Save actions: organise imports and clean up on save
    saveActions = {
      organizeImports = true,
    },
    -- Compiler / source level
    configuration = {
      -- Uncomment and set to your project's Java version if needed:
      -- runtimes = {
      --   { name = 'JavaSE-21', path = '/path/to/jdk-21' },
      -- },
    },
    -- Maven / Gradle import settings
    import = {
      gradle = { enabled = true },
      maven  = { enabled = true },
    },
    -- Completion extras
    completion = {
      favoriteStaticMembers = {
        'org.junit.jupiter.api.Assertions.*',
        'org.mockito.Mockito.*',
        'java.util.Objects.requireNonNull',
        'java.util.Objects.requireNonNullElse',
      },
      filteredTypes = {
        'com.sun.*',
        'io.micrometer.shaded.*',
        'java.awt.*',
        'jdk.*',
        'sun.*',
      },
    },
    -- Source file organisation
    sources = {
      organizeImports = {
        starThreshold          = 9999,
        staticStarThreshold    = 9999,
      },
    },
    -- Code generation
    codeGeneration = {
      toString = {
        template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
      },
      useBlocks = true,
    },
  },
}

-- ── on_attach ──────────────────────────────────────────────────────────────

local function on_attach(client, buf)
  -- Reduce completion trigger noise (mirrors the lua_ls.lua example)
  if client.server_capabilities.completionProvider then
    client.server_capabilities.completionProvider.triggerCharacters =
      { '.', '@', '#', '(' }
    -- Set omnifunc for mini.completion (mirrors plugin/30_mini.lua pattern)
    vim.bo[buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
  end

  -- jdtls-specific keymaps (buffer-local, only active in Java files)
  local nmap = function(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, { buffer = buf, desc = desc })
  end
  local vmap = function(lhs, rhs, desc)
    vim.keymap.set('v', lhs, rhs, { buffer = buf, desc = desc })
  end

  -- Organise imports
  nmap('<Leader>li', require('jdtls').organize_imports, 'Organise imports (Java)')

  -- Code actions (jdtls-extended)
  nmap('<Leader>lv', require('jdtls').extract_variable,    'Extract variable')
  nmap('<Leader>lc', require('jdtls').extract_constant,    'Extract constant')
  nmap('<Leader>lm', require('jdtls').extract_method,      'Extract method')
  vmap('<Leader>lv', require('jdtls').extract_variable,    'Extract variable (selection)')
  vmap('<Leader>lm', require('jdtls').extract_method,      'Extract method (selection)')

  -- Tests (requires java-debug + java-test bundles; safe to keep even without)
  nmap('<Leader>ltc', require('jdtls').test_class,         'Run test class')
  nmap('<Leader>ltm', require('jdtls').test_nearest_method,'Run nearest test')
end

-- ── Start / re-attach ──────────────────────────────────────────────────────

require('jdtls').start_or_attach({
  name         = 'jdtls',
  cmd          = cmd,
  root_dir     = root_dir,
  capabilities = capabilities,
  settings     = settings,
  on_attach    = on_attach,

  -- init_options: add java-debug / java-test jar bundles here if you use nvim-dap.
  -- Example:
  -- init_options = {
  --   bundles = {
  --     vim.fn.glob(vim.fn.stdpath('data') ..
  --       '/mason/packages/java-debug-adapter/extension/server/' ..
  --       'com.microsoft.java.debug.plugin-*.jar', true),
  --   },
  -- },
})
