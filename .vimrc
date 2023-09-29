set nocompatible
set number
set relativenumber

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()

filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
