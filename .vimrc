set nocompatible
set number

" Plugins

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomasiser/vim-code-dark'
Plug 'wakatime/vim-wakatime'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'

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
command! Evrc e ~/.vimrc
command! Relvrc source ~/.vimrc
command! Edtbrc tabnew ~/.bashrc
command! Ebrc e ~/.bashrc
command! Edtba tabnew ~/.bash-configs/.bash_aliases
command! Eba e ~/.bash-configs/.bash_aliases
command! Edtbf tabnew ~/.bash-configs/.bash_functions
command! Ebf e ~/.bash-configs/.bash_functions
command! Edtkc tabnew ~/.config/kitty/kitty.conf
command! Ekc e ~/.config/kitty/kitty.conf
command! Edti3 tabnew ~/.config/i3/config
command! Ei3 e ~/.config/i3/config
command! Edtpyreq tabnew ./requirements.txt
command! Epyreq e ./requirements.txt
command! Dnrun !dotnet run -v n
command! Dnbuild !dotnet build -v n
command! Dnbld !dotnet build -v n
command! Dnfmt !dotnet format
command! Care !love .
command! Black !black %
command! Pylint !pylint %
command! Shck !shellcheck %
command! Chx !chmod +x %

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
set visualbell
set title titlestring=Editing\ %F\ %m%r
set tbs
set mousef
set scf
set mh
set more

" Nerd tree

nnoremap <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
let g:NERDTreeFileLines = 1
