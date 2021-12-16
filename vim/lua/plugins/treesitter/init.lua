-- treesitter configuration
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "bash",
    "go",
    "json",
    "javascript",
    "typescript",
    "ruby",
    "tsx",
    "rust",
    "python",
    "vim",
    "yaml"

  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
}