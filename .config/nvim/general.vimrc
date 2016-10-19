" nvim defaults
set nocompatible                " disable vi compatibility
filetype plugin indent on       " enable filetype detection

set ttyfast                     " faster redraw
set ttymouse=xterm2             " faster and more precise mouse handling
set ttyscroll=3                 " maximum number of lines to scroll the screen

set laststatus=2                " set last window to always have status line
set encoding=utf-8              " set default encoding to UTF-8
set autoread                    " automatically reload changed files
set autoindent                  " copy indent from current line when starting new line
set backspace=indent,eol,start  " treat backspace like normal.
set incsearch                   " show match while typing
set hlsearch                    " highlight found searches
set mouse=a                     " enable mouse for all modes

" colors
syntax enable                   " enable syntax highlighting

" spaces & tabs
set tabstop=8                   " tabs are 8 columns
set softtabstop=8               " indentation levels are 8 columns
set noexpandtab                 " use tabs instead of spaces

" ui layout
set number                      " show line numbers
set showcmd                     " show command in bottom bar
set nocursorline                " highlight current line
set wildmenu                    " enable menu for command line completion
set showmatch                   " highlight matching parenthesis
