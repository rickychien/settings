"NeoBundle Scripts-----------------------------
if has('vim_starting')
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
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'JazzCore/ctrlp-cmatcher'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kristijanhusak/vim-hybrid-material'
NeoBundle 'elzr/vim-json'
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'junegunn/vim-pseudocl'
NeoBundle 'junegunn/vim-oblique'

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
let g:enable_bold_font = 1
colorscheme hybrid_reverse
syntax enable

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1

" vim-jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Others
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

" autocmd
autocmd BufWritePre * :%s/\s\+$//e

" deoplete
let g:deoplete#enable_at_startup = 1

" ctrlp
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_match_func = { 'match' : 'matcher#cmatch' }

" the silver searcher
if executable('ag')
  " use ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" easymotion
let g:EasyMotion_leader_key = '<Leader>'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ignore_files = ['^/usr/', '*node_modules*']
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" key mapping
let mapleader = ','
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Leader>d :bdelete<CR>
nnoremap <Leader>s :source ~/.vimrc<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Easy window navigation
map <C-H> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
