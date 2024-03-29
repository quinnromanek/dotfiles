neotest = require('neotest')
local vitest_util = require("neotest-vitest.util")

neotest.setup({
  adapters = {
    require('neotest-jest')({
      jestCommand = "npm test --"
    }),
    require('neotest-rspec'),
    require('neotest-vitest')({
      -- ARCADIA
      vitestCommand = function(path)

        if string.match(path, "/Users/quinn.romanek/code/cs") then
          if vim.fn.getcwd() == "/Users/quinn.romanek/code/cs" then
            local package_path = vitest_util.find_node_modules_ancestor(path)
            local package = string.gsub(package_path, "/Users/quinn.romanek/code/cs/", "")
            local command = "npm run -w " .. package .. " test -- run " .. path
            print(command)
            return command
          else
            return "npm run test -- "
          end
        end
        return "vitest"
      end
    }),
    require("neotest-vim-test")({
      ignore_file_types = { "js", "ts", "ruby", "vim", "lua" },
    }),
  },
})

vim.keymap.set("n", "<LocalLeader>t", function()
  neotest.run.run(vim.fn.expand("%"))
  neotest.summary.open()
end, {silent=true})
