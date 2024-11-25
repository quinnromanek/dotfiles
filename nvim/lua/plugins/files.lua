return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() 
      require('telescope').setup()
    end,
    keys = {
      { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find files"},
      { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Find files"},
      { "<leader>g", "<cmd>Telescope git_status<cr>", desc = "Find files"}
    }
  },
  {
    "rolv-apneseth/tfm.nvim",
    lazy = false,
    opts = {
      enable_cmds = true,
    },
    keys = {
      {
        "<localleader>m",
        ":Tfm<CR>",
        desc = "yazi",
      },
    }
  }
}
