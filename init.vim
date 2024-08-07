"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""
function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh --clang-completer --gocode-completer
  endif
endfunction
call plug#begin('~/.config/nvim/bundle')

Plug 'nvim-lua/plenary.nvim'
" Plugins
Plug 'benekastah/neomake'
Plug 'junegunn/vim-easy-align'
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-endwise'
Plug 'yssl/QFEnter'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/taglist.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'towolf/vim-helm'

" Mason -- package management
Plug 'williamboman/mason.nvim'
Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Search/Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'elianiva/telescope-npm.nvim'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'
Plug 'imNel/monorepo.nvim'

Plug 'ahmedkhalf/project.nvim'

Plug 'phaazon/hop.nvim'
Plug 'junegunn/vim-slash'
Plug 'karb94/neoscroll.nvim'
Plug 'rmagatti/goto-preview'

Plug 'petertriho/nvim-scrollbar'
Plug 'glepnir/dashboard-nvim'
Plug 'filipdutescu/renamer.nvim', { 'branch': 'master' }
Plug 'folke/which-key.nvim'

" Formatting / Linting
Plug 'mhartington/formatter.nvim'
Plug 'mfussenegger/nvim-lint'
Plug 'folke/trouble.nvim'

" Execution
Plug 'vim-test/vim-test'

" Syntax
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate'}
Plug 'jose-elias-alvarez/null-ls.nvim'

" Testing
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'haydenmeade/neotest-jest'
Plug 'olimorris/neotest-rspec'
Plug 'marilari88/neotest-vitest'
Plug 'nvim-neotest/neotest-vim-test'
Plug 'nvim-neotest/neotest'

" Code completion

Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'williamboman/nvim-lsp-installer'
Plug 'ray-x/lsp_signature.nvim'
Plug 'weilbith/nvim-code-action-menu'
Plug 'kosayoda/nvim-lightbulb'

Plug 'zbirenbaum/copilot.lua'
Plug 'zbirenbaum/copilot-cmp'


" Appearance
Plug 'mhartington/oceanic-next'

Plug 'ryanoasis/vim-devicons'

" External - Github
Plug 'pwntester/octo.nvim'
Plug 'ldelossa/litee.nvim'
Plug 'ldelossa/gh.nvim'

" Nx
Plug 'Equilibris/nx.nvim'

" Language specific plugins
Plug 'tpope/vim-rails',          { 'for' : 'ruby'  }
Plug 'LaTeX-Box-Team/LaTeX-Box', { 'for' : 'tex'   }
Plug 'fatih/vim-go',             { 'for' : 'go'    }
Plug 'slim-template/vim-slim',   { 'for' : 'slim'  }
Plug 'elmcast/elm-vim',          { 'for' : 'elm'   }

" End plug
call plug#end()
filetype plugin indent on    " Required for plugins

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color settings
set t_Co=256
syntax on
set background=dark
set termguicolors
let g:oceanic_next_terminal_italic = 1
let g:oceanic_next_terminal_bold = 1
colorscheme OceanicNext

" Allow folding
" set foldmethod=syntax

" Local Leader
let maplocalleader=','        " All my macros start with ,

" Display
set cc=+1
set ruler                     " Show the line number on the bar
set more                      " Use more prompt
set autoread                  " Watch for file changes
set number                    " Line numbers
set hidden
set noautowrite               " Don't automagically write on :next
set lazyredraw                " Don't redraw when don't have to
set showmode
set showcmd
set nocompatible              " Vim, not vi
set mouse=a

" Scrolling
set sidescrolloff=5           " Keep at least 5 lines left/right
set scrolloff=5               " Keep at least 5 lines above/below

" Clipboard
set clipboard=unnamed
set fileformats=unix
set ff=unix

" Indenting


" Don't newline at EOF
set binary
set noeol

" Filetypes
filetype on                   " Enable filetype
set wildmenu                  " Menu has tab completion
set laststatus=2
set list listchars=tab:\ \ ,trail:·
autocmd BufNewFile,BufRead * setlocal formatoptions+=t

