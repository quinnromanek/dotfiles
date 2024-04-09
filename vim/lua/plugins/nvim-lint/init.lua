require("lint").linters_by_ft = {
    typescript = {
      'eslint',
    },
    typescriptreact = {
      'eslint',
    },
    javascript = {
      'eslint',
    },
    javascriptreact = {
      'eslint',
    },
    json = {
      'eslint',
    },
}

-- ARCADIA
local eslint = require("lint").linters.eslint
local vitest_util = require("neotest-vitest.util")

local binary_name = "eslint"

eslint.args = {
    '--config',
    function()
      if vim.fn.getcwd() == "/Users/quinn.romanek/code/cs" then
        local path = vim.api.nvim_buf_get_name(0)
        local package_path = vitest_util.find_package_json_ancestor(path)
        local package = string.gsub(package_path, "/Users/quinn.romanek/code/cs/", "")
        return package .. "/.eslintrc.json"
      else
        return ''
      end
    end,
    '--format',
    'json',
    '--stdin',
    '--stdin-filename',
    function() return vim.api.nvim_buf_get_name(0) end,
}
