set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'scrooloose/nerdtree'
Bundle 'jnwhiteh/vim-golang'

filetype plugin indent on

set number
syntax on
set hlsearch

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set smartcase
set colorcolumn=80
