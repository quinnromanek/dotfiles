return {
  {
    'mhartington/formatter.nvim',
    cmd = { "Format", "FormatWrite" },
    config = function()

      local util = require("formatter.util")

      function prettier(parser)
        local exe = "prettier"
        local try_node_modules = true
        -- HEADWAY
        if string.match(util.get_current_buffer_file_path(), "/Users/quinnromanek/code/headway/web") then
          exe = "/Users/quinnromanek/code/headway/web/node_modules/.bin/prettier"
          try_node_modules = false
        end
        if not parser then
          return {
            exe = exe,
            args = {
              "--stdin-filepath",
              util.escape_path(util.get_current_buffer_file_path()),
            },
            stdin = true,
            try_node_modules = try_node_modules,
          }
        end

        return {
          exe = exe,
          args = {
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--parser",
            parser,
          },
          stdin = true,
          try_node_modules = try_node_modules,
        }
      end


      require("formatter").setup {
        filetype = {
          typescript = {
            function()
              return prettier("typescript")
            end
            -- require("formatter.filetypes.typescript").prettier
          },
          typescriptreact = {
            function()
              return prettier("typescript")
            end
          },
          javascript = {
            prettier
          },
          javascriptreact = {
            prettier
          },
          json = {
            prettier
          },
          ruby = {
            require("formatter.filetypes.ruby").rubocop
          },
          rust = {
            require("formatter.filetypes.rust").rustfmt
          },
          python = {
            require("formatter.filetypes.python").ruff
          },
          -- Use the special "*" filetype for defining formatter configurations on
          -- any filetype
          ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace
          }
        }
      }
    end
  },
  -- Autopairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  }

}
