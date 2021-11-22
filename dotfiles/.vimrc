let mapleader=" "

" =================================
" Plugins
" =================================

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'ghifarit53/tokyonight-vim'
Plug 'dense-analysis/ale'
Plug 'ackyshake/VimCompletesMe'

call plug#end()

colorscheme tokyonight
let g:tokyonight_enable_italic = 1

" fzf
let g:fzf_preview_window = ['right:40%', 'ctrl-/']
nnoremap 'g  :Rg<CR>
nnoremap <C-f> :FZF<CR>

" Nerdtree
let NERDTreeShowHidden=1
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
" autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


" =================================
" Programming Language Specific
" =================================
au Filetype python set 
	\ tabstop=4
	\ softtabstop=4
	\ shiftwidth=4
	\ textwidth=79

au Filetype html set
	\ tabstop=2
	\ softtabstop=4
	\ shiftwidth=2


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

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" =================================
" Mappings
" =================================

nnoremap Y y$
nnoremap 'i :e ./index.md<CR>
nnoremap 'q :vimgrep /\*\*Q\*\*/ %<CR>
nmap ; :
imap jj <Esc>
" nnoremap <C-b> i****<ESC>hi
" nnoremap <C-i> i**<ESC>i
nnoremap <leader>a ea

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

hi Normal guibg=NONE ctermbg=NONE
