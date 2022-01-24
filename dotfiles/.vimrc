let mapleader=" "

" =================================
" Plugins
" =================================

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'ycm-core/YouCompleteMe'
" Plug 'dense-analysis/ale'
" Plug 'ackyshake/VimCompletesMe'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'plasticboy/vim-markdown' 
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'mangeshrex/uwu.vim'
" Plug 'ghifarit53/tokyonight-vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'liuchengxu/vim-which-key'
Plug 'preservim/tagbar'


call plug#end()

nmap <leader>tt :TagbarToggle<CR>

" YouCompleteMe
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_auto_trigger = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_use_ultisnips_completer = 1
nmap <leader>yt <plug>(YCMHover)

nmap <leader>o :TagbarToggle<CR>
colorscheme uwu
set background=dark
" colorscheme nord
" colorscheme tokyonight
" let g:tokyonight_enable_italic = 1

" Airline
" let g:airline_theme='wombat'
let g:airline_theme='bubblegum'
let g:airline#extensions#ale#enabled='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
let g:airline_section_z= 'X: %-4lTot: %-4L | Y: %c'
let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S',
    \ ''     : 'S',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V',
    \ ''     : 'V',
    \ }

" Vim-Markdown
nmap <leader>mp <Plug>MarkdownPreview
nmap <leader>ms <Plug>MarkdownPreviewStop
nmap <leader>mt <Plug>MarkdownPreviewToggle


" Vimtex
let g:vimtex_view_method = 'zathura'


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

" au Filetype html set
"     \ tabstop=2
"     \ softtabstop=4
"     \ shiftwidth=2


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
nnoremap 'q :vimgrep /\*\*Q\*\*/ %<CR>
nmap ; :
imap jj <Esc>
imap jk <Esc>
" nnoremap <C-b> i****<ESC>hi
" nnoremap <C-i> i**<ESC>i
nnoremap <leader>a ea

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

hi Normal guibg=NONE ctermbg=NONE
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline
hi CursorLineNR cterm=bold guifg=pink 
