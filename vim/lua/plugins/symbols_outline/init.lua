
vim.g.symbols_outline = {
  width = 35

}

vim.api.nvim_set_keymap("n", "<Leader>r", ":SymbolsOutline<CR>", {silent = true})
