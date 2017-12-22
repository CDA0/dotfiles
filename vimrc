" Automatically install vim-plug and run PlugInstall if vim-plug not found
" see https://github.com/junegunn/vim-plug/wiki/faq#automatic-installation
if has('nvim')
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

if has('nvim')
	call plug#begin('~/.config/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
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
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/python-support.nvim'
" Plug 'roxma/nvim-cm-tern', {'do': 'npm install'}
" Plug 'vim-scripts/Decho'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-grepper'

" Langs
Plug 'pangloss/vim-javascript'
Plug 'modille/groovy.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'

if has('nvim')
  " Neovim only plugs
else
  " Vim only plugs
  Plug 'roxma/vim-hug-neovim-rpc'
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

" set swap and undo directories
if has('nvim')
  set backupdir=~/.config/nvim/backup
  set directory=~/.config/nvim/backup
  set undodir=~/.config/nvim/undodir
else
  set backupdir=~/.vim/backup
  set directory=~/.vim/swap
  set undodir=~/.vim/undo
endif
set undofile
set undolevels=100
set undoreload=1000

" always show current position
set ruler

" highlight current line
set cursorline

" do not wrap lines
" set nowrap

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

" make backspace behave properly
set backspace=indent,eol,start

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
map <Leader>eb :e ~/.bashrc<Cr>
map <Leader>et :e ~/.tmux.conf<Cr>

" quick turn off search highlight
map <Leader>h :nohl<Cr>

" quick search wuth ack / silver searcher
map <Leader>f :Ack 

nnoremap <Leader>g :Grepper -tool git<cr>
nnoremap <Leader>G :Grepper -tool rg<cr>

" single insert/append char
nnoremap <Leader><Leader>i i_<Esc>r
nnoremap <Leader><Leader>a a_<Esc>r

" select chars inserted last time in insert mode
nnoremap gV `[v`]

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

" vim-airline/vimairline
let g:airline#extensions#tabline#enabled = 1

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
let g:ale_fixers = {
\   'javascript': ['standard'],
\}
let g:ale_fix_on_save = 1
au BufRead,BufEnter *.js let b:ale_javascript_standard_executable = nrun#Which('semistandard')

" NERDcommenter
let g:NERDSpaceDelims = 1

" NERDTree
map <C-e> :NERDTreeToggle<Cr>
let NERDTreeIgnore = ['node_modules', 'logs', '\.log$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" supertab
let g:SuperTabDefaultCompletionType = "<C-n>"

" bbye
map <Leader>d :Bdelete<Cr>

" vim-jsx
let g:jsx_ext_required = 0

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" python-support
let g:python_support_python2_require = 0

" Toggle relative numbers
" map <c-n> :call ToggleNumber()<Cr>
" function! ToggleNumber()
  " if(&relativenumber == 1)
    " set norelativenumber
    " set number
  " else
    " set relativenumber
  " endif
" endfunc
