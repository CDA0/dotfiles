call plug#begin('~/.config/nvim/plugged')

" colourschemes
Plug 'altercation/vim-colors-solarized' 
Plug 'vim-scripts/candy.vim'
Plug 'tpope/vim-vividchalk'
Plug 'nanotech/jellybeans.vim'

" general
Plug 'benekastah/neomake'
Plug 'jaawerth/neomake-local-eslint-first'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
" Plug 'ternjs/tern'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'vim-scripts/Decho'

call plug#end()

" syntax on
syntax enable
set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized
" colorscheme candy
colorscheme jellybeans
" colorscheme vividchalk

set number
set norelativenumber

set hlsearch

set undodir=~/.config/nvim/undodir
set undofile
set undolevels=100
set undoreload=1000

set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/backup

set ruler
set cursorline
set colorcolumn=100

if has('mouse')
  set mouse=a
endif

" tab settings
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set shiftwidth=2
set autoindent
set smartindent

let mapleader = ','
map <Leader>w :w<Cr>
map <Leader>s :source $MYVIMRC<Cr>
map <Leader>e :e $MYVIMRC<Cr>
map <Leader>h :nohl

" fix for single insert char
nnoremap <Leader>i i_<Esc>r
nnoremap <Leader>a a_<Esc>r

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" change <Esc> key
:imap jk <Esc>

" ctrlp
map <Leader>b :CtrlPBuffer<Cr>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|target|dist|compiled)|(\.(swp|ico|git|svn))$'
let g:ctrlp_working_path_mode = 'a'

" ctrlp-funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky' . expand('<cword>')<Cr>

" neomake
let g:neomake_javascript_eslint_exe = nrun#Which('eslint')
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufEnter,BufWritePost * Neomake

" NERDcommenter
let g:NERDSpaceDelims = 1

" set python for YouCompleteMe/Deoplete also need to pip install neovim / pip3
" install neovim
" let g:python_host_prog='/usr/bin/python'
let g:deoplete#enable_at_startup = 1

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
