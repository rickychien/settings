"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bling/vim-airline'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Shutnik/jshint2.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'w0ng/vim-hybrid'
NeoBundleLazy 'othree/yajs.vim', {'autoload':{'filetypes':['javascript']}}

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" color settings
colorscheme hybrid
syntax enable
set t_Co=256

" vim-airline
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#show_buffers = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#buffer_idx_mode = 1

" Others
set number
set numberwidth=5
set cindent
set ruler
set hlsearch
set wrapscan
set incsearch
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set termencoding=utf-8
set pastetoggle=<F2>
set laststatus=2
set nowrap
set cursorline

" ctrlp
let g:ctrlp_working_path_mode = 'r'

" use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" easymotion
let g:EasyMotion_leader_key = '<Leader>'

" key mapping
let mapleader = ','
nnoremap <Backspace> :noh<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Leader>d :bdelete<CR>
nnoremap <Leader>s :source ~/.vimrc<CR>
nnoremap <Leader>l :JSHint<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
