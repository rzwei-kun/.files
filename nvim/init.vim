 "Some random stuff
syntax enable
set encoding=utf-8
set ruler
set wildmenu
set title
set nobackup
set noswapfile
let mapleader=" "

"Again some stuff
set complete-=i
set encoding=utf-8
set display+=lastline
set linebreak
set scrolloff=1
set sidescrolloff=5
set wrap

" Search stuff
set hlsearch
set ignorecase
set smartcase
set incsearch
set showmatch
set cuc cul"

" Tabbing
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set shiftwidth=4
set shiftround
set smarttab

" Line stuff
set number
set relativenumber
set cursorline
set lazyredraw

" Keymap
nnoremap ; :
nnoremap <silent> <C-l> <Esc>:nohlsearch<CR><Esc>
cnoremap qq q!

" No noob allowed
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
