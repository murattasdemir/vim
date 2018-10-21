" ==== Basic things ==== {{{
"set nocompatible
filetype plugin indent on

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

set number relativenumber

" ==== LEADER ==== {{{
:let mapleader = "-"
" }}}

" ==== Mappings ==== {{{
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
nnoremap <leader>md <esc>$a (DONE)<esc>		" mark done.
nnoremap <leader>mp <esc>$a (PENDING)<esc>		" mark pending.
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>[ viw<esc>a[ <esc>bi ]<esc>lel
nnoremap <leader># ^i#<esc>

" html tag remaps
nnoremap <leader>h1 ^i<h1><esc>$a</h1><esc>lel
nnoremap <leader>h2 ^i<h2><esc>$a</h2><esc>lel
nnoremap <leader>h3 ^i<h3><esc>$a</h3><esc>lel
nnoremap <leader>h4 ^i<h4><esc>$a</h4><esc>lel
nnoremap <leader>h5 ^i<h5><esc>$a</h5><esc>lel
inoremap <a <a href="" title=""></a>
inoremap <leader>. . <esc>d$

inoremap jk <esc>
inoremap jkw <esc>:w<enter>
inoremap jkx <esc>:x<enter>
inoremap jkq <esc>:q<enter>
inoremap jkd <esc>2ld$
inoremap <esc> <nop>
" }}}

" ==== Abbreviations ==== {{{
iabbrev nsig Nazareno V. Feito Matias <nazareno.feito.matias@oracle.com>
iabbrev nvfm Nazareno V. Feito Matias http://www.minimalistictraveler.com

" ==== Autocmd ==== 
autocmd FileType c :iabbrev <buffer> iff if ()<left>
autocmd FileType python :iabbrev <buffer> iff if :<left>
autocmd FileType shellscript :iabbrev <buffer> iff if [ ]; then<esc>bbi
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType c setlocal ts=4 sts=4 sw=4
"autocmd FileType c setlocal ts=8 sts=8 sw=8
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


" ==== Cursor line ==== {{{
" To highlight the line the cursor is currently in
"set cursorline
"hi CursorLine term=bold cterm=bold ctermbg=Black
"set cursorline
" }}}

" Vimscript colors and themes section --- {{{
"colorscheme desert
colorscheme murphy
" To disable colors
syntax on
set hlsearch
"set t_Co=0
" }}}

" Vimscript file settings ---------------------------- {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
