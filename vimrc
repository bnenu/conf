filetype plugin indent on
"completion for js
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"use prettier for javascript
autocmd FileType javascript setlocal formatprg=prettier\ --stdin
"autocmd BufWritePre *.js :normal gggqG
autocmd FileType elm setlocal shiftwidth=4 tabstop=4
"other configs
syntax enable
set mouse=a
set encoding=utf-8
set fileencoding=utf-8
"using the system clipboard
set clipboard=unnamedplus

set expandtab
set shiftwidth=2
set softtabstop=-2
set tabstop=2
set noshiftround
set smarttab
set backspace=indent,eol,start
":setlocal foldmethod=syntax
set autoindent
set nosmartindent
set nocindent

set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan
set number

set visualbell
set t_vb=

set wildmenu
set wildmode=list:longest,full

set t_Co=256
set background=dark
colorscheme slate

set noshowmode

let g:netrw_liststyle = 3
let g:netrw_banner = 0

let mapleader=';'

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
"change cursor based on mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>[6 q"
  let &t_SR = "\<Esc>[4 q"
  let &t_EI = "\<Esc>[2 q"
  "let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  "let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" Airline config
" disabled vim buffer echoing
let g:bufferline_echo = 0
" tmux integration enabled
let g:airline_theme='papercolor'
let g:airline#extentions#tmuxline#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Status bar for vim and tmux
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Git wrapper
Plug 'tpope/vim-fugitive'
" Tmux suppport in vim
Plug 'tpope/vim-tbone'
" Js syntax support
Plug 'pangloss/vim-javascript'
Plug 'leshill/vim-json'
Plug 'mxw/vim-jsx'
" Dark blue color scheme
Plug 'cocopon/iceberg.vim'
" tmux statusline generator
Plug 'edkolev/tmuxline.vim'
" indent lines
Plug 'nathanaelkane/vim-indent-guides'
" fuzzy finder global
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" elm support
Plug 'elmcast/elm-vim'
" elixir support
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

" scratchpad
Plug 'metakirby5/codi.vim'

"Initialize plugin system
call plug#end()


" indentation lines on
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,ColorScheme * :hi IndentGuidesOdd  guibg=red ctermbg=232
autocmd VimEnter,ColorScheme * :hi IndentGuidesEven guibg=green ctermbg=233
" Others
let g:javascript_plugin_flow = 1

" ALE config
let g:ale_javascript_eslint_use_global = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:airline#extensions#ale#enabled = 1
highlight ALEError ctermbg=DarkGreen ctermfg=Black
highlight ALEWarning ctermbg=Blue ctermfg=Black
let g:jsx_ext_required = 0

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
