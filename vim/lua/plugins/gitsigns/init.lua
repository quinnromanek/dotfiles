require('gitsigns').setup{
  keymaps = {
    -- Default keymap options
    noremap = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"},

    ['n <LocalLeader>hs'] = '<cmd>Gitsigns stage_hunk<CR>',
    ['v <LocalLeader>hs'] = ':Gitsigns stage_hunk<CR>',
    ['n <LocalLeader>hu'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
    ['n <LocalLeader>hr'] = '<cmd>Gitsigns reset_hunk<CR>',
    ['v <LocalLeader>hr'] = ':Gitsigns reset_hunk<CR>',
    ['n <LocalLeader>hR'] = '<cmd>Gitsigns reset_buffer<CR>',
    ['n <LocalLeader>hp'] = '<cmd>Gitsigns preview_hunk<CR>',
    ['n <LocalLeader>hb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
    ['n <LocalLeader>hS'] = '<cmd>Gitsigns stage_buffer<CR>',
    ['n <LocalLeader>hU'] = '<cmd>Gitsigns reset_buffer_index<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>Gitsigns select_hunk<CR>',
    ['x ih'] = ':<C-U>Gitsigns select_hunk<CR>'
  },

}

