" Prevents issues with terminals
set t_u7=

set nocompatible
set rtp+=~/.vim
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf

call plug#begin('~/.vim/plugged')
  " Plug '/usr/local/opt/fzf'
  Plug 'aalvarado/my_snippets'
  Plug 'airblade/vim-gitgutter'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'andymass/vim-matchup'
  Plug 'bling/vim-airline'
  Plug 'bronson/vim-visual-star-search'
  Plug 'cohama/lexima.vim'
  " Plug 'dermusikman/sonicpi.vim'
  Plug 'lilyinstarlight/vim-sonic-pi', { 'branch': 'main' }
  Plug 'dracula/vim', { 'as': 'dracula' }
  " Plug 'ianks/vim-tsx'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'kana/vim-textobj-user'
  Plug 'nelstrom/vim-textobj-rubyblock'
  " Plug 'leafgarland/typescript-vim'
  Plug 'lilydjwg/colorizer'
  " Plug 'maxmellon/vim-jsx-pretty'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'nathanaelkane/vim-indent-guides'
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'ocaml/vim-ocaml'
  " Plug 'plasticboy/vim-markdown'
  Plug 'powerman/vim-plugin-AnsiEsc'
  " Plug 'rust-lang/rust.vim'
  " Plug 'reasonml-editor/vim-reason-plus'
  Plug 'scrooloose/nerdcommenter'
  Plug 'SirVer/ultisnips'
  " Plug 'slim-template/vim-slim'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'vim-ruby/vim-ruby'
  Plug 'whatyouhide/vim-textobj-erb'
  " Plug 'yuezk/vim-js'

  Plug 'sheerun/vim-polyglot'
  Plug 'junegunn/goyo.vim'

  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  " Plug 'thomasfaingnaert/vim-lsp-snippets'
  " Plug 'thomasfaingnaert/vim-lsp-ultisnips'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'prabirshrestha/asyncomplete-ultisnips.vim'

" $ npm i -S markdown-it-toc-done-right markdown-it-anchor
call plug#end()

if has('win32') || has('win64')
  set clipboard=unnamed
  set shell=cmd.exe
  set shellxquote=
endif

if has('unix')
  set clipboard=unnamedplus
endif

" General {
  "set shellcmdflag=-ic
  filetype plugin on
  setglobal nobomb
  set autoindent
  set whichwrap=b,s,h,l,<,>,[,]
  set backspace=indent,eol,start
  set encoding=utf-8
  set expandtab
  set fileformats=unix
  set fileencoding=utf-8
  set ignorecase
  set hidden
  set history=1000
  set hlsearch
  set mouse=a
  set noswapfile
  set shiftwidth=2
  set showcmd
  set softtabstop=2
  set smartcase
  set tabstop=2
  set wildmenu
  set wildmode=list:longest
  set synmaxcol=500
  set nomodeline
  let mapleader = ','
  set cmdheight=2

  syntax on
" }

" Scroll {
  set scrolloff=20
" }

" Visual {
  set incsearch
  set hlsearch
  set laststatus=2

  "set guioptions=i
  set number
  set ruler
  "set shortmess=aIc
  set shortmess=Ic

  " Wrapping options
  set wrap
  set lbr
  let &showbreak = '↳  '
  set breakindentopt=shift:2,min:40,sbr
  set breakindent
  let &breakat = " \t;,])}"
" }

  set belloff=all
  if has("autocmd") && has("gui")
    au GUIEnter * set t_vb=
  endif

" Plugins {
  let g:NERDSpaceDelims = 1
  let g:NERDDefaultAlign = 'left'

  let g:matchup_matchparen_deferred = 1
  let g:matchup_surround_enabled = 1

  let g:dracula_bold = 0
  let g:dracula_italic = 0
  let g:dracula_colorterm = 0

  colorscheme dracula

  set rtp+=~/.vim/plugged
  let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/my_snippets']
  let g:UltiSnipsEditSplit="horizontal"
  let g:UltiSnipsJumpBackwardTrigger = "<c-l>"

  hi Normal ctermbg=NONE

  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_guide_size = 1
  let g:indent_guides_auto_colors = 0

  call airline#parts#define_accent('mode', 'none')
  call airline#parts#define_accent('linenr', 'none')
  call airline#parts#define_accent('maxlinenr', 'none')
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_splits = 0
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#branch#displayed_head_limit = 8
  let g:airline#extensions#hunks#enabled = 0
  let g:airline_inactive_alt_sep=1
  let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

  let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'C',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : 'N',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'V',
      \ 'V'      : 'V',
      \ ''     : 'V',
      \ }

  let g:surround_35 = "#{\r}" " #

  " AnsiEsc
  " disables <leader>,rwp
    let g:no_cecutil_maps = 1

  " Gitgutter <leader> h disable
    let g:gitgutter_map_keys = 0
