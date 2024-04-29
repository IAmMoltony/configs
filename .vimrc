set nocompatible
set number

" Plugins

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomasiser/vim-code-dark'
Plug 'wakatime/vim-wakatime'

call plug#end()

filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
syntax on
set smartindent

let g:mkdp_auto_start = 0

" Color scheme: VSCode Dark
colorscheme codedark

" Nums on/off custom command
command! NumsOff set nonumber
command! NumsOn set number

" Bring some bash aliases to vim!
command! Edtvrc tabnew ~/.vimrc
command! Relvrc source ~/.vimrc
command! Dnrun !dotnet run -v n
command! Dnbuild !dotnet build -v n
command! Care !love .

" Fix background
set t_ut=

set backspace=indent,eol,start
set autoread

" Mouse
set mouse=a

" A bunch of useless settings
set lazyredraw
set hls
set ruler
set cursorline
set visualbell
set title titlestring=Editing\ %F\ %m%r
set tbs
set mousef
set scf
set mh
set more