" Java specifics
autocmd BufNewFile,BufReadPre *.java setlocal textwidth=100
let java_highlight_all=1

" Tex Line Width
autocmd BufNewFile,BufReadPre *.tex setlocal textwidth=80

" Ruby Line Width
autocmd BufNewFile,BufReadPre *.rb,*.rake setlocal textwidth=100

" Searching
set incsearch                 " Incremental search
set ignorecase                " Search ignoring case
set smartcase                 " Case sensitive for uppercase
set hlsearch                  " Highlight the search
set showmatch                 " Show matching bracket
set diffopt=filler,iwhite     " Ignore all whitespace and sync
set autoindent

" Vim splits
set splitbelow                " Open split to right / bottom
set splitright

" Misc settings
set history=200
set backspace=indent,eol,start
set linebreak
set cmdheight=1               " Command line two lines high
set undolevels=1000           " 1000 undos
set updatecount=100           " Switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " Do lots of scanning on tab completion
set ttyfast                   " We have a fast terminal
set noerrorbells              " No error bells please
set virtualedit=onemore

" Toggle relative numbering
set relativenumber
autocmd! InsertEnter,InsertLeave * set invrelativenumber

" QuickFix window mappings
autocmd FileType qf nnoremap <buffer> q :cclose<CR>

" Kill any trailing whitespace on save (Credit to Facebook)
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction

let g:fb_kill_whitespace_blacklist = ["snippets"]
if index(g:fb_kill_whitespace_blacklist, &ft) < 0
  au BufWritePre * :call <SID>StripTrailingWhitespaces()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Useful commands and mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Unhighlight
nmap <LocalLeader>e :CodeActionMenu<CR>

" Spelling
if v:version >= 700
   " Enable spell check for text files
   autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
endif

" Remove insert delay
if !has('gui_running')
  set ttimeoutlen=40
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=100
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" Exiting insert mode
inoremap jk <Esc>

" Search word under cursor
" nnoremap <LocalLeader>s *


" Toggle list mode
nmap <LocalLeader>tl :set list!<cr>

" Toggle paste mode
nmap <LocalLeader>pp :set paste!<cr>

" Directional terminal splits
if has('nvim')
  command! Vterm vsp | term
  nmap <C-a>v :Vterm<CR>
  command! Sterm 10sp | term
  nmap <C-a>s :Sterm<CR>

  autocmd TermOpen * tnoremap <buffer> jk <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
endif

" Move single lines
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" :(
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev WQ wq
cnoreabbrev Wq wq
cnoreabbrev wQ wq

" Neovim workaround for C-h
if has('nvim')
  nmap <BS> <C-W>h
endif

" Source vimrc
" nmap <LocalLeader>g :so ~/.config/init.vim<CR>

" Search directory for word under cursor
nmap S :Telescope lsp_references<CR>
nmap <LocalLeader>D :Ag "def (self\.)?<C-R><C-W>"<CR>

" Allow searching from visual mode
vnoremap // y/<C-R>"<CR>


" Cycle through buffers
" nmap <LocalLeader>n :Telescope buffers<CR>

" File switching
nmap <LocalLeader><LocalLeader> <c-^>


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hop
"""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <LocalLeader>w :HopWord<CR>
" nmap <LocalLeader>b :HopWord<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dashboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:dashboard_default_executive ='telescope'


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" TComment
"""""""""""""""""""""""""""""""""""""""""""""""""""""
map <LocalLeader>c :TComment<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" DelimitMate
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:delimitMate_expand_cr = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme = 'oceanicnext'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#empty_message = 'local'
let g:airline#extensions#tmuxline#enabled = 0


