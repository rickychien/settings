" common settings
filetype plugin on
filetype indent on
syntax enable

if has("nvim")
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

if has("termguicolors") && $TERM_PROGRAM =~ "iTerm"
  set termguicolors
endif

" vim plug
call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'terryma/vim-smooth-scroll'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'jacoborus/tender.vim'
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
Plug 'moll/vim-node'
Plug 'heavenshell/vim-jsdoc'
Plug 'othree/yajs.vim'
Plug 'Shougo/deoplete.nvim', has('nvim') ? { 'do': ':UpdateRemotePlugins' } : { 'on': [] }

call plug#end()

" color settings
let g:enable_bold_font = 1
colorscheme tender
highlight Normal ctermbg=NONE guibg=NONE
highlight Visual ctermfg=NONE ctermbg=235 guifg=NONE guibg=#282828 gui=NONE cterm=NONE
highlight Search ctermfg=178 ctermbg=23 guifg=#ffd700 guibg=#0a2c3c

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
set cursorline

" ale
let g:ale_sign_column_always = 1

" vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

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
