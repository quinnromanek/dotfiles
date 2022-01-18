
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-s>"] = "select_horizontal"
      }
    }

  },
  pickers = {
    git_status = {
      mappings = {
        i = {
          ["<C-s>"] = "git_staging_toggle"
        }
      }
    },
    git_branches = {
      mappings = {
        i = {
          ["<C-n>"] = "git_create_branch"
        }
      }
    }
  }

}
require('telescope').load_extension('fzf')
require('telescope').load_extension('projects')

