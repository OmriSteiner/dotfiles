set number              " Display line numbers
set tabstop=4           " Tab length = 4 spaces
set autoindent
set cindent             " Automatically indent in C blocks etc.
set expandtab           " Always replace tabs with spaces
set shiftwidth=4        " >> == 4 spaces
set nowrap              " Don't wrap around lines
set splitbelow          " :split opens new window below current one
set splitright          " :vsplit opens new window right of the current one
set hlsearch            " Highlight search results
set incsearch           " Show search results as you type
set ignorecase          " Case insensitive search
set background=dark     " Assume the background colour is a dark color, change the color pallet accordingly

" Bindings
let mapleader = ","
:nnoremap <C-j> <C-e>
:nnoremap <C-k> <C-y>
:nmap <F2> :TagbarToggle<CR>
:nmap <F3> zf%
:nmap <F6> :setlocal spell!<CR>
:noremap <Home> ^

:map <ESC>Od <C-Left>
:map <ESC>Oc <C-Right>

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'

call vundle#end()
filetype plugin indent on

" ctrlp
let g:ctrlp_by_filename=1                                               " By default, search by filename
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:30'   " This is the default window, but with more results (10 -> 30)
let g:ctrlp_working_path_mode = 'a'                                     " Open in the current file's directory, unless it is a subdirectory of the cwd.
" let g:ctrlp_custom_ignore = {}    " TODO: this
let g:ctrlp_extensions = ['tag']                                        " Enable ctags search
let g:ctrlp_lazy_update = 200                                           " Search only after typing has stopped

" YouCompleteMe
"let g:ycm_autoclose_preview_window_after_insertion=1                   " Close the preview window after we leave insert mode.
let g:ycm_confirm_extra_conf=0                                          " Don't ask whether to load .ycm_extra_conf.py
"let g:ycm_key_invoke_completion = '<C-N>'
let g:ycm_key_list_stop_completion = ['<C-y>', '<Enter>']

" Tagbar
let g:tagbar_autofocus=1                                                " Automatically focus tagbar when it is opened
let g:tagbar_sort=0                                                     " Don't sort the tags by name
