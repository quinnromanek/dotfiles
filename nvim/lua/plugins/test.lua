
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
    'nvim-neotest/neotest-python',
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
          jestCommand = "yarn exec jest --env=jsdom",
          jestConfigFile = function(file)
            if string.find(file, "/headway/web") then
              return string.match(file, "(.-/headway/web/[^/]+/[^/]+/)") .. "jest.config.js"
            end

            return vim.fn.getcwd() .. "/jest.config.js"
          end,
          cwd = function(file)
            if string.find(file, "/headway/web") then
              local cf = string.match(file, "(.-/headway/web/[^/]+/[^/]+/)")
              return cf
            end

            return vim.fn.getcwd()
          end,
        }),
        require('neotest-python')({}),
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
