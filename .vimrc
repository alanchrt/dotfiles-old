" .vimrc - Alan Christopher Thomas
" http://alanct.com/


" """"""""""""""""""""""""""""""""""""""""""""""""
" =============== General Settings ===============

" Automatically expand tabs into spaces
set expandtab

" Tabs are four spaces
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Use expected backspace behavior
set backspace=indent,eol,start

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

" Get rid of omnicomplete doc preview
set completeopt=menu

" Use filetype-specific plugins and indentation
set nosmartindent
filetype plugin indent on

" Turn off automatic line breaking in html and css
au BufRead,BufNewFile *.html,*.css set textwidth=0

" Ignore compiled python
set wildignore+=*.pyc


" """"""""""""""""""""""""""""""""""""""""""""""""
" ============= Custom Key Bindings ==============

" Use comma as leader
let mapleader = ','

" Remap new tab
nmap <Leader>t <Esc>:tabnew<CR>

" Remap movement between windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Remap window rearrangement
nmap <C-m>h <C-w>H
nmap <C-m>j <C-w>J
nmap <C-m>k <C-w>K
nmap <C-m>l <C-w>L

" Expand into multiple lines and focus the center line
imap <C-E> <Esc>a<Enter><Esc>O

" Toggle paste keybinding
set pastetoggle=<Leader>p

" Ctrl-P rebinding
map <Leader>f :CtrlP<CR>

" """"""""""""""""""""""""""""""""""""""""""""""""
" =============== Plugin Settings ================

" Use pathogen for plugins
execute pathogen#infect()

" Use syntastic for flake8
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=['flake8']

" Prevent run code plugin loading
let g:pymode_run = 0

" Prevent pylint plugin loading
let g:pymode_lint = 0

" Disable python folding
let g:pymode_folding = 0

" Disable default pymode python options
let g:pymode_options = 0

" Show status line for single windows
set laststatus=2

" Disable airline separators
let g:airline_left_sep=''
let g:airline_right_sep=''

" Set airline theme
let g:airline_theme='powerlineish'

" """"""""""""""""""""""""""""""""""""""""""""""""
" ==================== Colors ====================

" Use syntax highlighting and color scheme
syntax enable
colorscheme lodestone

" Use 256 colors in color schemes
set t_Co=256
set term=screen-256color

" Highlight excess line length in python
autocmd FileType python highlight Excess ctermbg=8
autocmd FileType python match Excess /\%80v.*/
autocmd FileType python set nowrap

" Use slightly dimmer text for the normal group
highlight Normal ctermfg=254 ctermbg=0
