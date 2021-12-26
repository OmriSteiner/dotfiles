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
set diffopt=filler,vertical " Open diff in vertical files (for :Gdiff)
set listchars=tab:>-    " Show tabs as >---
set list                " Enable the previous option
set showcmd             " Show command as it is being typed
set updatetime=1000     " How often will the swap file be written to disk, ALSO - how long until YCM hover documentation shows up
set colorcolumn=80      " color the 80th column, as a ruler.
set scrolloff=5         " Scroll before you reach the end of the screen.
set directory=~/.vim/swapfiles// " Change the directory for swapfiles
highlight ColorColumn ctermbg=darkgrey

" Bindings
let mapleader = ","
:nnoremap <C-j> <C-e>
:nnoremap <C-k> <C-y>
:nmap <F2> :TagbarToggle<CR>
:nmap <F3> zf%
:nmap <F6> :setlocal spell!<CR>
:noremap <Home> ^
:map <C-b> :NERDTreeToggle<CR>
:map <F12> :YcmCompleter GoTo<CR>
:map <C-F12> :YcmCompleter GoToDefinition<CR>
:map <leader>t :YcmCompleter GetType<CR>
:map <leader>f :YcmCompleter FixIt<CR>

:map <ESC>Od <C-Left>
:map <ESC>Oc <C-Right>
:imap <ESC>Od <C-Left>
:imap <ESC>Oc <C-Right>

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
" Plugin 'vim-scripts/Conque-GDB'
Plugin 'grailbio/bazel-compilation-database'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'tommcdo/vim-exchange'

call vundle#end()
filetype plugin indent on

" ctrlp
let g:ctrlp_by_filename=1                                               " By default, search by filename
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:30'   " This is the default window, but with more results (10 -> 30)
let g:ctrlp_working_path_mode = 'a'                                     " Open in the current file's directory, unless it is a subdirectory of the cwd.
" let g:ctrlp_custom_ignore = {}    " TODO: this
let g:ctrlp_extensions = ['tag']                                        " Enable ctags search
let g:ctrlp_lazy_update = 50                                           " Search only after typing has stopped
" let g:ctrlp_user_command = 'git ls-files $(git -C %s rev-parse --show-toplevel) || ag -l --nocolor -g "" %s'
let g:ctrlp_user_command = {
    \ 'types': {
      \ 1: ['.git', 'git ls-files $(git -C %s rev-parse --show-toplevel)'],
    \ },
    \ 'fallback': 'ag -l --nocolor -g "" %s'
    \ }
" let g:ctrlp_user_command = 'git ls-files $(git -C %s rev-parse --show-toplevel)'
" let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'

" YouCompleteMe
"let g:ycm_autoclose_preview_window_after_insertion=1                   " Close the preview window after we leave insert mode.
let g:ycm_confirm_extra_conf=0                                          " Don't ask whether to load .ycm_extra_conf.py
"let g:ycm_key_invoke_completion = '<C-N>'
let g:ycm_key_list_stop_completion = ['<C-y>', '<Enter>']
let g:ycm_seed_identifiers_with_syntax = 1

" Tagbar
let g:tagbar_autofocus=1                                                " Automatically focus tagbar when it is opened
let g:tagbar_sort=0                                                     " Don't sort the tags by name

" Airline
let g:airline_section_a = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_section_error = ''
let g:airline_section_warning = ''
