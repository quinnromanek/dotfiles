return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'diagnostics'},
        lualine_c = {
          {
            'filename',
            path = 1,
            shorting_target = 60,
          }
        },
        lualine_x = {'encoding', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
    }
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {
    "sainnhe/everforest",
    name = "everforest",
    lazy = false,
    config = function()
      vim.g.everforest_enable_italic = true
      vim.cmd.colorscheme('everforest')
    end,
    priority = 1000
  }
}
