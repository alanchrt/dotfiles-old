set softtabstop=4
set shiftwidth=4
set tabstop=4
set textwidth=79
set expandtab
set nobackup
set nowritebackup
set noswapfile
set nohls
set autoindent
set smartindent
set nowrap
syntax on
colorscheme delek
filetype plugin indent on

let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1

" Map Ctrl+\ to Shift+Backspace for delimitMate in terminal.
" The ^\ character may not be visible in some text editors.
imap  <S-BS>
