neotest = require('neotest')

neotest.setup({
  adapters = {
    require('neotest-jest')({
      jestCommand = "npm test --"
    }),
    require('neotest-rspec'),
    require("neotest-vim-test")({
      ignore_file_types = { "js", "ts", "ruby", "vim", "lua" },
    }),
  },
})

vim.keymap.set("n", "<LocalLeader>t", function()
  neotest.run.run(vim.fn.expand("%"))
  neotest.summary.open()
end, {silent=true})
