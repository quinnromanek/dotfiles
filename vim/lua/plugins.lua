require('plugins.mason')
require('plugins.lspconfig')
require('plugins.formatter-nvim')
require('plugins.nvim-lint')
require('plugins.luasnip')
require('plugins.copilot')
require('plugins.nvim-cmp')
require('plugins.hop')
require('plugins.treesitter')
require('plugins.neoscroll')
require('plugins.neotest')
require('plugins.nvim-lsp-installer')
require('plugins.goto-preview')
require('plugins.gitsigns')
require('plugins.nvim-tree')
require('plugins.telescope')
require('plugins.gh')
require('plugins.which-key')

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- One liners - move to their own file if we ever add config
require('octo').setup()
vim.api.nvim_set_keymap("n", "<LocalLeader>oc", ":Octo pr create<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<LocalLeader>ob", ":Octo pr browser<CR>", {noremap=true, silent=true})

require('scrollbar').setup()
map('n', '<LocalLeader>b', ':BufferPick<CR>', opts)


-- Rename
require('renamer').setup()
map('n', '<LocalLeader>r', '<cmd>lua require("renamer").rename()<cr>', opts)

require('nx').setup()

require('monorepo').setup()

require('trouble').setup()
