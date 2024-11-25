return {
  {
    'ggandor/leap.nvim',
    config = function() 
      require('leap').create_default_mappings()
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
      })
    end
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    cmd = { 'HopWord' },
    opts = {},
    keys = {
      { 'gw', '<cmd>HopWord<cr>', desc = "Hop"}
    }
  }
}
