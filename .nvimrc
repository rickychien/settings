" common settings
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
filetype plugin indent on
syntax enable

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

" key mapping
let mapleader = ','
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>q :bp<CR>:bd #<CR>
nnoremap <Leader>s :source ~/.config/nvim/init.vim<CR>
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

" vim plug
call plug#begin('~/.vim/plugged')
Plug 'Shougo/vimshell'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'kuoe0/vim-buffer-switch'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'elzr/vim-json'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }
Plug 'Shougo/deoplete.nvim', has('nvim') ? {} : { 'on': [] }
Plug 'neomake/neomake', has('nvim') ? {} : { 'on': [] }
call plug#end()

" color settings
let g:enable_bold_font = 1
set background=dark
colorscheme hybrid_reverse

" Tab completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" JavaScript
let g:javascript_enable_domhtmlcss = 1

" JSX
let g:jsx_ext_required = 0 " allow JSX in normal JS files

" NerdTree

let g:NERDTreeWinSize=36

" vim-airline
let g:airline_theme='jellybeans'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

" easymotion
let g:EasyMotion_leader_key = '<Leader>'

" vim-oblique
autocmd! User Oblique       normal! zz
autocmd! User ObliqueStar   normal! zz
autocmd! User ObliqueRepeat normal! zz
hi! def link ObliqueCurrentMatch SpellLocal

" deoplete
let g:deoplete#enable_at_startup = 1

" neomake
autocmd! BufEnter,BufReadPost,BufWritePost * Neomake
let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"')
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_verbose = 0
let g:neomake_warning_sign = {
  \ 'text': '✹',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': '✖',
  \ 'texthl': 'ErrorMsg',
  \ }
