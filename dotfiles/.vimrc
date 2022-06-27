let mapleader=" "

" =================================
" Vim Plugged
" =================================

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-unimpaired', 

" Vimwiki
Plug 'vimwiki/vimwiki', { 'on': 'VimwikiIndex', 'do':'set nocompatible' }
Plug 'tools-life/taskwiki', {'on':'VimwikiIndex'}

Plug 'vim-airline/vim-airline', 
Plug 'vim-airline/vim-airline-themes', 

" General
Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind', 'OpenBookmark'] }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich' " change? 
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'

" VimTex
Plug 'lervag/vimtex', { 'for' : 'tex'}
Plug 'morhetz/gruvbox'

call plug#end()

" =================================
" Plugin Settings
" =================================
" nnoremap <Plug> <Plug>Markdown_OpenUrlUnderCursor
nmap <leader>tt :TagbarToggle<CR>
" List Marks
nnoremap <leader>ml :<C-u>marks<CR>:normal! 
" Vim-Sandwich
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

" Nerdtree
let NERDTreeShowHidden=0
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>nc :NERDTreeCWD<CR>
nnoremap <leader>nb :NERDTreeShowBookmarks<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" fzf
let g:fzf_preview_window = ['right:40%', 'ctrl-/']
" TEXT IN FILES
nnoremap <leader>fr  :Rg<CR>
" FILES
nnoremap <leader>fz :FZF<CR>

" =================================
" General
" =================================
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

set background=dark
set title
set clipboard+=unnamedplus
set encoding=UTF-8
colorscheme gruvbox

set number
set relativenumber

set incsearch
set hlsearch

set showcmd
set ignorecase
set smartcase
set ruler
set wrap
set splitbelow splitright
set autoindent
filetype plugin indent on
filetype plugin on
syntax on

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" =================================
" Mappings
" =================================

nnoremap <C-f> za
nnoremap <leader>sq i*Q* 
nnoremap Y y$
nnoremap 'q :vimgrep /\*\*Q\*\*/ %<CR>
nmap ; :
imap jj <Esc>
imap jk <Esc>

map <leader>+ <C-w>5+
map <leader>- <C-w>5-
map <leader>< <C-w>5<
map <leader>> <C-w>5>
map <leader>= <C-w>=
map <leader>_ <C-w>|
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

if (&tildeop)
  nmap gc$ gu$~l
  vmap gc gu~l
else
  nmap gc$ gu$~h
  vmap gc gu~h
endif

vmap gc :s/\%V\v<(.)(\w*)/\u\1\L\2/g<CR> \| `<

hi Normal guibg=NONE ctermbg=NONE
hi LineNr ctermfg=yellow
set conceallevel=1
set noshowmode

source ~/.vimrc-extra

