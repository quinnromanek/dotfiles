local wk = require("which-key")
wk.setup{}

wk.register({
  ["<LocalLeader>"] = {
    n = {
      name = "Node",
      x = {
        name = "NX",
        a = {
          function()
            require('nx.actions').actions_finder({})
          end,
          "NX Actions"
        }
      },
      r = {
        "<cmd>Telescope npm scripts<cr>",
        "NPM Run"
      },
    },
    g = {
      name = "Git",
      h = {
        name = "Github",
        c = {
          "<cmd>Octo pr create<cr>",
          "Create PR"
        },
        b = {
          "<cmd>Octo pr browser<cr>",
          "Open in browser"
        },
      },
      c = {
        "<cmd>Git commit<cr>",
        "Commit"
      },
      s = {
        "<cmd>Telescope git_status<cr>",
        "Status"
      },
      b = {
        "<cmd>Telescope git_branches<cr>",
        "Branches"
      },
      n = {
        "<cmd>Git checkout -b<Space>",
        "New Branch"
      }
    },
    f = {
      name = "Find",
      b = {
        "<cmd>Telescope buffers<cr>",
        "Buffers"
      },
      p = {
        function()
          require('telescope').extensions.monorepo.monorepo()
        end,
        "Monorepo Projects"
      }
    },
    x = {
      "<cmd>bd<cr>",
      "Close Buffer"
    }
  },
})
