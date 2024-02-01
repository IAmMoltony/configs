set nocompatible
set number
set relativenumber

" Plugins

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'IAmMoltony/vim-dotnet'
Plug 'iamcco/markdown-preview.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

Plug 'ryanoasis/vim-devicons'
Plug 'tomasiser/vim-code-dark'
Plug 'preservim/vim-indent-guides'
Plug 'kamykn/spelunker.vim'

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

" Nums on/off custom command
command! NumsOff set nonumber norelativenumber
command! NumsOn set number relativenumber

" Color scheme: VSCode Dark
colorscheme codedark

" NerdTree settings
autocmd VimEnter * NERDTree | wincmd p
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
