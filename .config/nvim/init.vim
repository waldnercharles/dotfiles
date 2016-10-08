set nocompatible

" Plug
call plug#begin("~/.config/nvim/plugged")

if has("nvim")
	Plug 'benekastah/neomake'
else
	Plug 'scrooloose/syntastic'
	Plug 'tpope/vim-dispatch'
endif

if has("python")
	Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer' }
endif

call plug#end()

" colors & syntax
syntax enable		" enable syntax highlighting
set background=dark	" dark background color

" essentials
filetype plugin indent on
set encoding=utf-8
set binary
set hidden
set showcmd
set showmode
set autoread
set ttyfast
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set nofoldenable
set laststatus=2

" temp files
set nobackup
set noswapfile

" line numbers
set number

" rulers
" set colorcolumn=80,120

" scrolling
set scrolloff=3			" keep at least 3 lines above/below
set sidescrolloff=3		" keep at least 3 lines left/right

" searching
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch
vnoremap // y/<C-R>"<CR>

" indentation
set smarttab
set smartindent
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

" key sequence timeout
set ttimeout
set ttimeoutlen=100

" backspace
set backspace=indent,eol,start

" mouse
set mousehide
set mouse=nicr

" typos
cnoreabbrev W w
cnoreabbrev Q q

" wrapping
set nowrap
set linebreak
set textwidth=0
set wrapmargin=0

" completion menu
set completeopt=longest,menuone

" spell checking
set spelllang=en_us
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" doxygen
autocmd Filetype c,cpp set comments^=:///

" disable bells
set noeb vb t_vb=

" treat underscore as a word boundary
set iskeyword-=_
set iskeyword-=.
set iskeyword-=#
set iskeyword-=-

" wrapping
vmap Q gq
nmap Q gqap

" cycle through buffers
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>

" close window
nmap <silent> <Leader>wd <C-w> q

" splits
set splitbelow
set splitright

" enable copy/paste
set clipboard=unnamed
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" ctags
set tags=tags;

" joining
set nojoinspaces
if has('patch-7.3.541')
	set formatoptions+=j
endif

" undo
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/undo
	set undolevels=1000
	set undoreload=10000
endif

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" watch .vimrc
augroup reload_vimrc
	autocmd!
	autocmd BufWritePost $VIMRC source $VIMRC
augroup END

" functions

" highlight duplicate lines

