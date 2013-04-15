" .vimrc - Alan Christopher Thomas
" http://alanct.com/

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
colorscheme darkblue

" Use filetype-specific plugins and indentation
set nosmartindent
filetype plugin indent on

" Use comma as leader instead of default '\'
let mapleader = ","

" Remap new tab
nmap <Leader>t <Esc>:tabnew<CR>

" Turn off automatic line breaking in html and css
au BufRead,BufNewFile *.html,*.css set textwidth=0

" Use 256 colors in color schemes
set t_Co=256

" Use pathogen for plugins
execute pathogen#infect()

" Set pyflakes highlight color
highlight SpellBad term=reverse ctermbg=8

" Set diff highlight colors
highlight DiffAdd term=reverse ctermbg=7
highlight DiffDelete ctermfg=0 ctermbg=7
highlight DiffChange term=reverse ctermbg=8
highlight DiffText ctermfg=7 ctermbg=8
