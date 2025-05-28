lua <<EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
EOF

" Prevents issues with terminals
set t_u7=

set nocompatible
set rtp+=~/.vim
" set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf

call plug#begin('~/.vim/plugged')
  Plug 'aalvarado/my_snippets'
  Plug 'airblade/vim-gitgutter'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'andymass/vim-matchup'
  Plug 'bling/vim-airline'
  Plug 'haya14busa/vim-asterisk'
  Plug 'qxxxb/vim-searchhi'
  " Plug 'dermusikman/sonicpi.vim'
  Plug 'lilyinstarlight/vim-sonic-pi', { 'branch': 'main' }
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'kana/vim-textobj-user'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'lilydjwg/colorizer'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'powerman/vim-plugin-AnsiEsc'
  Plug 'prisma/vim-prisma'
  Plug 'preservim/nerdcommenter'
  Plug 'SirVer/ultisnips'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-vinegar'
  Plug 'vim-ruby/vim-ruby'
  Plug 'whatyouhide/vim-textobj-erb'
  Plug 'sheerun/vim-polyglot'
  Plug 'junegunn/goyo.vim'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  Plug 'elkowar/yuck.vim'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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
  set cmdheight=1

  syntax enable
" }

" Scroll {
  set scrolloff=20
" }

" Visual {
  set incsearch
  set hlsearch
  set laststatus=2
  set number
  set ruler
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
  set updatetime=300

  inoremap <silent><expr> <a-\> coc#refresh()

  " Use K to show documentation in preview window
  nnoremap <silent> K :call ShowDocumentation()<CR>

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction

  inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

  " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Remap keys for gotos
  nmap <silent>gd <Plug>(coc-definition)
  nmap <silent>gy <Plug>(coc-type-definition)
  nmap <silent>gi <Plug>(coc-implementation)
  nmap <silent>gr <Plug>(coc-references)

  " Remap keys for applying codeAction to the current line.
  nmap <leader>ac  <Plug>(coc-codeaction)
  nmap <leader>qf <Plug>(coc-fix-current)


  nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>

  nnoremap <leader>oi :call  CocActionAsync('runCommand', 'editor.action.organizeImport')
  " nnoremap <leader>oi :CocAction('runCommand', 'tsserver.organizeImports')<CR>:Prettier<CR>

  command! -nargs=0 Format :call CocAction('format')
  command! -nargs=0 Prettier :CocCommand prettier.formatFile
  command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

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
  cmap vrc tabe ~/.vimrc<cr>
  cmap sov source ~/.vimrc
  cmap vi3 tabe ~/.i3/config<cr>g;
  cmap via tabe ~/.bash_aliases<cr>
  cmap jj <esc>

  " ^ is too far
  nnoremap \ g^
  vnoremap \ g^
  nnoremap d\ d^
  inoremap <c-\> <esc>c^

  " inoremap <s-CR> <CR><CR><c-o><up><tab>
  inoremap <a-enter> <cr><cr><c-o><up><tab><tab>
  nnoremap <Space> ;
  nnoremap <s-Space> ,
  inoremap jj <esc>

  " Double comma to add a comma to the end
  inoremap ,, <c-o>A,
  inoremap ;; <c-o>A;<esc>

  " //e means continue even with errors *:s_e*
  command! -nargs=0 StripWhitespace :%s/\s\+$//e
  nnoremap <leader>sw :StripWhitespace<CR>

  inoremap {<CR>  {<CR>}<c-o>O
  inoremap (<CR>  (<CR>)<c-o>O
  inoremap [<CR> [<CR>]<c-o>O
  " inoremap <s-CR> <CR><CR><c-o><up><tab>
  " inoremap '''<cr> '''<cr>'''<c-o><up><tab>

  " Search in selected lines
  vnoremap <M-k> <Esc>/\%V
  " nnoremap <M-l> :BLines<CR>

  vnoremap <c-p> "ry:<c-u>Rg <c-r>r<cr>
  nnoremap <c-p> :Rg<space>

  " FZF commands
  nmap <silent> <leader>fr :sp %:h<CR>
  nmap <silent> <leader>fb :Buffers<CR>
  nmap <silent> <leader>ff :Files<CR>
  nmap <silent> <leader>fg :GFiles<CR>
  nmap <silent> <leader>fh :History<CR>
  nmap <silent> <leader>fl :BLines<CR>

  nmap <silent> <leader>fv :NvimTreeToggle %:p:h<CR>
  nmap <leader>; <c-w><c-w>
  nmap <silent> <leader>x :x<CR>
  nmap <silent> <leader>o :on<cr>
  nmap <silent> <leader>ue :UltiSnipsEdit<cr>
  nmap <silent> <leader>rc :source ~/.vimrc<cr>

  if has('win32') || has('win64')
    " This is for Windows where 'Alt' key is not recognized natively
    noremap <M-h> <C-w>h
    noremap <M-j> <C-w>j
    noremap <M-k> <C-w>k
    noremap <M-l> <C-w>l
  else
    " This works for most Unix-based systems (Linux, macOS)
    noremap <A-h> <C-w>h
    noremap <A-j> <C-w>j
    noremap <A-k> <C-w>k
    noremap <A-l> <C-w>l
  endif

  " Yank current file path from cwd
  nmap <leader>yp :let @+=expand("%:.")<CR>

  :hi Normal ctermbg=NONE
  :hi MatchWord ctermfg=NONE guifg=NONE cterm=underline gui=underline

fu! FreezeHeader()
  execute '1sp'
  execute 'bp'
endf

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

" Fix indent lines odd color in terminals
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#21222C ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#343746 ctermbg=237

let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-docker',
      \ 'coc-eslint',
      \ 'coc-git',
      \ 'coc-godot',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-marketplace',
      \ 'coc-prettier',
      \ 'coc-prisma',
      \ 'coc-rust-analyzer',
      \ 'coc-solargraph',
      \ 'coc-sql',
      \ 'coc-stylelint',
      \ 'coc-tag',
      \ 'coc-toml',
      \ 'coc-tsserver',
      \ 'coc-vimlsp',
      \ 'coc-webpack',
      \ 'coc-webpack',
      \ 'coc-xml',
      \ 'coc-yaml',
      \]

fu! SetSpell()
  setlocal spell spelllang=en_us
endf

" Don't touch my indent
autocmd filetype markdown set indentexpr=
autocmd filetype markdown call SetSpell()
autocmd filetype typescript set indentexpr=
" autocmd filetype javascript set indentexpr=
" autocmd filetype css set indentexpr=

inoremap <c-Space> <space>=><space>
autocmd filetype rust inoremap <buffer> <c-Space> <space>-><space>
autocmd FileType prisma syntax sync fromstart
autocmd FileType css setl iskeyword+=-
autocmd FileType scss setl iskeyword+=@-@
" autocmd filetype ruby inoremap <buffer> <c-Space> <space>=><space>
"let $NVIM_COC_LOG_LEVEL = 'debug'
"
" nnoremap <a-j> <c-w><c-j>
" nnoremap <a-k> <c-w><c-k>
" nnoremap <a-l> <c-w><c-l>
" nnoremap <a-h> <c-w><c-h>

" load bash aliases

let g:python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3.11'

lua <<EOF
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
    "css",
    "html",
    "lua",
    "ocaml",
    "query",
    "ruby",
    "rust",
    "typescript",
    "vim",
    "vimdoc",
    "toml",
    "scss"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
