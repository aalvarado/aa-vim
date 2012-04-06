set nocompatible " Needs to be the first line
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" See https://github.com/gmarik/vundle for more help on Vundle
" Vundle manages Vundle

Bundle 'gmarik/vundle'

" Bundles {
	Bundle 'The-NERD-tree'
	Bundle 'The-NERD-Commenter'
	Bundle 'fugitive.vim'
	Bundle 'extradite.vim'
	Bundle 'surround.vim'
	Bundle 'ragtag.vim'
	Bundle 'Syntastic'
	Bundle 'Wombat'
	Bundle 'set_utf8.vim'
	Bundle 'xolox/vim-shell'
	Bundle 'matchit.zip'
	Bundle 'obsidian2.vim'
	Bundle 'molokai'
	Bundle 'ShowMarks7'
	Bundle 'pythoncomplete'
	Bundle 'pyflakes.vim'
	Bundle 'Indent-Guides'
	Bundle 'vim-scripts/UltiSnips'
	Bundle 'sessionman.vim'
	Bundle 'LustyExplorer'
	Bundle 'LustyJuggler'
	Bundle 'kchmck/vim-coffee-script.git'
	Bundle 'godlygeek/tabular'
	Bundle 'tpope/vim-repeat'
	Bundle 'millermedeiros/vim-statline'
	Bundle 'chrismetcalf/vim-yankring'

	" change to your own snippets if you don't like mine :) 
	Bundle 'aalvarado/ultisnips-snippets.git'

	" Mostly copied from Janus dotvim
	Bundle 'tpope/vim-rails.git'
	Bundle 'altercation/vim-colors-solarized.git'
	Bundle 'tpope/vim-haml.git'
	Bundle 'mileszs/ack.vim.git'
	Bundle 'ervandew/supertab.git'
	Bundle 'vim-ruby/vim-ruby.git'
	Bundle 'tpope/vim-vividchalk.git'
	Bundle 'tpope/vim-cucumber.git'
	Bundle 'mattn/gist-vim.git'
	Bundle 'pangloss/vim-javascript.git'
	Bundle 'timcharper/textile.vim.git'

	Bundle 'tpope/vim-bundler'
	Bundle 'vim-scripts/AutoTag'
	Bundle 'vim-scripts/AnsiEsc.vim'
	Bundle 'tpope/vim-endwise'
" }


" Lots of stuff (borrowed||stolen) from
" http://github.com/spf13/spf13-vim
" https://github.com/scrooloose/vimfiles/blob/master/vimrc

" Windows specific {
	if has('win32') || has ('win64')
		set directory+=,~/tmp,$TMP
		" Adds git runtime path so it is able to use Fugitive and Vundle  within GVIM,
		" while using the git bash only option when installing git for win
		
		" uses standard git install directories
		let gitdir='C:\Program Files (x86)\Git\bin'
		let gitdiralt='C:\Program Files\Git\bin'

		if isdirectory(gitdir)
			let $PATH.=';' .gitdir
		elseif isdirectory(gitdiralt)
			let $PATH.=';' . gitdiralt
		endif
		" Needed for ruby based plugins
		let $PATH.=';' . 'c:\ruby192\bin'
	endif
" }

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
	set gdefault
	set complete-=i
" }

" Vim UI {
	set ruler
	set nu " Line numbers
	set showcmd
	set showmatch
	set number
	set hlsearch
	set incsearch
	set ignorecase " Ignore case while searching
	set smartcase
	set wildmode=list:longest " Make cmdline tab completion similar to bash
	set wildmenu " Enable ctrl-n and ctrl-p to scroll thru matches
	set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
	set scrolloff=3
	set scrolljump=5
	set pastetoggle=<F12>
	set hidden
	set so=5

	if has("gui_running")
		colorscheme wombat	" Load a colorscheme
		set lines=40	" 40 lines height
		set co=160	" Set 160 columns
		set guioptions-=T " Hide the toolbar on Gvim
		" Automatically resize splits when resizing MacVim window
		autocmd VimResized * wincmd =
		" Set font
		if has("gui_macvim")
			try
				set guifont=Anonymous\ Pro:h13
			catch
				set guifont=Monaco:h12
			endtry
		else
			set guifont=Luxi\ Mono\ 10
		endif
	endif

