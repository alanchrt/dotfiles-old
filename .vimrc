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
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Expand into multiple lines and focus the center line
imap <C-E> <Esc>a<Enter><Esc>O

" Toggle paste keybinding
set pastetoggle=<Leader>p

" NERDTree key binding
map <C-n> :NERDTreeToggle<CR>


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

" Show powerline for single windows
set laststatus=2

" Don't use slash for self-closing html tags
let g:user_zen_settings = {
\  'html' : {
\    'empty_element_suffix' : '>',
\  }
\}

" """"""""""""""""""""""""""""""""""""""""""""""""
" ==================== Colors ====================

" Use syntax highlighting and color scheme
syntax enable
colorscheme delek

" Use 256 colors in color schemes
set t_Co=256

" Bad spelling highlight color
highlight SpellBad term=reverse ctermbg=8

" Error and todo highlight colors
highlight Error ctermfg=0 ctermbg=7
highlight Todo ctermfg=0 ctermbg=7

" Diff highlight colors
highlight DiffAdd ctermfg=15 ctermbg=4
highlight DiffDelete ctermfg=8 ctermbg=0
highlight DiffChange ctermfg=7 ctermbg=4
highlight DiffText ctermfg=3 ctermbg=4

" Syntastic highlight colors
highlight SyntasticErrorSign ctermfg=0 ctermbg=7
highlight SyntasticWarningSign ctermfg=0 ctermbg=7
highlight SyntasticStyleErrorSign ctermfg=0 ctermbg=7
highlight SyntasticStyleWarningSign ctermfg=0 ctermbg=7

" Highlight excess line length in python
autocmd FileType python highlight Excess ctermbg=8
autocmd FileType python match Excess /\%80v.*/
autocmd FileType python set nowrap

" Omnicomplete menu color
highlight Pmenu ctermfg=7 ctermbg=4
highlight PmenuSel ctermfg=15 ctermbg=8

" Use menu color for command-t selections
let g:CommandTHighlightColor = 'Pmenu'
