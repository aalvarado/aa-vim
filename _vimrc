set nocompatible " Needs to be the first line
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" See https://github.com/gmarik/vundle for more help on Vundle
" Vundle manages Vundle

Bundle 'gmarik/vundle'

" Bundles {
	Bundle 'The-NERD-tree'
	Bundle 'ack.vim'
	Bundle 'The-NERD-Commenter'
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
	filetype plugin on
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
		set co=160
		set guioptions-=T
  	endif
" }

" Key Mappings {
	let mapleader = ',' " remmaping leader key to ,
	" remmaping ; to :, saves shift :)
	nnoremap ; :
	" Change working directory to the current one
	cmap cwd lcd %:p:h
	cmap cd. lcd %:p:h
" }

" Formatting {
	set nowrap
	set autoindent
	set tabstop=4
"}

" Plugins {
	" NerdTree {
		map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
		map <leader>e :NERDTreeFind<CR>

		let NERDTreeShowBookmarks=1
		let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
		let NERDTreeChDirMode=0
		let NERDTreeQuitOnOpen=1
		let NERDTreeShowHidden=1
		let NERDTreeKeepTreeInNewTab=1
	" }

" }



function! InitializeDirectories()
  let separator = "."
  let parent = $HOME
  let prefix = '.vim'
  let dir_list = {
		\ 'backup': 'backupdir',
		\ 'views': 'viewdir',
		\ 'swap': 'directory' }

		for [dirname, settingname] in items(dir_list)
				let directory = parent . '/' . prefix . dirname . "/"
				if exists("*mkdir")
						if !isdirectory(directory)
								call mkdir(directory)
						endif
				endif
				if !isdirectory(directory)
						echo "Warning: Unable to create backup directory: " . directory
						echo "Try: mkdir -p " . directory
				else
				  let directory = substitute(directory, " ", "\\\\ ", "")
				  exec "set " . settingname . "=" . directory
				endif
		  endfor
endfunction
call InitializeDirectories() 
