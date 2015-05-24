"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/Users/Ricky/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/Ricky/.vim/bundle'))

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
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

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
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t'

" Others
set number
set numberwidth=5
set cindent
set ruler
set hlsearch
set wrapscan
set incsearch
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab
set termencoding=utf-8
set pastetoggle=<F2>
set laststatus=2

" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
let g:ctrlp_working_path_mode = 'r'

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
