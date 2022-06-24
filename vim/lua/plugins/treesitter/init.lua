-- treesitter configuration
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "bash",
    "go",
    "json",
    "elm",
    "javascript",
    "typescript",
    "ruby",
    "tsx",
    "rust",
    "python",
    "prisma",
    "vim",
    "yaml",
    "vue",
    "lua"
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
}
