" common settings
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
Plug 'othree/es.next.syntax.vim' , { 'for': 'javascript' }
Plug 'gavocanov/vim-js-indent' , { 'for': 'javascript' }
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

" vim-jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" autocmd
autocmd BufWritePre * :%s/\s\+$//e

" deoplete
let g:deoplete#enable_at_startup = 1

" neomake
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_open_list = 1
let g:neomake_javascript_eslint_maker = {
    \ 'args': ['--no-color', '--format', 'compact', '--config', '~/.eslintrc.json'],
    \ 'errorformat': '%f: line %l\, col %c\, %m'
    \ }
function! NeomakeESlintChecker()
  let l:npm_bin = ''
  let l:eslint = 'eslint'

  if executable('npm-which')
    let l:eslint = split(system('npm-which eslint'))[0]
    return 0
  endif

  if executable('npm')
    let l:npm_bin = split(system('npm bin'), '\n')[0]
  endif

  if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
    let l:eslint = l:npm_bin . '/eslint'
  endif

  let b:neomake_javascript_eslint_exe = l:eslint
endfunction

autocmd FileType javascript :call NeomakeESlintChecker()

" easymotion
let g:EasyMotion_leader_key = '<Leader>'

" vim-oblique
autocmd! User Oblique       normal! zz
autocmd! User ObliqueStar   normal! zz
autocmd! User ObliqueRepeat normal! zz
hi! def link ObliqueCurrentMatch SpellLocal

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

" cursor window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