" Key Mappings {
	let mapleader = ',' " remmaping leader key to ,
	"Turn off search highlitghting with leader /
	nmap <silent> <leader>/ :nohlsearch<CR>
	" remmaping ; to :, saves shift :)
	nnoremap ; :
	" Change working directory to the current one
	cmap cwd lcd %:p:h
	cmap cd. lcd %:p:h
	" Save a file when you forgot to sudo
	cmap w!! %!sudo tee > /dev/null %

	imap <C-Space> <Space>=><Space>
	inoremap {<CR>	{<CR>}<Esc>O
	command! VimRC :source $MYVIMRC
	nnoremap <leader>d "_d
	nn G G10<c-e>

		" Visual Mode {
			vnoremap <silent> * :call VisualSearch('f')<CR>
			vnoremap <silent> # :call VisualSearch('b')<CR>
		" }
	" }

" Formatting {

	" Do soft wrap lines
	set wrap
	set showbreak=⏎\ 
	set autoindent

	set tabstop=4
	set shiftwidth=4
	set backspace=indent,eol,start
	set whichwrap=b,s,h,l,<,>,[,] " backspace and cursor keys wrap to
	set ffs=unix
	set ff=unix
	set nobomb
	setl nobomb
	set list
	set listchars:tab:\ \ ,trail:·

	"coffee script
	au BufNewFile,BufReadPost *.coffee,*.haml,*.erb setl shiftwidth=2 expandtab tabstop=2 softtabstop=2

	"python
	au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
	au BufNewFile,BufReadPost *.py setl ft=python

	"ruby
	au FileType ruby setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2 nobomb
	au BufNewFile,BufReadPost *.ruby setl ft=ruby

	"javascript
	au FileType javascript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2 nobomb

	au BufRead,BufNewFile *.js	set ft=javascript

	" add json syntax highlighting
	" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
	au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

	" add json syntax highlighting
	au BufNewFile,BufRead *.json set ft=javascript
	
"}

" Plugins {
	"statline {
		let g:statline_fugitive = 1
		let g:statline_filename_relative = 1
	"}
	" indent guides{
		let g:indent_guides_enable_on_vim_startup = 1
		let g:indent_guides_guide_size = 1
	" }

	" NerdTree {
		"map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
		nnoremap <f2> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
		let NERDTreeShowBookmarks=1
		let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
		let NERDTreeChDirMode=0
		let NERDTreeQuitOnOpen=1
		let NERDTreeShowHidden=1
		let NERDTreeKeepTreeInNewTab=1
		let g:NERDTreeMouseMode = 2
		let g:NERDTreeWinSize = 40
	" }

	" fugitive {
		"http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
		"hacks from above (the url, not jesus) to delete fugitive buffers when we
		"leave them - otherwise the buffer list gets poluted
		"
		"add a mapping on .. to view parent tree
		autocmd BufReadPost fugitive://* set bufhidden=delete
		autocmd BufReadPost fugitive://*
		  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
		  \ nnoremap <buffer> .. :edit %:h<CR> |
		  \ endif
	"}
	
	" Supertab {
		  if !exists("g:SuperTabRetainCompletionDuration")
			let g:SuperTabRetainCompletionDuration = 'insert'
		  endif

		  if !exists("g:SuperTabMidWordCompletion")
			let g:SuperTabMidWordCompletion = 1
		  endif

		  if !exists("g:SuperTabMappingForward")
			let g:SuperTabMappingForward = '<tab>'
		  endif
		  if !exists("g:SuperTabMappingBackward")
			let g:SuperTabMappingBackward = '<s-tab>'
		  endif

		  if !exists("g:SuperTabMappingTabLiteral")
			let g:SuperTabMappingTabLiteral = '<c-tab>'
		  endif

		  if !exists("g:SuperTabLongestHighlight")
			let g:SuperTabLongestHighlight = 0
		  endif
	" }
	
	" Syntastic settings{
		let g:syntastic_enable_signs=1
		let g:syntastic_auto_loc_list=2
	"}

	"UltiSnip{
		if !exists("g:UltiSnipsSnippetsDir")
			let g:UltiSnipsSnippetDirectories=["..//ultisnips-snippets"]
			let g:UltiSnipsEditSplit="horizontal"
		endif
		
		" Conflicts with diagraphs, switching <c-k> to something else
		" use :redraw instead of <c-l>
		if !exists("g:UltiSnipsJumpBackwardTrigger")
			let g:UltiSnipsJumpBackwardTrigger = "<c-l>"
		endif
	"}

	"showmarks{
		" Prevents showmarks showing up for other buffer types
		let g:showmarks_ignore_type = "hqprm"
	"}

	"surround{
		" via: http://whynotwiki.com/Vim
		" Ruby
		" Use v or # to get a variable interpolation (inside of a string)}
		" ysiw# Wrap the token under the cursor in #{}
		" v...s# Wrap the selection in #{}
		let g:surround_113 = "#{\r}" " v
		let g:surround_35 = "#{\r}" " #
	"}
" }

function! InitializeDirectories()
  let separator = "."
  let parent = $HOME
  let prefix = '.vim'
  let dir_list = {
		\ 'backup': 'backupdir',
		\ 'views': 'viewdir',
		\ 'swap': 'directory'}

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

" From an idea by Michael Naumann
function! VisualSearch(direction) range
	let l:saved_reg = @"
	execute "normal! vgvy"

	let l:pattern = escape(@", '\\/.*$^~[]')
	let l:pattern = substitute(l:pattern, "\n$", "", "")

	if a:direction == 'b'
		execute "normal ?" . l:pattern . "^M"
	elseif a:direction == 'gv'
		call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
	elseif a:direction == 'f'
		execute "normal /" . l:pattern . "^M"
	endif

	let @/ = l:pattern
	let @" = l:saved_reg
endfunction

" Use local vimrc if available {
	if filereadable(expand("~/.vimrc.local"))
		source ~/.vimrc.local
	endif
" }
