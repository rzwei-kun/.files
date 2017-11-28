 "Some random stuff
syntax enable
colorscheme deus
set background=dark
set t_Co=256
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
" map <C-n> :NERDTreeToggle<CR>

nmap <Leader>w <Plug>(easymotion-bd-w)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
nmap <Leader>s <Plug>(easymotion-bd-wl)

" Dont bother kids!
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>


" Plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'junegunn/goyo.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'easymotion/vim-easymotion'
" Plugin 'tpope/vim-surround'
" Plugin 'scrooloose/nerdtree'
Plugin 'thinca/vim-ambicmd'
Plugin 'junegunn/limelight.vim'
Plugin 'idanarye/breeze.vim'
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
Plugin 'alvan/vim-closetag'
Plugin 'jiangmiao/auto-pairs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tmhedberg/matchit'
Plugin 'StanAngeloff/php.vim'
Plugin 'ajmwagar/vim-dues'

call vundle#end()
filetype plugin indent on

set laststatus=2
set noshowmode

" cnoremap <expr> <Space> ambicmd#expand("\<Space>")
" cnoremap <expr> <CR>    ambicmd#expand("\<CR>")

let g:lightline = {'colorscheme':'seoul256'}
autocmd VimEnter * redrawstatus!     
set showcmd

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_paragraph_span = 1

function! s:goyo_enter()
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    set noshowmode
    set noshowcmd
    set scrolloff=999
    Limelight
endfunction

function! s:goyo_leave()
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    set showmode
    set showcmd
    set scrolloff=5
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|mp3|pdf|zip|mp4|mkv|tar|gz|rar|mhtml|jpg|png|gif|jpeg)$',
    \ }

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" let g:NERDTreeDirArrowExpandable = ''
" let g:NERDTreeDirArrowCollapsible = ''
" let NERDTreeIgnore = [
"             \ '\.mp[0-9]$', '\.zip$', '\.pdf$', '\.mhtml$',
"             \ '\.tar.gz$', '\.7z$', '\.png$', '\.gif$', '\.jpg$',
"             \ ]
"
"

let g:AutoPairsShortcutJump = '<c-b>'
let g:user_emmet_install_global = 0

autocmd FileType html,css EmmetInstall
autocmd FIleType html,css,php colorscheme deus
au BufRead,BufNewFile *.md setlocal textwidth=80

let g:user_emmet_leader_key = '<c-e>'

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
