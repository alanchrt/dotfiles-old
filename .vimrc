" .vimrc - Alan Christopher Thomas
" http://alanchristopherthomas.com/

" Python vimrc to adhere to PEP 7 & 8
" From http://svn.python.org/projects/python/trunk/Misc/Vim/vimrc
source ~/.vim/.vimrc.python

" Import built-in matchit plugin
runtime macros/matchit.vim

" Get rid of omnicomplete doc preview
set completeopt=menu

" Automatically expand tabs into spaces
set expandtab

" Tabs are four spaces
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Turn off search highlighting
set nohls

" Turn of swap files and backups
set nobackup
set noswapfile
set nowritebackup

" Turn of text wrapping
set nowrap

" Display position coordinates in bottom right
set ruler

" Abbreviate messages and disable intro screen
set shortmess=atI

" Use syntax highlighting and color scheme
syntax enable
colorscheme delek

" Use filetype-specific plugins and indentation
set nosmartindent
filetype plugin indent on

" Use comma as leader instead of default '\'
let mapleader = ","

" Advanced python syntax highlighting
let python_highlight_all=1

" Tabs and trailing whitespace are considered bad
match BadWhitespace /^\t\+/
match BadWhitespace /\s\+$/

" Display bad white space and syntax errors in dark gray
highlight BadWhitespace ctermbg=darkgray guibg=darkgray
highlight SpellBad ctermbg=darkgray guibg=darkgray

" Use four spaces for zen coding indentation
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
