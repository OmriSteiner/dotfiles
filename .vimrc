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
set updatetime=300      " How often will the swap file be written to disk, ALSO - how long until YCM hover documentation shows up
set colorcolumn=80      " color the 80th column, as a ruler.
set scrolloff=5         " Scroll before you reach the end of the screen.
set directory=~/.vim/swapfiles// " Change the directory for swapfiles
set mouse=              " Disable mouse support. This is enabled by default in new versions of nvim
syntax on               " Enable syntax highlighting (this is off by default in macOS)
highlight ColorColumn ctermbg=darkgrey
set ruler               " Show the cursor position (line, column)
highlight TabLineFill ctermfg=black
highlight TabLine ctermfg=white ctermbg=black
highlight TabLineSel ctermfg=black ctermbg=white

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" Bindings
let mapleader = ","
:nnoremap <C-j> <C-e>
:nnoremap <C-k> <C-y>
:nmap <F2> :CocOutline<CR>
:nmap <F3> zf%
:nmap <F6> :setlocal spell!<CR>
:noremap <Home> ^
:map <C-b> :NERDTreeToggle<CR>
:map <leader>h :CocCommand clangd.switchSourceHeader<CR>
command Run CocCommand rust-analyzer.run
:nmap <leader>a :CocCommand<CR>
:vmap <leader>a :CocCommand<CR>
:nmap <leader>d :CocDiag<CR>

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
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
"Plugin 'vim-airline/vim-airline'
Plugin 'grailbio/bazel-compilation-database'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'tommcdo/vim-exchange'
Plugin 'neoclide/coc.nvim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'github/copilot.vim'
Plugin 'antoinemadec/coc-fzf'
Plugin 'knsh14/vim-github-link'
Plugin 'zootedb0t/citruszest.nvim'

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

" Tagbar
let g:tagbar_autofocus=1                                                " Automatically focus tagbar when it is opened
let g:tagbar_sort=0                                                     " Don't sort the tags by name

" Airline
let g:airline_section_a = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_section_error = ''
let g:airline_section_warning = ''

" Copilot
imap <silent><script><expr> <leader>f copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true


" coc
let g:coc_disable_startup_warning = 1

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <c-w>gd :call CocAction('jumpDefinition', 'tab drop')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd CursorHold * silent call CocActionAsync('highlight')
highlight CocHighlightText ctermbg=darkgreen

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Auto-fixes
nmap <leader>f  <Plug>(coc-codeaction-selected)<CR>

" :Format command
command! -nargs=0 Format :call CocActionAsync('format')
nmap <leader>w :Format<CR>:w<CR>

" fzf
nmap <C-P> :GFiles<CR>
noremap <C-F> :Rg 
let $FZF_DEFAULT_OPTS="--preview-window 'right:57%' --preview 'bat --style=numbers --line-range :300 {}'
    \ --bind ctrl-y:preview-up,ctrl-e:preview-down,ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down"

" Fix indentation for yaml files
autocmd FileType yaml set indentkeys-=0#

colorscheme citruszest

vmap <leader>y "+y
