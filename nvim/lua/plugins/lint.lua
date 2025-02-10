return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()

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
        python = {
          'ruff',
        },
    }

    local eslint = require("lint").linters.eslint

    local binary_name = "eslint"

    eslint.cmd = function()
      if string.match(vim.fn.getcwd(), "/Users/quinnromanek/code/headway/web") then
        -- HEADWAY
        return "/Users/quinnromanek/code/headway/web/node_modules/.bin/eslint"
      else
        local local_binary = vim.fn.fnamemodify('./node_modules/.bin/' .. binary_name, ':p')
        return vim.loop.fs_stat(local_binary) and local_binary or binary_name
      end
    end

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
