 "Some random stuff
syntax on
set termguicolors
set encoding=utf-8
set ruler
set wildmenu
set title
set nobackup
set noswapfile
let mapleader=" "

set backspace=indent,eol,start

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

" Mapping
nnoremap ; :
nnoremap <silent> <C-l> <Esc>:nohlsearch<CR><Esc>
nnoremap j gj
nnoremap k gk
cmap w!! w !sudo tee % >/dev/null
imap <C-D> <C-O>x
cnoremap qq q!
map <s-k> <nop>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>:nohl<CR><esc>
inoremap jj <Esc>
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Dont bother kids!
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>


" Plugins
call plug#begin('$HOME/.config/nvim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'KeitaNakamura/neodark.vim'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'brooth/far.vim'
Plug 'tpope/vim-endwise', { 'for': 'ruby' }

call plug#end()

filetype plugin indent on

" Colorscheme
let g:neodark#background = '#202020'
colorscheme neodark

" Airlines
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0

" NERD Commenter
" <leader> cc
" <leader> c <space>
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1


" Ctrl P
" open <c-p>
" cycle <c-f|b>
" filename <c-o>
" tab/split <c-t|vx>
" refresh f5
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


" NERDTree
" <c-n>
" g... preview
" i split
" s vsplit
" p parent
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'


" Easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-f2)
nmap s <Plug>(easymotion-bd-f)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Indentation
au FileType ruby setl sw=2 sts=2 et
