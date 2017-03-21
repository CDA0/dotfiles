call plug#begin('~/.vim/plugged')
if has('nvim')
	call plug#begin('~/.config/nvim/plugged')
endif

" colourschemes
Plug 'altercation/vim-colors-solarized' 
Plug 'vim-scripts/candy.vim'
Plug 'tpope/vim-vividchalk'
Plug 'nanotech/jellybeans.vim'

" general
Plug 'benekastah/neomake'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'mileszs/ack.vim'
" Plug 'vim-scripts/Decho'

if has('nvim')
  " Neovim only plugs
  Plug 'jaawerth/neomake-local-eslint-first'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  " Vim only plugs
  Plug 'vim-syntastic/syntastic'
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
  Plug 'ternjs/tern'
endif

call plug#end()

" syntax on
syntax enable
filetype indent on
set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized
" colorscheme candy
colorscheme jellybeans
" colorscheme vividchalk

set number
set norelativenumber

set incsearch
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
set showmatch

set wildmenu
set lazyredraw
set showcmd

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
map <Leader>sv :source $MYVIMRC<Cr>
map <Leader>ev :e $MYVIMRC<Cr>
map <Leader>ez :e ~/.zshrc<Cr>
map <Leader>et :e ~/.tmux.conf<Cr>
map <Leader>h :nohl<Cr>
map <Leader>f :Ack 
map <Leader>fc :ccl<Cr>
map <Leader>fo :cope<Cr>

" fix for single insert char
nnoremap <Leader>i i_<Esc>r
nnoremap <Leader>a a_<Esc>r
" select chars inserted last time in insert mode
nnoremap gV `[v`]

" map ctrl+{h,j,k,l} to moving between splits
noremap <c-l> <c-w>l
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-h> <c-w>h

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

if has('nvim')
  " neomake
  let g:neomake_javascript_eslint_exe = nrun#Which('eslint')
  let g:neomake_javascript_enabled_makers = ['eslint']
  autocmd! BufEnter,BufWritePost * Neomake
else
  " syntastic
  let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['javascript'], 'passive_filetypes': [] }
  let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatusFlag()}
  set statusline+=%*
  let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
  let b:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endif

" NERDcommenter
let g:NERDSpaceDelims = 1

" set python for YouCompleteMe/Deoplete also need to pip install neovim / pip3
" install neovim
" let g:python_host_prog='/usr/bin/python'
if has('nvim')
	let g:deoplete#enable_at_startup = 1
endif

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Toggle relative numbers
map <c-n> :call ToggleNumber()<Cr>
function! ToggleNumber()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc
