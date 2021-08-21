let mapleader=","

" =================================
" Plugins
" =================================

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex'
Plug 'vim-syntastic/syntastic'
Plug 'ycm-core/YouCompleteMe'

call plug#end()

colorscheme dracula

" Airline
let g:airline_theme='molokai'
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#fzf#enabled=1

" Syntastic
" let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Vim Markdown
let g:vim_markdown_math = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_no_extensions_in_markdown = 1


" fzf
let g:fzf_preview_window = ['right:40%', 'ctrl-/']
nnoremap 'g  :Rg<CR>
nnoremap <C-f> :FZF<CR>
nnoremap f za


" Nerdtree
let NERDTreeShowHidden=1
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
" autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'


" =================================
" Programming Language Specific
" =================================

autocmd Filetype tex nnoremap <buffer> <F12> :update<bar>VimtexCompile<CR>
autocmd Filetype html nnoremap <buffer> <F12> :update<bar>!firefox %<CR>

au Filetype python set 
	\ tabstop=4
	\ softtabstop=4
	\ shiftwidth=4
	\ textwidth=79

au Filetype html set
	\ tabstop=2
	\ softtabstop=4
	\ shiftwidth=2

" au Filetype css set 
" 	\ tabstop=2 \ softtabstop=2
	" \ shiftwidth=2 

au Filetype cpp set 
	\ textwidth=79
	\ tabstop=4
	\ shiftwidth=4


" =================================
" Basics
" =================================
set title
set clipboard+=unnamedplus
set encoding=UTF-8
set nocompatible
set number
set relativenumber
set incsearch
set hlsearch
set showcmd
set smarttab
set ignorecase
set smartcase
set ruler 
set wrap
set splitbelow splitright
filetype plugin indent on 
syntax on


" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" =================================
" Mappings
" =================================

nnoremap <C-j> <esc>:m .+1<CR>==
nnoremap <C-k> <esc>:m .-1<CR>==
nnoremap Y y$
nnoremap 'i :e ./index.md<CR>
nnoremap 'q :vimgrep /\*\*Q\*\*/ %<CR>
nmap ; :
imap jj <Esc>
inoremap <C-v> <ESC>"+pa
nmap 'p :silent !./scripts/pdf_preview % <CR>

nnoremap <C-b> i****<ESC>hi
nnoremap <C-i> i**<ESC>i

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

hi Normal guibg=NONE ctermbg=NONE
hi Comment ctermfg=32