" }

  " CoC
  " set updatetime=300

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  if has("nvim-0.5.0") || has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
  else
    set signcolumn=yes
  endif

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  " inoremap <silent><expr> <TAB>
  "     \ pumvisible() ? coc#_select_confirm() :
  "     \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  "     \ <SID>check_back_space() ? "\<TAB>" :
  "     \ coc#refresh()

  " function! s:check_back_space() abort
  "   let col = col('.') - 1
  "   return !col || getline('.')[col - 1]  =~# '\s'
  " endfunction

  " let g:coc_snippet_next = '<tab>'

  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  " Remap for rename current word
  " nmap <leader>rn <Plug>(coc-rename)

  " function! s:show_documentation()
  "   if (index(['vim','help'], &filetype) >= 0)
  "     execute 'h '.expand('<cword>')
  "   else
  "     call CocAction('doHover')
  "   endif
  " endfunction

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Remap keys for gotos
  " nmap <silent>gd <Plug>(coc-definition)
  " nmap <silent>gy <Plug>(coc-type-definition)
  " nmap <silent>gi <Plug>(coc-implementation)
  " nmap <silent>gr <Plug>(coc-references)

  " Remap keys for applying codeAction to the current line.
  " nmap <leader>ac  <Plug>(coc-codeaction)
  " nmap <leader>qf <Plug>(coc-fix-current)

  " command! -nargs=0 Format :call CocAction('format')
  " command! -nargs=0 Prettier :CocCommand prettier.formatFile

  " Use tab to navigate completion
  " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  " https://github.com/joshukraine/dotfiles/blob/ba4ac2969b91ed88f6413cdde05da251cf1906f9/nvim/init.vim

  " rust
  let g:rustfmt_autosave = 1
" }

" Markdown {
" let g:vim_markdown_auto_insert_bullets = 1
" let g:vim_markdown_new_list_item_indent = 0

" }

" Customizations {
  let g:netrw_banner = 0
  let g:netrw_liststyle = 3
  let g:netrw_browse_split = 0
  let g:netrw_altv = 1
  let g:netrw_winsize = 25

  " Add date
  nmap <silent> <leader>ad :r !date +\%F<CR>

  " nmap <F9> :set ignorecase! ignorecase?
  nnoremap ; :

  nmap <silent> <leader>/ :nohlsearch<CR>
  cmap cwd lcd %:p:h

  "inoremap <s-enter> <cr><cr><up><tab>
  nnoremap gs g^
  nnoremap <Space> ;
  nnoremap <s-Space> ,
  inoremap jj <esc>
  " cmap w!! %!sudo tee > /dev/null %

  " Double comma to add a comma to the end
  inoremap ,, <c-o>A,
  inoremap ;; <c-o>A;<esc>

  " //e means continue even with errors *:s_e*
  command! -nargs=0 StripWhitespace :%s/\s\+$//e

  "inoremap {<CR>  {<CR>}<c-o>O
  "inoremap (<CR>  (<CR>)<c-o>O
  "inoremap [<CR> [<CR>]<c-o>O
  "inoremap <s-CR> <CR><CR><c-o><up><tab>
  "inoremap <c-Space> <space>=><space>

  " nmap <C-]> :split<CR>:exec("tag ".expand("<cword>"))<CR>

  vnoremap <M-k> <Esc>/\%V
  nnoremap <M-l> :BLines<CR>

  vnoremap <c-p> "ry:<c-u>Rg <c-r>r<cr>
  nnoremap <c-p> :Rg<space>

  " FZF commands
  nmap <silent> <leader>fr :e %:h<CR>
  nmap <silent> <leader>fb :Buffers<CR>
  nmap <silent> <leader>ff :Files<CR>
  nmap <silent> <leader>fg :GFiles<CR>
  nmap <silent> <leader>fh :History<CR>
  " Yank current file path from cwd
  nmap <leader>yp :let @+=expand("%:.")<CR>

  :hi Normal ctermbg=NONE
  :hi MatchWord ctermfg=NONE guifg=NONE cterm=underline gui=underline

" let g:sonic_pi_command = 'sonic-pi-tool.py'
" let g:sonic_pi_autolog_enabled = 0
" let g:sonic_pi_check = 'version'
" let g:sonic_pi_eval = ''
" let g:sonic_pi_stop = 'stop'
" Disabled due to lack of support
" let g:sonic_pi_run = ''
" let g:sonic_pi_logs = ''
" let g:sonic_pi_record = ''
let g:vim_redraw = 1

set t_Co=256
set notermguicolors

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Quicker save just ,w and will write the file
nnoremap <silent><leader>w :w!<CR>

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Fix indent lines odd color in terminals
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#21222C ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#343746 ctermbg=237

" autocmd FileType html let b:coc_pairs_disabled = ['<']
" autocmd FileType eruby let b:coc_pairs_disabled = ['<']

"let $NVIM_COC_LOG_LEVEL = 'debug'

" let g:coc_global_extensions = [
"       \ 'coc-css',
"       \ 'coc-docker',
"       \ 'coc-eslint',
"       \ 'coc-flow',
"       \ 'coc-git',
"       \ 'coc-godot',
"       \ 'coc-html',
"       \ 'coc-json',
"       \ 'coc-marketplace',
"       \ 'coc-prettier',
"       \ 'coc-reason',
"       \ 'coc-rls',
"       \ 'coc-solargraph',
"       \ 'coc-sql',
"       \ 'coc-stylelint',
"       \ 'coc-tag',
"       \ 'coc-toml',
"       \ 'coc-tslint',
"       \ 'coc-tslint-plugin',
"       \ 'coc-tsserver',
"       \ 'coc-ultisnips',
"       \ 'coc-webpack',
"       \ 'coc-webpack',
"       \ 'coc-xml',
"       \ 'coc-yaml',
"       \]

" Don't touch my indent
autocmd filetype markdown set indentexpr=

if has('python3')
    let g:UltiSnipsExpandTrigger="<c-e>"
    call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'allowlist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))
endif

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
