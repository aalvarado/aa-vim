lua <<EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
EOF

" Prevents issues with terminals
set t_u7=

set nocompatible
set rtp+=~/.vim

call plug#begin('~/.vim/plugged')
  Plug 'aalvarado/my_snippets'
  Plug 'airblade/vim-gitgutter'
  Plug 'andymass/vim-matchup'
  Plug 'bling/vim-airline'
  Plug 'haya14busa/vim-asterisk'
  Plug 'qxxxb/vim-searchhi'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'lilydjwg/colorizer'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'powerman/vim-plugin-AnsiEsc'
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'numToStr/Comment.nvim'
  Plug 'SirVer/ultisnips'
  Plug 'lambdalisue/vim-suda'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'junegunn/goyo.vim'
  Plug 'MeanderingProgrammer/render-markdown.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'branch': 'main'}
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'nvim-treesitter/nvim-treesitter-textobjects', { 'branch': 'main' }
  Plug 'stevearc/aerial.nvim'

  Plug 'Wansmer/treesj'
  Plug 'Aasim-A/scrollEOF.nvim'
  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-ui'
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
  " filetype off
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

  " syntax enable
  " syntax off
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
  set shada=!,'9999,<999,s100,h

  " Wrapping options
  set wrap
  set lbr
  let &showbreak = '↳  '
  set breakindentopt=shift:2,min:40,sbr
  set breakindent
  let &breakat = " \t;,])}"
  let g:no_plugin_maps = 1
  let no_plugin_maps = 1
" }

  set belloff=all
  if has("autocmd") && has("gui")
    au GUIEnter * set t_vb=
  endif

" Plugins {
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

  " inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
  inoremap <silent><expr> <cr> coc#pum#visible() && coc#pum#info()['index'] != -1 ? coc#pum#confirm() : "\<C-g>u\<CR>"

  " Remap keys for gotos
  nmap <silent>gd <Plug>(coc-definition)
  nmap <silent>gy <Plug>(coc-type-definition)
  nmap <silent>gi <Plug>(coc-implementation)
  nmap <silent>gr <Plug>(coc-references)

  " Remap keys for applying codeAction to the current line.
  nmap <leader>ac  <Plug>(coc-codeaction)
  nmap <leader>qf <Plug>(coc-fix-current)

  nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>

  command! -nargs=0 Format :call CocAction('format')
  command! -nargs=0 Prettier :CocCommand prettier.formatFile
  command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

  " rust
  let g:rustfmt_autosave = 1
" }

" Customizations {

  " Add date
  nmap <silent> <leader>ad :r !date +\%F<CR>

  " nmap <F9> :set ignorecase! ignorecase?
  nnoremap ; :

  nmap <silent> <leader>/ :nohlsearch<CR>
  cmap cwd lcd %:p:h
  cmap vrc tabe $MYVIMRC<cr>
  cmap sov source $MYVIMRC
  cmap vi3 tabe ~/.i3/config<cr>g;
  cmap via tabe ~/.bash_aliases<cr>
  cmap jj <esc>

  " ^ is too far
  nnoremap \ g^
  vnoremap \ g^
  nnoremap d\ d^
  inoremap <c-\> <esc>c^

  " inoremap <s-CR> <CR><CR><c-o><up><tab>
  inoremap <a-enter> <cr><cr><c-o><up><tab>
  nnoremap <Space> ;
  inoremap jj <esc>

  " Double comma to add a comma to the end
  inoremap ,, <c-o>A,
  inoremap ;; <c-o>A;<esc>

  " //e means continue even with errors *:s_e*
  command! -nargs=0 StripWhitespace :%s/\s\+$//e
  nnoremap <leader>sw :StripWhitespace<CR>

  command! -nargs=0 StripEmptyLines :%s/\^\s+$//e

  inoremap {<CR> {<CR>}<c-o>O
  inoremap (<CR> (<CR>)<c-o>O
  inoremap [<CR> [<CR>]<c-o>O

  " Search in selected lines
  vnoremap <M-k> <Esc>/\%V

  vnoremap <c-p> "ry:<c-u>Rg <c-r>r<cr>
  nnoremap <c-p> :Rg<space>

  vnoremap p P
  vnoremap P p

  " FZF commands
  nmap <silent> <leader>fr :NvimTreeToggle %:h<CR>
  nmap <silent> <leader>fb :Buffers<CR>
  nmap <silent> <leader>ff :Files<CR>
  nmap <silent> <leader>fg :GFiles<CR>
  nmap <silent> <leader>fh :History<CR>
  nmap <silent> <leader>fl :BLines<CR>
  nmap <silent> <leader>fv :NvimTreeToggle<CR>
  nmap <leader>; <c-w><c-w>
  nmap <silent> <leader>x :x<CR>
  nmap <silent> <leader>o :on<cr>
  nmap <silent> <leader>ue :UltiSnipsEdit<cr>
  nmap <silent> <leader>rc :source ~/.vimrc<cr>

  " Yank current file path from cwd
  nmap <leader>yp :let @+=expand("%:.")<CR>

  :hi Normal ctermbg=NONE
  :hi MatchWord ctermfg=NONE guifg=NONE cterm=underline gui=underline

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
      \ 'coc-lua',
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

autocmd BufRead,BufNewFile *.container set filetype=systemd

inoremap <c-Space> <space>=><space>
autocmd filetype rust inoremap <buffer> <c-Space> <space>-><space>
autocmd FileType prisma syntax sync fromstart
" autocmd filetype ruby inoremap <buffer> <c-Space> <space>=><space>
"let $NVIM_COC_LOG_LEVEL = 'debug'
"
nnoremap <a-j> <c-w><c-j>
nnoremap <a-k> <c-w><c-k>
nnoremap <a-l> <c-w><c-l>
nnoremap <a-h> <c-w><c-h>

lua <<EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
  view = {
    width = 30,
  },
  filters = {
    enable = false
  },
  update_focused_file = {
    enable = true
  }
})

require('Comment').setup({
  padding = true,
  sticky = true,

  toggler = {
    line = ',c ',
    block = ',cb'
  },

  opleader = {
    line = ',c ',
    block = ',cb'
  },

  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})

require'nvim-treesitter'.install {
  'c',
  'css',
  'lua',
  'markdown',
  'markdown_inline',
  'query',
  'toml',
  'vim',
  'vimdoc',
  'scss',
  'sql',
  'ocaml',
  'rust',
  'typescript',
  'javascript',
  'yaml',
  'zig'
}

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local treesitter = require('nvim-treesitter')
    local lang = vim.treesitter.language.get_lang(args.match)
    if vim.list_contains(treesitter.get_available(), lang) then
      if not vim.list_contains(treesitter.get_installed(), lang) then
        treesitter.install(lang):wait()
      end

      vim.treesitter.start(args.buf)
    end
  end,
  desc = "Enable nvim-treesitter and install parser if not installed"
})

