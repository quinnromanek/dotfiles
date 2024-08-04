local wk = require("which-key")
wk.setup{}

wk.add({
  { group = "Git" },
  { "<LocalLeader>gn", "<cmd>Git checkout -b<Space>" },
  { "<LocalLeader>gs", "<cmd>Telescope git_status<cr>" },
  { "<LocalLeader>gc", "<cmd>Git commit<cr>" },
  { "<LocalLeader>gb", "<cmd>Telescope git_branches<cr>" },
  { group = "Git Hunk" },
  { "<LocalLeader>hr", "<cmd>GitSigns reset_hunk<cr>" },
  { "<LocalLeader>hs", "<cmd>GitSigns reset_hunk<cr>" },
  { "<LocalLeader>ht", "<cmd>GitSigns stage_buffer<cr>" },
  { group = "Github" },
  { "<LocalLeader>ghc", "<cmd>Octo pr create<cr>" },
  { "<LocalLeader>ghb", "<cmd>Octo pr browser<cr>" },
  { "<LocalLeader>nr", "<cmd>Telescope npm scripts<cr>" },
  { group = "Find" },
  { "<LocalLeader>fb", "<cmd>Telescope buffers<cr>" },
  { "<LocalLeader>x", "<cmd>bd<cr>" },
})

-- wk.register({
--   ["<LocalLeader>"] = {
--     n = {
--       name = "Node",
--       x = {
--         name = "NX",
--         a = {
--           function()
--             require('nx.actions').actions_finder({})
--           end,
--           "NX Actions"
--         }
--       },
--       r = {
--         "<cmd>Telescope npm scripts<cr>",
--         "NPM Run"
--       },
--     },
--     g = {
--       name = "Git",
--       h = {
--         name = "Github",
--         c = {
--           "<cmd>Octo pr create<cr>",
--           "Create PR"
--         },
--         b = {
--           "<cmd>Octo pr browser<cr>",
--           "Open in browser"
--         },
--       },
--       c = {
--         "<cmd>Git commit<cr>",
--         "Commit"
--       },
--       s = {
--         "<cmd>Telescope git_status<cr>",
--         "Status"
--       },
--       b = {
--         "<cmd>Telescope git_branches<cr>",
--         "Branches"
--       },
--       n = {
--         "<cmd>Git checkout -b<Space>",
--         "New Branch"
--       }
--     },
--     f = {
--       name = "Find",
--       b = {
--         "<cmd>Telescope buffers<cr>",
--         "Buffers"
--       },
--       p = {
--         function()
--           require('telescope').extensions.monorepo.monorepo()
--         end,
--         "Monorepo Projects"
--       }
--     },
--     x = {
--       "<cmd>bd<cr>",
--       "Close Buffer"
--     }
--   },
-- })
