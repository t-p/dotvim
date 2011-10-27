
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-pastie'
Bundle 'tpope/vim-haml'
Bundle 'vim-scripts/jQuery'
Bundle 'vim-scripts/vim-json-bundle'
Bundle 'sjbach/lusty'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'wincent/Command-T'
Bundle 'chrismetcalf/vim-taglist'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-ruby/vim-ruby'
Bundle 'pangloss/vim-javascript'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" Bundle 'rails.vim'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" ...
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

filetype on
filetype plugin indent on

set background=dark
" colorscheme mustang
colorscheme lucius
set t_Co=256
set timeoutlen=1000

let   mapleader = ","
let g:mapleader = ","

set nocompatible
set modelines=0

set nu
set nowrap

set mouse=a       " use Mouse
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
"set undofile

set foldmethod=syntax
set foldlevelstart=20
set foldnestmax=10
" save folds on exit
"autocmd BufWinLeave * mkview
"autocmd BufWinEnter * silent loadview
" ===================
" switch folding mode
" ===================
function! ToggleFoldingMode()
  if &foldmethod == 'syntax'
    set foldmethod=manual
    echo "Manual folding"
  else 
    set foldmethod=syntax
    echo "Syntax folding"
  endif 
endfunction
nmap <silent> <F5> <ESC>:call ToggleFoldingMode()<cr>

set pastetoggle=<F2> " set the paste toggle key

function! ToggleNuMode() 
  if &rnu
    set nu 
  else 
    set rnu 
  endif 
endfunction
nmap <silent> <F3> <Esc>:call ToggleNuMode()<cr>

nnoremap ; :

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)
map <leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" Command-T mapping and options
nmap <silent> <Leader>n :CommandT<CR>
nmap <silent> <Leader>b :CommandTBuffer<CR>
let g:CommandTMaxHeight=15
let g:CommandTMatchWindowReverse=1
:set wildignore+="coverage/**"
nnoremap j gj
nnoremap k gk

" ===================
" windows / splits
" ===================
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" fold tag
nnoremap <leader>ft Vatzf 
" surround word
map <leader>s ysiw
" save and close all
map <leader>q :wqa!
"
map Y y$

" change tab
map th :tabprev<CR>
map tl :tabnext<CR>
map tc :tabclose<CR>

" ===================
" plugins
" =================== 

" NerdTree
autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd h
autocmd BufEnter * NERDTreeMirror
autocmd BufNew   * wincmd h
map <leader>t :NERDTree<cr>
map <leader>tm :NERDTreeMirror<cr>
let NERDTreeWinPos="right"
let NERDTreeWinSize=28
let NERDTreeShowHidden=0
let NERDTreeMouseMode=2


"lustyJuggler
map <leader>b :LustyJuggler<cr>
" let g:LustyJugglerShowKeys = 'a'   "(for alpha characters)
"
" TagList
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F6> :TlistToggle<cr>
"nnoremap <silent> <F8> :TlistToggle<CR>
"
" ri Dokumentation
nnoremap  ,r :call ri#OpenSearchPrompt(0)<cr> " horizontal split
nnoremap  ,RI :call ri#OpenSearchPrompt(1)<cr> " vertical split
nnoremap  ,K :call ri#LookupNameUnderCursor()<cr> " keyword lookup 

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
  
