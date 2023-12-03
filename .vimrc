set nocompatible
set number
set relativenumber

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'IAmMoltony/vim-dotnet'

call vundle#end()

filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
syntax on
set smartindent

command Nerd NERDTree
let g:ycm_enable_semantic_highlighting=1
