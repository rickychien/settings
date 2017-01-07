" common settings
filetype plugin indent on
syntax enable

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'mxw/vim-jsx'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'kristijanhusak/vim-hybrid-material'

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
set clipboard=unnamedplus
set hidden
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile

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
let g:airline_theme='serene'

" key mapping
let mapleader = ','
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>q :bp<CR>:bd #<CR>
nnoremap <Leader>s :source ~/.vimrc<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-o> :History<CR>
nnoremap <C-a> :Ag<CR>
nnoremap rp :let @+ = expand("%")<CR> " copy current buffer file's relative path to clipboard
nnoremap fp :let @+ = expand("%:p")<CR> " copy current buffer file's full path to clipboard

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

autocmd BufWritePre,FileWritePre * :%s/\s\+$//e | %s/\r$//e " trim trailing whitespace on UNIX and DOS

