set nocompatible " Needs to be the first line
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
" Bundles {
  Bundle 'The-NERD-Commenter'
  Bundle 'fugitive.vim'
  Bundle 'surround.vim'
  Bundle 'ragtag.vim'
  Bundle 'Syntastic'
  Bundle 'Indent-Guides'
  Bundle 'SirVer/ultisnips'
  Bundle 'LustyExplorer'
  Bundle 'LustyJuggler'
  Bundle 'kchmck/vim-coffee-script.git'
  Bundle 'godlygeek/tabular'
  Bundle 'tpope/vim-repeat'
  Bundle 'majutsushi/tagbar'
  Bundle 'tpope/vim-rails.git'
  Bundle 'tpope/vim-haml.git'
  Bundle 'vim-ruby/vim-ruby.git'
  Bundle 'pangloss/vim-javascript.git'
  Bundle 'timcharper/textile.vim.git'
  Bundle 'tpope/vim-bundler'
  Bundle 'tpope/vim-endwise'
  Bundle 'ctrlpvim/ctrlp.vim'
  Bundle 'ludovicchabant/vim-gutentags'
  Bundle 'rosenfeld/conque-term'
  Bundle 'ervandew/supertab.git'
  Bundle 'LargeFile'
  Bundle 'bling/vim-airline'
  Bundle 'mileszs/ack.vim'
  Bundle 'mustache/vim-mustache-handlebars'
  Bundle 'AndrewRadev/vim-eco'
  Bundle 'cespare/vim-toml'
  Bundle 'slim-template/vim-slim'
  Bundle 'vim-scripts/dbext.vim'
  Bundle 'rust-lang/rust.vim'
  Bundle 'cespare/vim-toml'
  Bundle 'mxw/vim-jsx'
  Bundle 'kana/vim-textobj-user'
  Bundle 'rhysd/vim-textobj-ruby'
  Bundle 'andymass/vim-matchup'

  " themes:
  Bundle 'larssmit/vim-getafe'
  Bundle 'whatyouhide/vim-gotham'
  Bundle 'dracula/vim'
  Bundle 'chriskempson/base16-vim'

  " change to your own snippets if you don't like mine :)
  Bundle 'aalvarado/ultisnips-snippets.git'
" }

" Basic {
  set background=dark
" }

" General {
  set mouse=a " enable mouse usage
  setglobal fileencoding=utf-8
  set encoding=utf-8
  setglobal nobomb
  set backup " backups are nice, indeed
  syntax on
  set mouse=a
  set history=1000
  filetype plugin on
  set gdefault
  set complete=.,b,u,t
  set wildmode=list:longest " Make cmdline tab completion similar to bash
  set laststatus=2
  set term=screen-256color
  set shortmess+=I
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
  set wildmenu " Enable ctrl-n and ctrl-p to scroll thru matches
  set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
  "set scrolljump=50
  set pastetoggle=<F12>
  set hidden
  set guioptions=i
  set lazyredraw
  set virtualedit=block

  let g:dracula_undercurl = 0
  let g:dracula_underline = 0
  let g:dracula_bold = 0
  colorscheme dracula

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

  command! VimRC :source $MYVIMRC
  nnoremap <leader>d "_d
  nnoremap <leader>, A,<Esc>
  inoremap {<CR>  {<CR>}<Esc>O<tab>
  inoremap (<CR>  (<CR>)<Esc>O<tab>
  inoremap [<CR>  [<CR>]<Esc>O<tab>
  nn G G10<c-e>
  imap jj <esc>
  inoremap ,, <c-o>A,<esc>
  inoremap ;; <esc>A;<esc>
  inoremap <s-cr> <cr><cr><up><tab>
  nnoremap <Space> ;
  nnoremap <s-Space> ,

  inoremap <CR> <CR><space><BS>
  nnoremap O O<space><BS>
  nnoremap o o<space><BS>

  autocmd FileType ruby inoremap  <space>=><space>
  autocmd FileType ruby inoremap <c-space> <space>=><space>
  autocmd FileType javascript.jsx inoremap <c-space> () => {<CR>}<esc>O<tab>
  autocmd FileType c inoremap <c-space> ->
  autocmd FileType rust inoremap <c-space> ::

    " Visual Mode {
      vnoremap <silent> * :call VisualSearch('f')<CR>
      vnoremap <silent> # :call VisualSearch('b')<CR>
    " }
  " }

" Formatting {
  set wrap
  set autoindent
  set tabstop=2
  set shiftwidth=2
  set backspace=indent,eol,start
  set whichwrap=b,s,h,l,<,>,[,] " backspace and cursor keys wrap to
  "set list
  "set listchars:tab:\ \ ,trail:·
	set et

  au BufNewFile,BufReadPost *.coffee,*.haml,*.erb,*.scss setl shiftwidth=2 expandtab tabstop=2 softtabstop=2

  "python
  au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
  au BufNewFile,BufReadPost *.py setl ft=python

  "ruby
  au FileType ruby\|slim setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2 nobomb
  au BufNewFile,BufReadPost *.ruby setl ft=ruby

  "javascript
  au FileType javascript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2 nobomb

  au FileType iced setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2 nobomb

  au BufRead,BufNewFile *.js  set ft=javascript
  au BufRead,BufNewFile *_spec.rb set ft=ruby.rspec

  " Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
	au FileType rust setlocal nosmartindent
"}

" Plugins {
  " statline {
    let g:statline_fugitive = 1
    let g:statline_filename_relative = 1
  " }
  " indent guides{
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_guide_size = 1
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

  " Syntastic settings{
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=2
  "}

  "UltiSnip{
    if !exists("g:UltiSnipsSnippetsDir")
      let g:UltiSnipsSnippetsDir="~/.vim/bundle/ultisnips-snippets"
      let g:UltiSnipsSnippetDirectories=["bundle/ultisnips-snippets"]
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

  "tagbar {
    nmap <F8> :TagbarToggle<CR><C-W>l
  "}
" }

  " ctrlp {
    let g:ctrlp_working_path_mode = 'a'
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

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

autocmd BufWritePre *.slim,*.rb,*.coffee,*.json,*.yml,*.haml,*.erb,*.php,*.java,*.py,*.js,*.iced :call <SID>StripTrailingWhitespaces()
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
let g:airline_powerline_fonts = 1
let g:airline#extensions#capslock#enabled = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0

let g:dbext_default_profile_cluster_dev = 'type=PGSQL:user=adan:dbname=cluster_dev:host=localhost'
let g:dbext_default_profile_cluster_test = 'type=PGSQL:user=adan:dbname=cluster_test:host=localhost'

function SqlSplit()
  let sql_words = [
    \ 'select',
    \ 'where',
    \ 'inner join',
    \ 'left join',
    \ 'left outer join',
    \ 'where',
    \ 'and',
    \ 'or',
    \ 'order by',
    \ 'limit \d\+',
    \ 'offset \d\+' ]

  let sql_string = ''

  call map(sql_words, '"\\<" . v:val . "\\>"')
  let sql_string = join(sql_words, "\\|")
  let sql_string = ":s/" . sql_string . "/\\r\\U&/e"

  execute sql_string
endfunction

let g:syntastic_rust_checkers = ['rustc']
let g:gutentags_file_list_command = 'rg --files'
let g:matchup_matchparen_deferred = 1
