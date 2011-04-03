
filetype off

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

filetype on
filetype plugin indent on

set background=dark
" colorscheme mustang
colorscheme lucius
set t_Co=256
set timeoutlen=300

let   mapleader = ","
let g:mapleader = ","

set nocompatible
set modelines=0

set nu
set nowrap

set tabstop=2  	  " Tabs are 2 spaces
set shiftwidth=2  " Tabs under smart indent
set softtabstop=2
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set noswapfile
set cpoptions+=$

" search config
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
" clear search
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrnl
"set colorcolumn=85 

"set relativenumber first in vim 7.3
"set undofile

set pastetoggle=<F2> " set the paste toggle key

nnoremap ; :
"nnoremap : ;

" nnoremap <leader>w <C-w>v<C-w>l

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)
map <leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" ===================
" windows / splits
" ===================
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"map <C-n> <C-w><
"map <C-m> <C-w>>

" fold tag
nnoremap <leader>ft Vatzf 

" ===================
" plugins
" =================== 

" NerdTree
map <leader>t :NERDTree<cr>
let NERDTreeWinPos="right"
let NERDTreeWinSize=22
let NERDTreeShowHidden=1

"lustyJuggler
map <leader>b :LustyJuggler<cr>
" let g:LustyJugglerShowKeys = 'a'   "(for alpha characters)

if has("autocmd")
  " Enable filetype detection
  " filetype plugin indent on

  " Restore cursor position
  autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif
endif

if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
endif
  
