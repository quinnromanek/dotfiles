local lspconfig = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local global_on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  require("lsp_signature").on_attach()

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

 local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150,
--     }
--   }
-- end

local ts_setup = function(server)
  server:setup{
    init_options = require("nvim-lsp-ts-utils").init_options,
    on_attach = function(client, bufnr)
          global_on_attach(client, bufnr)
          local ts_utils = require("nvim-lsp-ts-utils")

          -- defaults
          ts_utils.setup({
              debug = false,
              disable_commands = false,
              enable_import_on_completion = false,

              -- import all
              import_all_timeout = 5000, -- ms
              -- lower numbers = higher priority
              import_all_priorities = {
                  same_file = 1, -- add to existing import statement
                  local_files = 2, -- git files or files with relative path markers
                  buffer_content = 3, -- loaded buffer content
                  buffers = 4, -- loaded buffer names
              },
              import_all_scan_buffers = 100,
              import_all_select_source = false,

              -- filter diagnostics
              filter_out_diagnostics_by_severity = {},
              filter_out_diagnostics_by_code = {},

              -- inlay hints
              auto_inlay_hints = true,
              inlay_hints_highlight = "Comment",

              -- update imports on file move
              update_imports_on_move = false,
              require_confirmation_on_move = false,
              watch_dir = nil,
          })

          -- required to fix code action ranges and filter diagnostics
          ts_utils.setup_client(client)

          -- no default maps, so you may want to define some here
          local opts = { silent = true }
          vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
          vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
          -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
      end,
      capabilities = capabilities,
  }
end

local default_setup = function(server)
  server:setup{
    on_attach = global_on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

lspconfig.solargraph.setup{
    on_attach = global_on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
}

require('nvim-lsp-installer')
local lsp_installer_servers = require('nvim-lsp-installer.servers')


local ensure_server_downloaded = function(server, setup)
  local server_available, requested_server = lsp_installer_servers.get_server(server)
  if server_available then
      requested_server:on_ready(setup)
      if not requested_server:is_installed() then
          -- Queue the server to be installed
          requested_server:install()
      end
  end
end

-- Server to be automatically installed
local installed_servers = {
  pyright = default_setup,
  vuels = default_setup,
  tsserver = ts_setup,
  elmls = default_setup,
  prismals = default_setup,
  -- yamlls = default_setup,
  -- sorbet = default_setup,
}

for server, setup in pairs(installed_servers) do
  ensure_server_downloaded(server, setup)
end

-- Installed by mason
default_setup(lspconfig.helm_ls)
