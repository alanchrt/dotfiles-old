source ~/.vim/.vimrc.python
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set nowritebackup
set noswapfile
set nohls
set nowrap
syntax enable
filetype plugin indent on
colorscheme delek
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
