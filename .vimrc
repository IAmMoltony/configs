set nocompatible
set number
set relativenumber

" Plugins

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'IAmMoltony/vim-dotnet'
Plug 'iamcco/markdown-preview.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'wellle/context.vim'
Plug 'Exafunction/codeium.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'beyondmarc/hlsl.vim'
Plug 'wakatime/vim-wakatime'

call plug#end()

filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
syntax on
set smartindent

command Nerd NERDTree
let g:mkdp_auto_start = 0

" Color scheme: VSCode Dark
colorscheme codedark

" Nums on/off custom command
command! NumsOff set nonumber norelativenumber
command! NumsOn set number relativenumber

" Bring some bash aliases to vim!
command! Edtvrc tabnew ~/.vimrc
command! Relvrc source ~/.vimrc
command! Dnrun !dotnet run -v n
command! Dnbuild !dotnet build -v n

" Fix background
set t_ut=

set backspace=indent,eol,start
set autoread

" Mouse
set mouse=a
