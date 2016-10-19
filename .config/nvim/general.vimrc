" nvim defaults
set nocompatible		" disable vi compatibility
filetype plugin indent on	" enable filetype detection

set ttyfast			" faster redraw
set ttymouse=xterm2		" faster and more precise mouse handling
set ttyscroll=3			" maximum number of lines to scroll the screen

set laststatus=2		" set last window to always have status line
set encoding=utf-8		" set default encoding to UTF-8
set autoread			" automatically reload changed files
set autoindent			" copy indent from current line when starting new line
set backspace=indent,eol,start	" treat backspace like normal.
set incsearch			" show match while typing
set hlsearch			" highlight found searches
set mouse=a			" enable mouse for all modes

" general
set hidden			" unload buffers when abandoned
set noswapfile			" disable swapfile
set nobackup			" disable annoying backup files
set autowrite			" auto save before :make, :next, etc.
set noshowmode			" todo: show mode with airline or lightline
set completeopt=menu,menuone
set nocursorcolumn		" speed up syntax highlighting

" colors
syntax enable			" enable syntax highlighting

" spaces & tabs
set tabstop=8			" tabs are 8 columns
set softtabstop=8		" indentation levels are 8 columns
set noexpandtab			" use tabs instead of spaces

" ui
set number			" show line numbers
set showcmd			" show command in bottom bar
set nocursorline		" highlight current line
set wildmenu			" enable menu for command line completion
set noshowmatch			" do not show matching brackets by flickering
set noerrorbells  		" no beeps
set novisualbell		" no visual beeping
set splitright			" split vertical windows to the right of current window
set splitbelow			" split horizontal windows below current window
set pumheight=10		" max completion window size

" searching
set ignorecase			" ignore case when searching...
set smartcase			" ... unless it begins upper case

" folding
set nofoldenable		" disable folding

" shortcuts - line navigation
onoremap j gj
onoremap k gk
onoremap 0 g0
onoremap ^ g^
onoremap $ g$
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap ^ g^
nnoremap $ g$

