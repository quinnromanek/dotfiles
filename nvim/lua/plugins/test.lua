
local run_test = function()
  local neotest = require('neotest')
  neotest.run.run(vim.fn.expand("%"))
  neotest.summary.open()
end

return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",

    -- Test Runners
    'nvim-neotest/neotest-vim-test',
    'marilari88/neotest-vitest',
    'nvim-neotest/neotest-jest',
    'olimorris/neotest-rspec'
  },
  keys = {
    { '<localleader>t', run_test, desc = "Run Test" }
  },
  config = function() 
    local neotest = require('neotest')

    neotest.setup({
      adapters = {
        require('neotest-jest')({
          jestCommand = "npm test --"
        }),
        require('neotest-rspec'),
        -- require('neotest-vitest')({
          -- ARCADIA
          -- vitestCommand = function(path)
          --   local vitest_util = require("neotest-vitest.util")

          --   if string.match(path, "/Users/quinn.romanek/code/cs") then
          --     if vim.fn.getcwd() == "/Users/quinn.romanek/code/cs" then
          --       local package_path = vitest_util.find_package_json_ancestor(path)
          --       local package = string.gsub(package_path, "/Users/quinn.romanek/code/cs/", "")
          --       local command = "pnpm run -F ./" .. package .. " test run " .. path
          --       return command
          --     else
          --       return "npm run test -- "
          --     end
          --   end
          --   return "vitest"
          -- end
        -- }),
        require("neotest-vim-test")({
          ignore_file_types = { "js", "ts", "ruby", "vim", "lua" },
        }),
      },
    })
  end
}
