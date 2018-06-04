" common settings
filetype plugin on
filetype indent on
syntax enable

" feature settings
set autoread
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
set magic
set backspace=2
set ignorecase
set autoindent
set clipboard=unnamed
set hidden
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
set mouse=nicr
set completeopt-=preview

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