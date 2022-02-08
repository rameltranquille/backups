let mapleader=" "

" =================================
" Vim Plugged
" =================================

call plug#begin('~/.vim/plugged')

" Zettel
Plug 'vimwiki/vimwiki', { 'on': 'VimwikiIndex' }
Plug 'michal-h21/vim-zettel', { 'on' : 'VimwikiIndex', 'for' : 'vimwiki' }
Plug 'alok/notational-fzf-vim', { 'on': 'NV' }
Plug 'vim-airline/vim-airline', { 'for' : 'vimwiki' }
Plug 'vim-airline/vim-airline-themes', { 'for' : 'vimwiki' }

if !has("vim-airline")
	Plug 'itchyny/lightline.vim'
endif

" General
Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeCWD', 'OpenBookmark'] }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich' " change? 
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
" Plug 'ycm-core/YouCompleteMe'

" VimTex
Plug 'lervag/vimtex', { 'for' : 'tex'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'preservim/vim-markdown',

" Plug 'drmingdrmer/vim-tabbar'
Plug 'ghifarit53/tokyonight-vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'mangeshrex/uwu.vim'

Plug 'junegunn/vim-easy-align'
call plug#end()

" =================================
" Plugin Settings
" =================================
nnoremap <Plug> <Plug>Markdown_OpenUrlUnderCursor
" Tabs
nmap <leader>qt :tabclose<CR>
" Tagbar
nmap <leader>tt :TagbarToggle<CR>
" List Marks
nnoremap <leader>ml :<C-u>marks<CR>:normal!
" Colorscheme
colorscheme tokyonight

" Vim-Sandwich
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

" Vim Lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Vim Airline
let g:airline#extensions#tabline#enabled = 1
" Airline
let g:airline_theme='bubblegum'
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


" YouCompleteMe
" let g:ycm_min_num_of_chars_for_completion = 2
" let g:ycm_auto_trigger = 1
" let g:ycm_complete_in_comments = 1
" let g:ycm_complete_in_strings = 1
" nmap <leader>yt <plug>(YCMHover)
" let g:ycm_use_ultisnips_completer = 1


" Vim-Markdown
nmap <leader>mp <Plug>MarkdownPreview
nmap <leader>ms <Plug>MarkdownPreviewStop
nmap <leader>mt <Plug>MarkdownPreviewToggle
let g:vim_markdown_fold = 0
" let g:vim_markdown_folding_level = 0
" let g:vim_markdown_math = 1
" let g:vim_markdown_auto_extension_ext = ['md', 'txt', 'vimwiki']
" let g:vim_markdown_no_extensions_in_markdown = 1

" Notational-fzf
let g:nv_search_paths = ['~/Dropbox/workbench', '~/Dropbox/foundations', '~/Dropbox/orgComm', '~/Dropbox/AsianEcon', '~/Dropbox/DS']
let g:nv_default_extension = '.md'
nnoremap <silent> <leader>nv :NV<CR>

" Vimwiki
let g:vimwiki_list = [
	\ {'path':'~/Dropbox/workbench/','ext':'.md','syntax':'markdown', 'index':'home'}, 
	\ {'path':'~/Dropbox/foundations/','ext':'.md','syntax':'markdown', 'index':'benchF'}, 
	\ {'path':'~/Dropbox/AsianEcon/','ext':'.md','syntax':'markdown', 'index':'benchA'}, 
	\ {'path':'~/Dropbox/orgComm/','ext':'.md','syntax':'markdown', 'index':'benchOC'}, 
	\ {'path':'~/Dropbox/DS/','ext':'.md','syntax':'markdown', 'index':'benchDS'}, 
	\ ]
	" \ {'path':'~/Dropbox/','ext':'.md','syntax':'markdown', 'index':'index'}, 


" let g:vimwiki_global_ext = 0
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
nmap <Leader>wov :VimwikiToggleVSplitLink<CR>
nmap <Leader>wos :VimwikiSplitLink<CR>
nmap <Leader>wc :VimwikiToggleListItem<CR>

" Zettel
let g:zettel_format = "%y%m%d-%H%M-%title"
nnoremap <leader>zn :ZettelNew<CR>
nnoremap <leader>zo :ZettelOpen<CR>
nnoremap <leader>zc :ZettelCapture<CR>
nnoremap <leader>zs :ZettelSearch<CR>
" set completeopt=longest,menuone


" Vimtex
let g:vimtex_view_method = 'zathura'


" fzf
let g:fzf_preview_window = ['right:40%', 'ctrl-/']
" TEXT IN FILES
nnoremap <leader>fr  :Rg<CR>
" FILES
nnoremap <leader>fz :FZF<CR>

" Nerdtree
let NERDTreeShowHidden=0
" let NERDTreeBookmarksFile='/home/ramel/Dropbox/.bookmarks'
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>nc :NERDTreeCWD<CR>
nnoremap <leader>nb :NERDTreeShowBookmarks<CR>
nnoremap <leader>nf :NERDTreeFocus<CR>
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

