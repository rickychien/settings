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
NeoBundle 'mxw/vim-jsx'
NeoBundle 'valloric/YouCompleteMe'
NeoBundle 'burke/matcher'
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
set cursorline
set autoread
set backspace=2
set ignorecase
set autoindent
set autoread

" autocmd
autocmd BufWritePre * :%s/\s\+$//e

" ctrlp
let g:ctrlp_working_path_mode = 'r'

" the silver searcher
if executable('ag')
  " use ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" matcher
if executable('matcher')
	let g:ctrlp_match_func = { 'match': 'GoodMatch' }

	function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)

		" Create a cache file if not yet exists
		let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
		if !( filereadable(cachefile) && a:items == readfile(cachefile) )
			call writefile(a:items, cachefile)
		endif
		if !filereadable(cachefile)
			return []
		endif

		" a:mmode is currently ignored. In the future, we should probably do
		" something about that. the matcher behaves like "full-line".
		let cmd = 'matcher --limit '.a:limit.' --manifest '.cachefile.' '
		if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
			let cmd = cmd.'--no-dotfiles '
		endif
		let cmd = cmd.a:str

		return split(system(cmd), "\n")

	endfunction
end

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
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
