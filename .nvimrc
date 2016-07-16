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
nnoremap <Leader>d :bdelete<CR>
nnoremap <Leader>s :source ~/.vimrc<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-i> :History<CR>
nnoremap <C-a> :Ag<CR>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

autocmd BufWritePre,FileWritePre * :%s/\s\+$//e | %s/\r$//e " trim trailing whitespace on UNIX and DOS

" vim plug
call plug#begin('~/.vim/plugged')
Plug 'Shougo/vimshell'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
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

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1

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
autocmd! BufWritePost * Neomake
let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"')
let g:neomake_javascript_enabled_makers = ['eslint']
