return {
  {
    'mhartington/formatter.nvim',
    cmd = { "Format", "FormatWrite" },
    config = function()

      local util = require("formatter.util")

      function prettier(parser)
        local exe = "prettier"
        -- ARCADIA
        if string.match(util.get_current_buffer_file_path(), "/Users/quinn.romanek/code/cs") then
          exe = "pnpm prettier"
        end
        if not parser then
          return {
            exe = exe,
            args = {
              "--stdin-filepath",
              util.escape_path(util.get_current_buffer_file_path()),
            },
            stdin = true,
            try_node_modules = true,
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
          try_node_modules = true,
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
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  }
}