require("nvim-treesitter-textobjects").setup {
  select = {
    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,
    -- You can choose the select mode (default is charwise 'v')
    --
    -- Can also be a function which gets passed a table with the keys
    -- * query_string: eg '@function.inner'
    -- * method: eg 'v' or 'o'
    -- and should return the mode ('v', 'V', or '<c-v>') or a table
    -- mapping query_strings to modes.
    selection_modes = {
      ['@parameter.outer'] = 'v', -- charwise
      ['@function.outer'] = 'V', -- linewise
      -- ['@class.outer'] = '<c-v>', -- blockwise
    },
    -- If you set this to `true` (default is `false`) then any textobject is
    -- extended to include preceding or succeeding whitespace. Succeeding
    -- whitespace has priority in order to act similarly to eg the built-in
    -- `ap`.
    --
    -- Can also be a function which gets passed a table with the keys
    -- * query_string: eg '@function.inner'
    -- * selection_mode: eg 'v'
    -- and should return true of false
    include_surrounding_whitespace = false,
  },
}

-- keymaps
-- You can use the capture groups defined in `textobjects.scm`
vim.keymap.set({ "x", "o" }, "am", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "im", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ac", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ic", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
end)
-- You can also use captures from other query groups like `locals.scm`
vim.keymap.set({ "x", "o" }, "as", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
end)

require("aerial").setup()
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

require('treesj').setup({
  use_default_keymaps = false
})
vim.keymap.set('n', 'gS', function()
  require('treesj').toggle({ split = { recursive = true } })
end)

require('scrollEOF').setup()
EOF

nmap n <Plug>(searchhi-n)
nmap N <Plug>(searchhi-N)
nmap * <Plug>(searchhi-*)
nmap g* <Plug>(searchhi-g*)
nmap # <Plug>(searchhi-#)
nmap g# <Plug>(searchhi-g#)
nmap gd <Plug>(searchhi-gd)
nmap gD <Plug>(searchhi-gD)

vmap n <Plug>(searchhi-v-n)
vmap N <Plug>(searchhi-v-N)
vmap * <Plug>(searchhi-v-*)
vmap g* <Plug>(searchhi-v-g*)
vmap # <Plug>(searchhi-v-#)
vmap g# <Plug>(searchhi-v-g#)
vmap gd <Plug>(searchhi-v-gd)
vmap gD <Plug>(searchhi-v-gD)

nmap <silent> <C-L> <Plug>(searchhi-clear-all)
vmap <silent> <C-L> <Plug>(searchhi-v-clear-all)

let g:loaded_perl_provider = 0
