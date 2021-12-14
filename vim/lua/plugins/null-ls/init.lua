
local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
    null_ls.builtins.formatting.prettier.with({
      prefer_local = "node_modules/.bin",
    }),
}

null_ls.setup({ sources = sources })

