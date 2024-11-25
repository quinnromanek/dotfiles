return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
    {
      "gl",
      "<C-\\><C-n><C-w>l",
      desc = "Move to right pane",
    },
    {
      "gh",
      "<C-\\><C-n><C-w>h",
      desc = "Move to left pane",
    }
  },
}
