
require('plugins')


vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

vim.api.nvim_create_autocmd({ "BufRead" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
