set nocompatible
set number
set relativenumber

" Plugins

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomasiser/vim-code-dark'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-sleuth'
Plug 'preservim/NERDtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

call plug#end()

filetype plugin indent on
syntax on
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

let g:mkdp_auto_start = 0

" Color scheme: VSCode Dark (the irony)
colorscheme codedark

" Nums on/off custom command
command! NumsOff set nonumber norelativenumber
command! NumsOn set number relativenumber

" Bring some bash aliases to vim!
command! Edtvrc tabnew ~/.vimrc
command! Evrc e ~/.vimrc

command! Relvrc source ~/.vimrc
command! Rvrc source ~/.vimrc

command! Edtbrc tabnew ~/.bashrc
command! Ebrc e ~/.bashrc

command! Edtba tabnew ~/configs/.bash_aliases
command! Eba e ~/configs/.bash_aliases

command! Edtuba tabnew ~/.config/bash-configs/useraliases
command! Euba e ~/.config/bash-configs/useraliases

command! Edtbf tabnew ~/configs/.bash_functions
command! Ebf e ~/configs/.bash_functions

command! Edtubf tabnew ~/.config/bash-configs/userfunctions
command! Eubf e ~/.config/bash-configs/userfunctions

command! Edtkc tabnew ~/.config/kitty/kitty.conf
command! Ekc e ~/.config/kitty/kitty.conf

command! Edti3 tabnew ~/.config/i3/config
command! Ei3 e ~/.config/i3/config

command! Edtpyreq tabnew ./requirements.txt
command! Epyreq e ./requirements.txt

command! Dnrun !dotnet run -v n
command! Dnrunnb !dotnet run -v n --no-build
command! Dnbuild !dotnet build -v n
command! Dnbld !dotnet build -v n
command! Dnfmt !dotnet format

" Run shit
command! Care !love .
command! Black !black %
command! Pylint !pylint %
command! Shck !shellcheck %
command! Chx !chmod +x %
command! Go !./%

" Caps lock ahh
command! W w
command! Q q
command! WQ wq
command! QA qa
command! WQA wqa

" Fix background
set t_ut=

set backspace=indent,eol,start
set autoread

" Mouse
set mouse=a

" A bunch of useless settings
set hls
set ruler
set cursorline
set cursorcolumn
set title titlestring=Editing\ %F\ %m%r
set tbs
set mousef
set scf
set mh
set more

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" this ONE key combination has cost me HOURS of rewriting the same code
" who the HELL came up with this???
inoremap <C-u> <Nop>

" the wild menu
" so wild
set wildmenu
set wildmode=longest:full,full

