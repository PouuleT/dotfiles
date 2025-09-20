" UTF-8 powa
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/AutoComplPop'
Plug 'msanders/snipmate.vim'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-unimpaired'
Plug 'robbyrussell/oh-my-zsh'
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rails'
Plug 'fatih/vim-go'
Plug 'tomasr/molokai'
Plug 'itchyny/lightline.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'rust-lang/rust.vim'
Plug 'adelarsq/vim-matchit'
Plug 'racer-rust/vim-racer'
Plug 'rhysd/vim-clang-format'
Plug 'ziglang/zig.vim'
Plug 'dense-analysis/ale'

call plug#end()

" Enable syntax highlighting
syntax enable
filetype plugin indent on

" Change mapleader
let mapleader=","

" Enable ':Man vim'
runtime ftplugin/man.vim

set ls=2

" No mouse
set mouse=

set showmode    " show mode (insert or other)
" set backspace=indent,eol,start "activation de la touche backspace
set autoindent  " autoindentation active
set showmatch   " match : highlight matching parentehis / brackets ,...
set ruler       " show cursor coordinates
set hlsearch    " highlight colorisation

set nobackup    " no backup file

set expandtab  "convert tabs into spaces
set directory=/tmp " directory for swap files

" Easy qwerty
nmap ; :
vnoremap ; :

" Change jk to quit insert mode
inoremap jk <ESC>
" Change the timeout duration
set timeoutlen=500

" Navigate through tab
nnoremap gl    :tabnext<CR>
nnoremap gh    :tabprev<CR>

" Enable pasteMode
set pastetoggle=<F12>

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Better yank (yank until the end of the line)
noremap Y y$

" Disable highlighting when searching by hitting Enter
nnoremap <cr> :noh<CR><CR>:<backspace>

" Number of colors
set t_Co=256
colorscheme molokai

" Options for the NERDTree
let NERDTreeChDirMode=2
let NERDTreeShowHidden=1
let NERDTreeDirArrows=0
let NERDTreeShowBookmarks=1

" Open NERDTree Tabs quick toogle
nmap <leader>t :NERDTreeTabsToggle<CR>
" Open NERTree if vim starts with no file
autocmd vimenter * if !argc() | let g:nerdtree_tabs_open_on_console_startup=1 | endif

" Activate or desactivate the line numbers
nmap <leader>n :set nu! nu?<CR>

" Highlight CurrentLine by default
set cursorline

" Highlight lines and columns
hi CursorLine cterm=NONE ctermbg=234
hi CursorColumn cterm=NONE ctermbg=234

" Add mappings to toogle set cursorline and cursorcolumn
nmap <leader>c :set cursorcolumn! cursorcolumn?<CR>
nmap <leader>l :set cursorline! cursorline?<CR>

" Options for EasyAlign in Visual Mode
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" Search visual selection
vnoremap <leader>* "yy/<C-R>y<CR>
vnoremap <leader># "yy?<C-R>y<CR>

" To avoid having the cursor on the top of the screen
set scrolloff=10

if !exists("Vimrc_update()")
  function! Viimrc_update()
    source $MYVIMRC
    echom 'vimrc reloaded'
  endfunction
endif

" <space> toggles folds opened and closed
nnoremap <space> za

" <space> in visual mode creates a fold over the marked range
vnoremap <space> zf

" Jump a line when opening a parenthesis
let delimitMate_expand_cr = 2

" Learn VIM the hard way
" Use arrows for something useful instead (resize splits)
map <Left>  <C-W><
map <Right> <C-W>>
map <Up>    <C-W>+
map <Down>  <C-W>-

cnoreabbrev H helpgrep

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ }
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files'],
        \ 2: ['.svn', 'cd %s && svn ls -R'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Enable completion
set wildmenu

" Highlight spaces a the end of a line
highlight ExtraWhitespace term=standout ctermbg=7
au BufNewFile,BufRead * :match ExtraWhitespace /\s\+$/

" Highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" To reformat text, Q => gq
map Q gq

" Paste like a boss
vnoremap <leader>y "yy
vnoremap <leader>p "yp

" Moves between splits the easy way
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

inoremap <Nul> <C-x><C-o>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

noremap <leader>s :ALELint<CR>

autocmd BufNewFile,BufRead OTKfile set filetype=sh

" Ale
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_insert_leave = 0
let g:ale_fix_on_save = 0
let g:ale_lint_on_save = 0
