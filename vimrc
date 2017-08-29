" Automatically install vim-plug and run PlugInstall if vim-plug not found
" see https://github.com/junegunn/vim-plug/wiki/faq#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'w0rp/ale'
Plug 'jaawerth/nrun.vim'
Plug 'moll/vim-bbye'
" Plug 'vim-scripts/Decho'

" Langs
Plug 'pangloss/vim-javascript'
Plug 'modille/groovy.vim'
Plug 'mustache/vim-mustache-handlebars'

if has('nvim')
  " Neovim only plugs
  " Plug 'benekastah/neomake'
  " Plug 'jaawerth/neomake-local-eslint-first'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  " Vim only plugs
  " Plug 'mtscout6/syntastic-local-eslint.vim'
  " Plug 'vim-syntastic/syntastic'
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
  Plug 'ternjs/tern'
endif

call plug#end()

" syntax on
syntax enable
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Theme settings
set background=dark
colorscheme jellybeans

" use line nummber and not relative line number
set number
set norelativenumber

" start scrolling a number of lines from the edge
set scrolloff=8

" ignore case on search unless there is an uppercase letter
set smartcase

" make search act like a modern browser
set incsearch

" highlight search results
set hlsearch

" set neovim directories
if has('nvim')
  set backupdir=~/.config/nvim/backup
  set directory=~/.config/nvim/backup
  set undodir=~/.config/nvim/undodir
  set undofile
  set undolevels=100
  set undoreload=1000
endif

" always show current position
set ruler

" highlight current line
set cursorline

" do not wrap lines
set nowrap

" set a marker at column number
set colorcolumn=100

" show matching brackets when cursor is over them
set showmatch

" turn on wildmenu (tab completion on command bar)
set wildmenu

" don't redraw while executing macros
set lazyredraw

" show command in last line of the screen
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

" change the Leader key for quick commands
let mapleader = ','

" quick save
map <Leader>w :w<Cr>

" copy and paste to clipboard
vnoremap <Leader>y  "+y
nnoremap <Leader>Y  "+yg_
nnoremap <Leader>y  "+y
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" edit and source vimrc and system configs
map <Leader>sv :source $MYVIMRC<Cr>
map <Leader>ev :e $MYVIMRC<Cr>
map <Leader>ez :e ~/.zshrc<Cr>
map <Leader>et :e ~/.tmux.conf<Cr>

" quick turn off search highlight
map <Leader>h :nohl<Cr>

" quick search wuth ack / silver searcher
map <Leader>f :Ack

" single insert/append char
nnoremap <Leader><Leader>i i_<Esc>r
nnoremap <Leader><Leader>a a_<Esc>r

" select chars inserted last time in insert mode
nnoremap gV `[v`]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Movement
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map ctrl+{h,j,k,l} to moving between splits
" noremap <c-l> <c-w>l
" noremap <c-k> <c-w>k
" noremap <c-j> <c-w>j
" noremap <c-h> <c-w>h

" nvim termal move splits
" if has('nvim')
  " tnoremap <C-h> <C-\><c-n><c-w>h
  " tnoremap <C-j> <C-\><C-n><C-w>j
  " tnoremap <C-k> <C-\><C-n><C-w>k
  " tnoremap <C-l> <C-\><C-n><C-w>l
  " " start insert mode when switching to a terminal
  " autocmd BufWinEnter,WinEnter term://* startinsert
" endif

" disable arrow keys in normal mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" change <Esc> key
:imap jk <Esc>

" save buffer on losing focus and leaving buffer
au FocusLost * :wa
au BufLeave * :wa

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|target|dist|compiled|lib)|(\.(swp|ico|git|svn))$'
let g:ctrlp_working_path_mode = 'a'


" ALE
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_linters = {
\   'javascript': ['standard'],
\}
au BufRead,BufEnter *.js let b:ale_javascript_standard_executable = nrun#Which('semistandard')

" NERDcommenter
let g:NERDSpaceDelims = 1

" NERDTree
map <C-e> :NERDTreeToggle<Cr>
let NERDTreeIgnore = ['node_modules', 'logs', '\.log$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" bbye
map <Leader>d :Bdelete<Cr>

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
