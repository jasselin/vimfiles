set nocompatible
filetype off
set runtimepath^=~/.vim

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'elixir-lang/vim-elixir'
Plugin 'mileszs/ack.vim'

call vundle#end()

colorscheme mustang
set background=dark

if has("gui_running")
  set guioptions-=m
  set guioptions-=T

  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=DejaVu\ Sans\ Mono:h11
    set encoding=UTF8
  endif
endif

syntax on
filetype plugin indent on

set nobackup
set nowritebackup
set noswapfile

set nowrap

set autoindent
set number
set smartcase
set showmatch " Show matching braces
set backspace=eol,start,indent
set ruler
set wildmenu
set showcmd
set laststatus=2

set expandtab " Tab to spaces
set shiftround
set tabstop=4
set shiftwidth=4
set softtabstop=4

set hlsearch " Highlight search
set incsearch " Incremental search
set ic " case insensitive search

" Remove trailing spaces on save
" autocmd BufWritePre * :%s/\s\+$//e

" NERDTree
map <C-n> :NERDTreeToggle<CR>
" Auto close vim if NERDTree is the last opened window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" CtrlP
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
"let g:ctrlp_user_command = 'ag -l --nocolor --hidden -g %s ""'

" Syntastic
let g:syntastic_javascript_checkers = ['jsxhint']

" Recognize mardown files
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Remaps common typos
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Fixes for French-Canadian keyboard layout
nnoremap ? ^
nnoremap é ?

let mapleader=","
map <leader>q :only<cr>:q<cr>
map <leader>3 :nohl<cr>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <leader>a :Ack 

:command Vimrc tabe $MYVIMRC