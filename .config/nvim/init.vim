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

" Highlight duplicate lines
" http://stackoverflow.com/questions/1268032/marking-duplicate-lines
function! HighlightRepeats() range
    let lineCounts={}
    let lineNum=a:firstline
    while lineNum <= a:lastline
        let lineText=getline(lineNum)
        if lineText != ""
            let lineCounts[lineText]=(has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
        endif
        let lineNum=lineNum + 1
    endwhile
    exe 'syn clear Repeat'
    for lineText in keys(lineCounts)
        if lineCounts[lineText] >= 2
            exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
        endif
    endfor
endfunction
command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()

" Switch between source and header files using ctags
" Rudimentary approach: only supports .cpp and .h
function! Switch()
    let baseName=expand('%:t:r')
    let extension=expand('%:e')
    if extension =~ 'c'
        execute "tag " . baseName . '.h'
    else
        execute "tag " . baseName . '.cpp'
    endif
endfunction
nmap <silent> <Leader>fs :call Switch()<CR>

" YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist=['~/.config/nvim/*']
let g:ycm_always_populate_location_list = 0
let g:ycm_auto_trigger=1
let g:ycm_enable_diagnostic_highlighting=1
let g:ycm_enable_diagnostic_signs=1
let g:ycm_max_diagnostics_to_display=10000
let g:ycm_min_num_identifier_candidate_chars=0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_open_loclist_on_ycm_diags=1
let g:ycm_show_diagnostics_ui=1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filetype_blacklist={
            \ 'vim' : 1,
            \ 'tagbar' : 1,
            \ 'qf' : 1,
            \ 'notes' : 1,
            \ 'markdown' : 1,
            \ 'md' : 1,
            \ 'unite' : 1,
            \ 'text' : 1,
            \ 'vimwiki' : 1,
            \ 'pandoc' : 1,
            \ 'infolog' : 1,
            \ 'mail' : 1
            \}

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
nnoremap <F12> :YcmDiags<CR>
nnoremap <silent> <Leader>yd :YcmDiags<CR>
nnoremap <silent> <Leader>fi :YcmCompleter FixIt<CR>
nnoremap <silent> <Leader>gt :YcmCompleter GoTo<CR>

" Auto Format
let g:formatdef_clangformat='"clang-format -style=file"'

" Doxygen
let g:DoxygenToolkit_commentType = "C++"

if has("nvim")
  " Neomake
  nnoremap <F5> :Neomake<CR>
  let g:neomake_javascript_enabled_makers = ['jshint']
  let g:neomake_python_enabled_makers = ['pylint']
else
  " Syntastic
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_always_populate_loc_list=1
  let g:syntastic_auto_loc_list=1
  let g:syntastic_check_on_open=1
  let g:syntastic_cpp_checkers=['cppcheck']
  let g:syntastic_javascript_checkers = ['jshint']
  let g:syntastic_python_checkers=['pylint']

  " Dispatch
  nnoremap <F5> :Make<CR>
endif
