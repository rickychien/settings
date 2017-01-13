" common settings
filetype plugin indent on
syntax enable

if has("nvim")
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

" vim plug
call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }
Plug 'Shougo/deoplete.nvim', has('nvim') ? { 'do': ':UpdateRemotePlugins' } : { 'on': [] }

call plug#end()

" color settings
let g:enable_bold_font = 1
set background=dark
colorscheme hybrid_reverse
highlight Normal ctermbg=none

" feature settings

set number
set numberwidth=5
set ruler
set hlsearch
set wrapscan
set incsearch
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set termencoding=utf-8
set laststatus=2
set nowrap
set autoread
set backspace=2
set ignorecase
set autoindent
set autoread
set clipboard=unnamed
set hidden
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
set mouse=nicr
set completeopt-=preview
set cursorline

" vim-airline
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme = 'serene'

" vim-jsx-pretty
let g:vim_jsx_pretty_enable_jsx_highlight = 1
let g:vim_jsx_pretty_colorful_config = 1

" deoplete
let g:deoplete#enable_at_startup = 1

" vim-oblique
autocmd! User Oblique       normal! zz
autocmd! User ObliqueStar   normal! zz
autocmd! User ObliqueRepeat normal! zz
hi! def link ObliqueCurrentMatch SpellLocal

" key mapping
let mapleader = ','
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>q :bp<CR>:bd #<CR>
nnoremap <Leader>s :source ~/.vimrc<CR>
nnoremap <Leader><Leader> :e ~/.vimrc<CR>
nnoremap rp :let @+ = expand("%")<CR> " copy current buffer file's relative path to clipboard
nnoremap fp :let @+ = expand("%:p")<CR> " copy current buffer file's full path to clipboard
inoremap jk <esc>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

autocmd BufWritePre,FileWritePre * :%s/\s\+$//e | %s/\r$//e " trim trailing whitespace on UNIX and DOS

