Vim�UnDo� d�r?!�yn�]S&���@����m'���j      set inoremap jk <esc>                             UAn�    _�                            ����                                                                                                                                                                                                                                                                                                                                       6           V        UAm�     �             4   <""" Automatically make needed files and folders on first run   D""" If you don't run *nix you're on your own (as in remove this) {{{   2    call system("mkdir -p $HOME/.vim/{swap,undo}")   c    if !filereadable($HOME . "/.vimrc.plugins") | call system("touch $HOME/.vimrc.plugins") | endif   _    if !filereadable($HOME . "/.vimrc.first") | call system("touch $HOME/.vimrc.first") | endif   ]    if !filereadable($HOME . "/.vimrc.last") | call system("touch $HOME/.vimrc.last") | endif   """ }}}   """ Vundle plugin manager {{{   3    """ Automatically setting up Vundle, taken from   W    """ http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/ {{{       let has_vundle=1   ?    if !filereadable($HOME."/.vim/bundle/Vundle.vim/README.md")   #        echo "Installing Vundle..."           echo ""   *        silent !mkdir -p $HOME/.vim/bundle   [        silent !git clone https://github.com/gmarik/Vundle.vim $HOME/.vim/bundle/Vundle.vim           let has_vundle=0   	    endif   """ }}}   """ Initialize Vundle {{{   filetype off " required to init   6set rtp+=$HOME/.vim/bundle/Vundle.vim " include vundle   !call vundle#begin() " init vundle   """ }}}   B" " alternatively, pass a path where Vundle should install plugins   (" "call vundle#begin('~/some/path/here')        Plugin 'gmarik/Vundle.vim'   =      """ Local plugins (and only plugins in this file!) {{{{   0        if filereadable($HOME."/.vimrc.plugins")   '            source $HOME/.vimrc.plugins           endif       """ }}}       "Git wrapper         Plugin 'tpope/vim-fugitive'       " Snippets        Plugin 'SirVer/ultisnips'   *    " Easy Motion plugin, self-explanatory   %     Plugin 'Lokaltog/vim-easymotion'   0    "Matchit plugin (advanced matching commands)       Plugin 'tmhedberg/matchit'       "latex-suite   &    Plugin 'LaTeX-Suite-aka-Vim-LaTeX'       "surround plugin       Plugin 'vim-surround'   ,    "NERDtree plugin, a substitute for netrw   !    "Plugin 'scrooloose/nerdtree'       "Colorscheme mania   #    Plugin 'flazz/vim-colorschemes'       Plugin 'tomasr/molokai'       " Syntax improver/checker   !    Plugin 'scrooloose/syntastic'       " Commenting helps 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V       UAn     �                    %    Plugin 'scrooloose/nerdcommenter'   $    " Fuzzy finder (files, mru, etc)       Plugin 'kien/ctrlp.vim'   !    " Useful word completion tool   %    Plugin 'Shougo/neocomplcache.vim'   .    Plugin 'JazzCore/neocomplcache-ultisnips'        " Python helps       Plugin 'klen/python-mode'       " Visual undo tree       Plugin 'Gundo'       " Autoclose (, " etc.        Plugin 'Townk/vim-autoclose'       " Align your = etc.       Plugin 'vim-scripts/Align'        " Functions, class data etc.   %    " REQUIREMENTS: (exuberant)-ctags       Plugin 'majutsushi/tagbar'   X    " Multiple Cursors -- "Out of the box, all you need to know is a single key Ctrl-n."   )    Plugin 'terryma/vim-multiple-cursors'   .call vundle#end()         "end reading plugins   ; """ Installing plugins the first time, quits when done {{{       if has_vundle == 0           :silent! PluginInstall           :qa   	    endif   """ }}}5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V       UAn     �                	set ruler5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V       UAn     �                
set number5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V       UAn     �                set splitbelow5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V       UAn     �                set splitright5�_�      	              	        ����                                                                                                                                                                                                                                                                                                                                                 V       UAn     �      	          colorscheme molokai5�_�      
           	   
        ����                                                                                                                                                                                                                                                                                                                            
                      V        UAn      �   	   
          ,set wildmenu " enable completion in the menu   -set showcmd " show the command last performed5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                  V        UAn)     �                'set hlsearch " highlight search results   "set incsearch " search as you type   *set gdefault " replace globally by default   " }}}   set hidden " Hidden buffers5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                  V        UAn*     �                set ttyfast "fast redraws5�_�                            ����                                                                                                                                                                                                                                                                                                                                       a           V        UAn>     �             R   """ Files {{{   )    set autochdir " always use curr. dir.   %    set autoread " refresh if changed   '    set confirm " confirm changed files   %    set noautowrite " never autowrite   "    set nobackup " disable backups   -    """ Persistent undo. Requires Vim 7.3 {{{   3    if has('persistent_undo') && exists("&undodir")   A        " Move undo files to less annoying place than current dir   1        if isdirectory($HOME . '/.vim/undo') == 0   :            :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1           endif   !        set undodir=./.vim-undo//   "        set undodir+=~/.vim/undo//           set undofile   -        set undolevels=500 " max undos stored   2        set undoreload=10000 " buffer stored undos   	    endif   """ }}}   J""" Swap files, unless vim is invoked using sudo. Inspired by tejr's vimrc   >""" https://github.com/tejr/dotfiles/blob/master/vim/vimrc {{{       if !strlen($SUDO_USER)   D        set directory^=$HOME/.vim/swap// " default cwd, // full path   (        set swapfile " enable swap files   5        set updatecount=50 " update swp after 50chars   I        " Move swap files to a less annoying place than current directory   1        if isdirectory($HOME . '/.vim/swap') == 0   7          :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1           endif   #        set directory=./.vim-swap//   $        set directory+=~/.vim/swap//           set directory+=~/tmp//           set directory+=.   5        """ Don't swap tmp, mount or network dirs {{{           augroup SwapIgnore   =        autocmd! BufNewFile,BufReadPre /tmp/*,/mnt/*,/media/*           \ setlocal noswapfile           augroup END           """ }}}       else   0        set noswapfile " dont swap sudo'ed files   	    endif       """ }}}   M    " When editing a file, always jump to the last known cursor position. {{{   N    " Don't do it when the position is invalid or when inside an event handler   -    " (happens when dropping a file on gvim).   N    " Also don't do it when the mark is in the first line, that is the default   #    " position when opening a file.       if has('autocmd')   $        autocmd BufReadPost * nested   :        \ if line("'\"") > 1 && line("'\"") <= line("$") |   "            \ exe "normal! g`\"" |           \ endif   	    endif   	    " }}}   """ }}}   """ Text formatting {{{   )    set autoindent " preserve indentation   4    set backspace=indent,eol,start " smart backspace   /    set cinkeys-=0# " don't force # indentation        set expandtab " no real tabs   +    set ignorecase " by default ignore case   3    set nrformats+=alpha " incr/decr letters C-a/-x   (    set shiftround " be clever with tabs        set shiftwidth=4 " default 8   ,    set smartcase " sensitive with uppercase   $    set smarttab " tab to 0,4,8 etc.   .    set softtabstop=4 " "tab" feels like <tab>   ,    set tabstop=4 " replace <TAB> w/4 spaces   8    """ Only auto-comment newline for block comments {{{       augroup AutoBlockComment   G        autocmd! FileType c,cpp setlocal comments -=:// comments +=f://       augroup END       """ }}}   I    """ Take comment leaders into account when joining lines, :h fo-table   :    """ http://ftp.vim.org/pub/vim/patches/7.3/7.3.541 {{{       if has("patch-7.3.541")           set formatoptions+=j   	    endif       """ }}}   """ }}}    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        UAnR     �             
    " =======ultisnips config=======   (" set expansion trigger to control-space   if has('gui_running')   ,    let g:UltiSnipsExpandTrigger="<C-Space>"   else    (    let g:UltiSnipsExpandTrigger="<C-j>"   endif   =" make ultisnips split window vertically to edit snippet file   #let g:UltiSnipsEditSplit="vertical"    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        UAnW     �                0"nnoremap <silent> \lv :! open -a Skim.app %<CR>5�_�                            ����                                                                                                                                                                                                                                                                                                                                       #           V        UAn`    �                    +" =======NeoComplCache Configuration=======   +" neocomplete (adding things to completion)   )let g:neocomplcache_enable_at_startup = 1   8" don't have autocomplete come up unless you press <tab>   let g:acp_enableAtStartup = 0   " Tab completion, the right way   8inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"       " Maps   " highlight last inserted text   nnoremap gV `[v`]   0"Redraw the screen and turn off search highlight   nnoremap <C-L> :nohl<CR><C-L>     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        UAn�     �                  �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        UAn�     �                  5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        UAn�     �                 set inoremap jk <esc>    �                  �               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        UAn�     �                 set inoremap jk <esc>5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        UAn�    �                 set inoremap jk <esc>5�_�                             ����                                                                                                                                                                                                                                                                                                                                                  V        UAm�     �       �           5��