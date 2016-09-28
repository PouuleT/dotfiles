" UTF-8 powa
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

call plug#begin('~/.vim/plugged')

Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/syntastic'
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
Plug 'tpope/vim-rails'
Plug 'fatih/vim-go'
Plug 'tomasr/molokai'

" Add plugins to &runtimepath
call plug#end()

syntax on
filetype plugin indent on

set ls=2
set mouse=

set showmode    " affiche le mode (insert ou autre)
set backspace=indent,eol,start "activation de la touche backspace
set autoindent  " autoindentation active
set showmatch   " match : highlight matching parentehis / brackets ,...
set ruler       " affiche la position du curseur en bas à droite
set hlsearch    " colorisation de la recherche

set nobackup    " on ne crÃ©e pas de fichier de sauvegarde

set ts=2    "taille des tabulations
set sw=2    "taille des indentations
set expandtab  "converti les tab en espaces
set directory=/tmp

" Change mapleader
let mapleader=","

" Easy qwerty
nmap ; :
vnoremap ; :

" Change jk to quit insert mode
inoremap jk <ESC>
" Change the timeout length
set timeoutlen=500

" Change the title depending on the terminal
let &titlestring = expand("%:t")
if &term == "screen" || &term == "xterm"
    set t_ts=^[k
    set t_fs=^[\
    let &titleold="bash"
endif
if &term == "screen" || &term == "xterm"
    set title
endif

" navigate through tab
nnoremap gl    :tabnext<CR>
nnoremap gh    :tabprev<CR>

" enable pasteMode
set pastetoggle=<F12>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Better yank (yank until the end of the line)
noremap Y y$

" to disable highlighting when searching by hitting Enter
nnoremap <cr> :noh<CR><CR>:<backspace>

set autochdir
set t_Co=256
colorscheme molokai

"Options for the NERDTree
let NERDTreeChDirMode=2
let NERDTreeShowHidden=1
let NERDTreeDirArrows=0
let NERDTreeShowBookmarks=1

" Open NERDTree Tabs quick toogle
nmap <leader>t :NERDTreeTabsToggle<CR>
" Activate or desactivate the line numbers
nmap <leader>n :set nu! nu?<CR>
" add mappings to toogle set cursorline and cursorcolumn
nmap <leader>c :set cursorcolumn! cursorcolumn?<CR>
nmap <leader>l :set cursorline! cursorline?<CR>

" Open NERTree if vim starts with no file
autocmd vimenter * if !argc() | let g:nerdtree_tabs_open_on_console_startup=1 | endif

" Options for EasyAlign in Visual Mode
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" Search visual selection
vnoremap <leader>* "yy/<C-R>y<CR>
vnoremap <leader># "yy?<C-R>y<CR>

" to avoid having the cursor on the top of the screen
set scrolloff=10

" Source $MYVIMRC on config change
" autocmd config group
augroup config
    " Clear the autocmd
    autocmd!
    " Source the vimrc on write
    autocmd bufwritepost .vimrc call Viimrc_update()
augroup END

if !exists("*Vimrc_update()")
  function! Viimrc_update()
    source $MYVIMRC
    echom 'vimrc reloaded'
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
  endfunction
endif

" <space> toggles folds opened and closed
nnoremap <space> za

" <space> in visual mode creates a fold over the marked range
vnoremap <space> zf

" easy open vimrc in tab
nmap <leader>v :tabedit $MYVIMRC<CR>

" highlight CurrentLine by default
set cursorline

" easy find sub in file
noremap <leader>f :! grep ^sub %<CR>
                                       " Settings for highlighting lines and columns
hi CursorLine cterm=NONE ctermbg=234
hi CursorColumn cterm=NONE ctermbg=234

" To jump a line when opening a parenthesis
let delimitMate_expand_cr = 2

" Learn VIM the hard way
map <Left>  <NOP>
map <Right> <NOP>
map <Up>    <NOP>
map <Down>  <NOP>

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

" Menu completion
set wildmenu

" move the current line up or down with the Ctrl-arrow keys
nmap <C-Down> :<C-u>move .+1<CR>
nmap <C-Up> :<C-u>move .-2<CR>
imap <C-Down> <C-o>:<C-u>move .+1<CR>
imap <C-Up> <C-o>:<C-u>move .-2<CR>
vmap <C-Down> :move '>+1<CR>gv
vmap <C-Up> :move '<-2<CR>gv

" Highlight spaces a the end of a line
highlight ExtraWhitespace term=standout ctermbg=7
au BufNewFile,BufRead * :match ExtraWhitespace /\s\+$/

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Choose the first spelling correction
nnoremap z- 1z=

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

let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_ruby_rubocop_args = "-R"
let g:syntastic_go_checkers = ['go', 'gofmt', 'golint' , 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

noremap <leader>e :Errors<CR>
noremap <leader>s :SyntasticCheck<CR>

" Go vim
" Go vim - :help go-settings
let g:go_fmt_command = "goimports"
let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

au FileType go nmap tgd <Plug>(go-def-tab)

inoremap <Nul> <C-x><C-o>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Minibufexpl
hi MBEVisibleActive guifg=#A6DB29 guibg=fg
hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
hi MBEVisibleChanged guifg=#F1266F guibg=fg
hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
hi MBEChanged guifg=#CD5907 guibg=fg
hi MBENormal guifg=#808080 guibg=fg

noremap <TAB>   :MBEbn<CR>
noremap <S-TAB> :MBEbp<CR>
nmap <leader>m :MBEToggle<CR>