" Tabline configuration
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#show_tab_type = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tmuxline
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmuxline_theme = 'zenburn'
let g:tmuxline_preset = 'nikhil'

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Rails
"""""""""""""""""""""""""""""""""""""""""""""""""""""
au Filetype ruby nnoremap gd gf

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" LaTeX-Box
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:LatexBox_custom_indent = 0
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_show_warnings = 2
let g:LatexBox_quickfix = 2
" nmap <silent> <LocalLeader>ll :Latexmk<CR>

""""""""""""""""""""""""""""""""""""
" QFEnter
""""""""""""""""""""""""""""""""""""
let g:qfenter_vopen_map = ['<C-v>']
let g:qfenter_hopen_map = ['<C-s>']

""""""""""""""""""""""""""""""""""""
" Easy Align
""""""""""""""""""""""""""""""""""""
vmap <LocalLeader>v <Plug>(EasyAlign)
nmap <LocalLeader>v <Plug>(EasyAlign)

" Define custome configurations
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['_'] = { 'pattern': '-', 'ignore_groups': ['String'] }
let g:easy_align_delimiters[':'] = { 'pattern': ':' }
let g:easy_align_delimiters['\'] = { 'pattern': '\\' }

""""""""""""""""""""""""""""""""""""
" Easy Clip
""""""""""""""""""""""""""""""""""""
nmap <C-f> <plug>EasyClipSwapPasteForward
xmap d <Plug>MoveMotionXPlug
nmap dd <Plug>MoveMotionLinePlug

""""""""""""""""""""""""""""""""""""
" Neosnippets
""""""""""""""""""""""""""""""""""""
function! s:neosnippet_complete()
  if pumvisible()
    return "\<c-n>"
  else
    if neosnippet#expandable_or_jumpable()
      return "\<Plug>(neosnippet_expand_or_jump)"
   endif
    return "\<tab>"
  endif
endfunction

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
imap <expr><TAB> <SID>neosnippet_complete()
smap <expr><TAB> <SID>neosnippet_complete()
xmap <expr><TAB> <SID>neosnippet_complete()

let g:neosnippet#snippets_directory = '~/.config/nvim/bundle/vim-snippets/snippets'

""""""""""""""""""""""""""""""""""""
" Neomake
""""""""""""""""""""""""""""""""""""
" let g:neomake_open_list = 2
" let g:neomake_warning_sign={'text': '>>', 'texthl': 'Conditional'}
" let g:neomake_error_sign={'text': '>>', 'texthl': 'ErrorMsg'}
" let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_cpp_enable_markers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++11"]
" autocmd! BufWritePost * Neomake

""""""""""""""""""""""""""""""""""""
" nvim-tree
""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""
" RainbowParentheses
""""""""""""""""""""""""""""""""""""
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

""""""""""""""""""""""""""""""""""""
" Fugitive.vim
""""""""""""""""""""""""""""""""""""
" nmap <LocalLeader>gs :Telescope git_status<CR>
" nmap <LocalLeader>gc :Git commit<CR>
nmap <LocalLeader>gb :Telescope git_branches<CR>
nmap <LocalLeader>gn :Git checkout -b<Space>
" nmap <LocalLeader>gh :Git checkout<Space>
nmap <LocalLeader>gv :Gitsigns toggle_current_line_blame<CR>
nmap <LocalLeader>gp :Git -c push.default=current push<CR>
nmap <LocalLeader>gl :Git pull<CR>

""""""""""""""""""""""""""""""""""""
" Projects
""""""""""""""""""""""""""""""""""""

lua << EOF
  require("project_nvim").setup {
    manual_mode = true
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

""""""""""""""""""""""""""""""""""""
" Telescope
""""""""""""""""""""""""""""""""""""

nnoremap <C-p> :Telescope find_files<CR>
nmap <LocalLeader>a :Telescope live_grep<CR>

""""""""""""""""""""""""""""""""""""
" coc.nvim
"
""""""""""""""""""""""""""""""""""""
" Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif
"
" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" " inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
" "                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
"
" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction


set tabstop=2
set shiftwidth=2
set expandtab

augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END

autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

" trigger `autoread` when files changes on disk
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Coc
let g:coc_global_extentions=[
      \ 'coc-tsserver',
      \ 'coc-solargraph'
      \]

lua require('init')

nnoremap <LocalLeader>m :NvimTreeFindFileToggle<CR>
