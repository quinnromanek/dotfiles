return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      theme = 'horizon'
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
