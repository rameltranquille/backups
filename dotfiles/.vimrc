
let mapleader=" "

" =================================
" Plugins
" =================================

call plug#begin('~/.vim/plugged')

Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'iamcco/markdown-preview.nvim'

call plug#end()
" Vim Markdown
let g:vim_markdown_math = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_no_extensions_in_markdown = 1
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

" =================================
" Mappings
" =================================

nnoremap <C-b> i****<ESC>hi
nnoremap <C-i> i**<ESC>i

nnoremap 'q :vimgrep /\*\*Q\*\*/ %<CR>
nnoremap 'i :e ./index.md<CR>
