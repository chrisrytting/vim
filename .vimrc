set nocompatible
filetype plugin indent on    
" =====General Configuration=====
"Interface goodies
" Enable syntax highlighting
syntax on
"Set the colorscheme
"Completion options {{{
set wildignore=*.a,*.o,*.so,*.pyc,*.jpg,
\*.jpeg,*.png,*.gif,*.pdf,*.git,
\*.swp,*.swo "what to ignore for tab completion
" }}}
" Searching and replacing options {{{
set history=1000 " uber nice history
" =======LaTeX Configuration=======
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
set iskeyword+=:
let g:Tex_DefaultTargetFormat = 'pdf'
" =======Miscellaneous=======
"Let VIM know it can do awesome colors :)
set t_Co=256
inoremap jk <esc>
set number
syntax enable
set background=dark
colorscheme solarized

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
Plugin 'sirver/UltiSnips'
Plugin 'Shougo/neocomplete.vim'
Plugin 'honza/vim-snippets'



call vundle#end()            " required
filetype plugin indent on    " required
cmap run w \| !python % 

"Build files in Latex using jj"
cmap jj :w<CR> \ll \lv

"execute pathogen#infect()
syntax on
filetype plugin indent on
cd /Users/crytting/Vim

set clipboard=unnamed " for Mac

" =======NeoComplete Configuration=======
" neocomplete (adding things to completion)
"
let g:acp_enableAtStartup=0
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
imap <C-space> <Plug>IMAP_JumpForward
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
