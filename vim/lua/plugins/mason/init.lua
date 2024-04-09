
require("mason").setup()

-- Run :MasonToolsInstall
require("mason-tool-installer").setup {
  ensure_installed = {
    'helm-ls'
  }
}
require("mason-lspconfig").setup()

