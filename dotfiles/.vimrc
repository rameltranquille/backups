let mapleader=" "

" =================================
" Vim Plugged
" =================================

call plug#begin('~/.vim/plugged')

" Zettel
Plug 'vimwiki/vimwiki', { 'on': 'VimwikiIndex' }
Plug 'michal-h21/vim-zettel', { 'on' : 'VimwikiIndex', 'for' : 'vimwiki' }
Plug 'alok/notational-fzf-vim', { 'on': 'NV' }
Plug 'plasticboy/vim-markdown',{ 'on': 'VimwikiIndex', 'for' : 'vimwiki' }
Plug 'itchyny/lightline.vim'

" General
Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich' " change? 
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'ycm-core/YouCompleteMe'

" VimTex
Plug 'lervag/vimtex', { 'for': 'tex'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'on': 'MarkdownPreview'}

Plug 'drmingdrmer/vim-tabbar'
Plug 'ghifarit53/tokyonight-vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'mangeshrex/uwu.vim'

call plug#end()

" =================================
" Plugin Settings
" =================================

nmap <leader>tt :TagbarToggle<CR>
colorscheme tokyonight

" Vim-Sandwich
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

" Vim Lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" YouCompleteMe
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_auto_trigger = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
nmap <leader>yt <plug>(YCMHover)
" let g:ycm_use_ultisnips_completer = 1


" Vim-Markdown
nmap <leader>mp <Plug>MarkdownPreview
nmap <leader>ms <Plug>MarkdownPreviewStop
nmap <leader>mt <Plug>MarkdownPreviewToggle
let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_math = 1

" Notational-fzf
let g:nv_search_paths = ['~/Dropbox/Notebook', '~/Dropbox/foundations', '~/Dropbox/orgComm', '~/Dropbox/Calc2', '~/Dropbox/DS']
let g:nv_default_extension = '.md'
nnoremap <silent> <leader>nv :NV<CR>

" Vimwiki
let g:vimwiki_list = [
	\ {'path':'~/Dropbox/workbench/','ext':'.md','syntax':'markdown'}, 
	\ {'path':'~/Dropbox/foundations/','ext':'.md','syntax':'markdown'}, 
	\ {'path':'~/Dropbox/Calc2/','ext':'.md','syntax':'markdown'}, 
	\ {'path':'~/Dropbox/orgComm/','ext':'.md','syntax':'markdown'}, 
	\ {'path':'~/Dropbox/DS/','ext':'.md','syntax':'markdown'}, 
	\ ]

function! VimwikiFindIncompleteTasks()
  lvimgrep /- \[ \]/ %:p
  lopen
endfunction

function! VimwikiFindAllIncompleteTasks()
  VimwikiSearch /- \[ \]/
  lopen
endfunction

nmap <Leader>wa :call VimwikiFindAllIncompleteTasks()<CR>
nmap <Leader>wx :call VimwikiFindIncompleteTasks()<CR>
nmap <Leader>wc :VimwikiToggleListItem<CR>

" Zettel
let g:zettel_format = "%y%m%d-%H%M-%title"
nnoremap <leader>zn :ZettleNew<CR>
nnoremap <leader>zo :ZettleOpen<CR>
nnoremap <leader>zc :ZettleCapture<CR>
nnoremap <leader>zs :ZettleSearch<CR>
" set completeopt=longest,menuone


" Vimtex
let g:vimtex_view_method = 'zathura'


" fzf
let g:fzf_preview_window = ['right:40%', 'ctrl-/']
" TEXT IN FILES
nnoremap fr  :Rg<CR>
" FILES
nnoremap <leader>fz :FZF<CR>

" Nerdtree
let NERDTreeShowHidden=1
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>nt :NERDTreeFocus<CR>
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
" General
" =================================
" colorscheme uwu
set background=dark
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
" set cursorline
" highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
" hi CursorLineNR cterm=bold guifg=pink 
set conceallevel=2
set noshowmode

