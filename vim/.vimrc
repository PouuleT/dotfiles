" UTF-8 powa
set encoding=utf-8
set fileencoding=utf-8

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'msanders/snipmate.vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'tomasr/molokai'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'

Plug 'junegunn/fzf' , { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'nvim-tree/nvim-tree.lua'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'MeanderingProgrammer/render-markdown.nvim'

Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'nvim-lua/plenary.nvim'
Plug 'hrsh7th/nvim-cmp'

Plug 'olimorris/codecompanion.nvim'

Plug 'rust-lang/rust.vim',      { 'for': 'rust' }
Plug 'racer-rust/vim-racer',    { 'for': 'rust' }
Plug 'ziglang/zig.vim',         { 'for': 'zig' }
Plug 'rhysd/vim-clang-format',  { 'for': 'c' }
Plug 'fatih/vim-go',            { 'for': 'go' }
Plug 'tpope/vim-rails',         { 'for': 'rails' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

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
set autoindent  " autoindentation active
set showmatch   " match : highlight matching parentehis / brackets ,...
set ruler       " show cursor coordinates
set hlsearch    " highlight colorisation

set nobackup    " no backup file

set expandtab   "convert tabs into spaces
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

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Better yank (yank until the end of the line)
noremap Y y$

" Disable highlighting when searching by hitting Enter
nnoremap <cr> :noh<CR><CR>:<backspace>

colorscheme molokai

" Open NERDTree Tabs quick toogle
nmap <leader>t :NvimTreeToggle<CR>

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

" Search visual selection
vnoremap <leader>* "yy/<C-R>y<CR>
vnoremap <leader># "yy?<C-R>y<CR>

" To avoid having the cursor on the top of the screen
set scrolloff=10

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

" More natural splits
set splitright
set splitbelow

cnoreabbrev H helpgrep

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Enable completion
set wildmenu

" Highlight spaces a the end of a line
highlight ExtraWhitespace ctermfg=9 ctermbg=9 guifg=Red guibg=Red
au BufNewFile,BufRead * :match ExtraWhitespace /\s\+$/

" Highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" To reformat text, Q => gq
map Q gq

" Better paste
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

" Ale
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 0
let g:ale_echo_msg_format = '[%linter%] %code: %%s [%severity%]'
let g:ale_lint_on_insert_leave = 0
let g:ale_fix_on_save = 0
let g:ale_lint_on_save = 0
nnoremap gd :ALEGoToDefinition<CR>
noremap <leader>s :ALELint<CR>

" Move between errors
nmap ]e :ALENext<cr>
nmap [e :ALEPrevious<cr>

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <silent> <C-n> :Buffers<CR>
