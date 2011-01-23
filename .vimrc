source ~/.vim/.vimrc.python
runtime macros/matchit.vim

set completeopt=menu
set expandtab
set nobackup
set nohls
set noswapfile
set nowrap
set nowritebackup
set ruler
set shiftwidth=4
set shortmess=atI
set softtabstop=4
set tabstop=4

syntax enable
colorscheme delek
filetype plugin indent on

let mapleader = ","
let python_highlight_all=1
match BadWhitespace /^\t\+/
match BadWhitespace /\s\+$/
highlight BadWhitespace ctermbg=green guibg=green"

let g:user_zen_settings = {
\  'indentation' : '    ',
\  'perl' : {
\    'aliases' : {
\      'req' : 'require '
\    },
\    'snippets' : {
\      'use' : "use strict\nuse warnings\n\n",
\      'warn' : "warn \"|\";",
\    }
\  }
\}
