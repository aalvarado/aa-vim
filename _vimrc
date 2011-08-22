set nocompatible " Needs to be the first line
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" See https://github.com/gmarik/vundle for more help on Vundle
" Vundle manages Vundle

Bundle 'gmarik/vundle'

" Bundles {


" }


" Lots of stuff (borrowed||stolen) from Steve francia's ultimate vim config http://github.com/spf13/spf13-vim
" Basic {
	set background=dark
" }

" General {
	set mouse=a " enable mouse usage
	scriptencoding utf-8
	set backup " backups are nice, indeed 
	syntax on
	set mouse=a
	set history=1000
" }

" Vim UI {
	set ruler	
	set nu	" line numbers
	set showcmd
	set showmatch
	set incsearch
	set ignorecase
	set smartcase
	set wildmenu
	set scrolloff=3
	set scrolljump=5

	if has("gui_running")
		colorscheme desert " load a colorscheme
		set guifont=Consolas:h8 
		set lines=40
  	endif
" }

" Key Mappings {
	let mapleader = ','
	nnoremap ; :
" }

" Formatting {
	set nowrap
	set autoindent
	set tabstop=4
"}
