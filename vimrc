" ==== Basic things ==== {{{
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" }}}

" ==== Vundle PLUGINS ==== {{{
"Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/nerdcommenter'
Plugin 'plasticboy/vim-markdown'
Plugin 'nvie/vim-flake8'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'fisadev/vim-isort'
" }}}
call vundle#end()            " required
filetype plugin indent on    " required

" ==== Vim-Plug PLUGINS ==== {{{
call plug#begin()
Plug 'python-mode/python-mode', { 'branch': 'develop' }
call plug#end()
" }}}

"Incremental search
set incsearch
"Case insensitive search.
set ignorecase smartcase
syntax on
" }}}

" ==== STATUSLINE ==== {{{
set laststatus=2
set statusline=%f		" Show filename
set statusline+=\ -\ 		" Separator
set statusline+=FileType	" filetype
set statusline+=%y		" which filetype

set statusline+=\ -\ 		" align right
set statusline+=column:%04c	" current line

set statusline+=%=		" align right
set statusline+=line:%04l	" current line
set statusline+=\ of:		" separator
set statusline+=%04L		" total lines
" }}}


" ==== LEADER ==== {{{
:let mapleader = "-"
" }}}

" ==== Mappings ==== {{{
" James Powell's remaps
vnoremap <silent> <leader>[ :w ! python3<CR>
vnoremap <silent> <leader>[[ :w ! python3<CR>
vnoremap <silent> <leader>] :Tyank<CR>
vnoremap <silent> <leader>]] :Twrite bottom<CR>
" Donzo.
cnoremap w!! w !sudo tee %
nnoremap <C-o> O<Esc>					" Add blank line.
nnoremap <Space> dd					" Space bar to delete line in normal mode.
nnoremap <C-n> :set relativenumber! number! <enter>	" Toggles relativenumbers.
nnoremap <C-u> gUw					" Turns word uppercase.
nnoremap <C-l> gLw					" Turns word lowercase.
nnoremap <leader>p 0iprint(<esc>$a)
nnoremap <leader>d dd
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>done :s/\[o\]/\[x\]/<cr>$a
nnoremap <leader>md <esc>$a (DONE)<esc>		" mark done.
nnoremap <leader>mp <esc>$a (PENDING)<esc>		" mark pending.
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>[ viw<esc>a[ <esc>bi ]<esc>lel
nnoremap <leader># ^i#<esc>

nnoremap <leader>up :!scp vadam.py opc@130.61.49.122:/home/opc/vadam.py<cr>

" set paste/nopaste
nnoremap <leader>sp :set paste<cr>i
nnoremap <leader>snp :set nopaste<cr>

" tabs
"
nnoremap <leader>tn :tabNext<cr>
nnoremap <leader>tp :tabprevious<cr>
nnoremap <leader>tf :tabfirst<cr>
nnoremap <leader>tl :tablast<cr>

" html tag remaps
nnoremap <leader>h1 ^i<h1><esc>$a</h1><esc>lel
nnoremap <leader>h2 ^i<h2><esc>$a</h2><esc>lel
nnoremap <leader>h3 ^i<h3><esc>$a</h3><esc>lel
nnoremap <leader>h4 ^i<h4><esc>$a</h4><esc>lel
nnoremap <leader>h5 ^i<h5><esc>$a</h5><esc>lel
inoremap <a <a href="" title=""></a>

inoremap jk <esc>
inoremap jkw <esc>:w<enter>
inoremap jkx <esc>:x<enter>
inoremap jkq <esc>:q<enter>
inoremap jkd <esc>2ld$
inoremap <esc> <nop>
" }}}

" ==== Autocmd ==== 
autocmd FileType c :iabbrev <buffer> iff if ()<left>
autocmd FileType python :iabbrev <buffer> iff if :<left>
autocmd FileType shellscript :iabbrev <buffer> iff if [ ]; then<esc>bbi
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType c setlocal ts=8 sts=8 sw=8
autocmd FileType groovy setlocal ts=4 sts=4 sw=4
" }}}

"set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" ==== More advanced settings ==== {{{
" FINDING FILES:
"
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
" This is a very cool feature to see file alternatives
set wildmenu
" }}}


" ==== CTAGS ==== {{{ 
" TAG JUMPING:
" Create the tags file first, needs ctags of course.
command! MakeTags !ctags -R .

" WITH THIS WE CAN:
" ^] jump to tag under cursor.
" g^] for ambiguous tags
" ^t to jump back up to the tag stack
" }}}

" Vimscript colors and themes section --- {{{
colorscheme rainyday
" To disable colors
"syntax off
set hlsearch
"set t_Co=0
" }}}


" ==== Cursor line ==== {{{
" To highlight the line the cursor is currently in (always after color theme).
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=DarkGray ctermfg=White
set cursorline
" }}}

" Vimscript file settings ---------------------------- {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

set number relativenumber

" Pathogen - plugin manager
execute pathogen#infect()

" Nerdtree plugin
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:SimpylFold_docstring_preview = 1

" ==== Markdown + LaTeX {{{
" This gets rid of the nasty _ italic bug in tpope's vim-markdown
" block $$...$$
syn region math start=/\$\$/ end=/\$\$/
" inline math
syn match math '\$[^$].\{-}\$'

" actually highlight the region we defined as "math"
hi link math Statement
" }}}
