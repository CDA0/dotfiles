set nocompatible              " be iMproved, required
filetype off                  " required

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('$USERPROFILE/vimfiles/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'itchyny/lightline.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jacoborus/tender'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"

" Syntax Highlighting "
syntax on
syntax enable

" ColorScheme
colorscheme tender
set laststatus=2
let g:lightline = { 'enable': {'statusline': 1, 'tabline': 1},'colorscheme': 'tender' }

" Make vim incompatible to vi. "
set nocompatible
set modelines=0

" TAB settings "
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"More common Settings.
set colorcolumn=100
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell

"set relativenumber
set number
set norelativenumber

"Changing leader Key
let mapleader = ","
map <Leader>s :source $MYVIMRC<Cr>
map <Leader>e :e $MYVIMRC<Cr>
map <Leader>b :CtrlPBuffer<Cr>

"Changing Esc key
:imap jk <Esc>

"Set mapping for CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|compiled)|(\.(swp|ico|git|svn))$'
"CtrlP-Funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

"Syntastic
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['javascript'], 'passwive_filetypes': [] }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populdate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
" use local eslint
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let b:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')


autocmd VimEnter * redraw!
