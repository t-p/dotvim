filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" original repos on github
" Bundle 'tpope/vim-rails'
" Bundle 'tpope/vim-surround'
" Bundle 'tpope/vim-pastie'
" Bundle 'chrismetcalf/vim-taglist'
" Bundle 'Shougo/neocomplcache'
" Bundle 'msanders/snipmate.vim'
" Bundle 'ervandew/supertab'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" Bundle 'rails.vim'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" ...
"
Bundle 'tpope/vim-fugitive'
Bundle 'Townk/vim-autoclose'
Bundle 'scrooloose/nerdtree'
Bundle 'wincent/Command-T'
Bundle 'danchoi/ri.vim'
"
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
" Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'vim-scripts/jQuery'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-scripts/vim-json-bundle'
"  Brief help
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
" colorscheme lucius
colorscheme Tomorrow-Night
" colorscheme Tomorrow-Night-Eighties
" colorscheme Tomorrow-Night-Bright
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

set clipboard=unnamedplus

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
" swtich to ack-grep
set grepprg=ack-grep

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

" statusline
set statusline=[%F%m%r%h%w]
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ [line\ %l\/%L]
set statusline+=\ %{v:register}
"set statusline+=[%{strlen(&fenc)?&fenc:&enc}]
"set statusline+=%{rvm#statusline()}

set wrap
set textwidth=79
set formatoptions=qrnl
"set colorcolumn=85
"set undofile

set foldmethod=syntax
set foldlevelstart=20
set foldnestmax=10

" autocmd BufRead,BufNewFile *.haml setlocal foldmethod=syntax
" let javaScript_fold=1
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
" -------------
" neocomplcache
" -------------
" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
"" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1
"" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Command-T mapping and options
nmap <silent> <Leader>n :CommandT<CR>
nmap <silent> <Leader>m :CommandTBuffer<CR>
let g:CommandTMaxHeight=15
let g:CommandTMatchWindowReverse=1
:set wildignore+="coverage/**"
nnoremap j gj
nnoremap k gk

" save folding
set viewoptions=folds
autocmd BufWinLeave * mkview
" autocmd BufWinEnter * silent loadview

" automatically remove trailing whitespace before write
function! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  if line("'Z") != line(".")
    echo "Stripped whitespace\n"
  endif
  normal `Z
endfunction
autocmd BufWritePre COMMIT_EDITMSG,.vimrc,*.js,*.rb,*.haml :call StripTrailingWhitespace()

" tab completion
" function! CleverTab()
"    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
"       return "\<Tab>"
"    else
"       return "\<C-N>"
"    endif
" endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
set wildmode=longest,list:longest
set completeopt=menu,preview

" fold tag
nnoremap <leader>ft Vatzf
" ===================
" windows / splits
" ===================
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" surround word
map <leader>s ysiw
" save and close all
map <leader>q :qa
"
map Y y$
map <leader>y "+y

" change tab
map th :tabprev<CR>
map tl :tabnext<CR>
map tc :tabclose<CR>

" ===================
" plugins
" ===================

" NerdTree
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd h
" autocmd BufEnter * NERDTreeMirror
" autocmd BufNew   * wincmd h
map <leader>t :NERDTree<cr>
map <leader>tm :NERDTreeMirror<cr>
let NERDTreeWinPos="right"
let NERDTreeWinSize=32
let NERDTreeShowHidden=0
let NERDTreeMouseMode=2

" lustyJuggler
" map <leader>b :LustyJuggler<cr>
" let g:LustyJugglerShowKeys = 'a'   "(for alpha characters)
"
" TagList
let Tlist_Ctags_Cmd = "/usr/bin/ctags-exuberant"
let Tlist_WinWidth = 50
map <F6> :TlistToggle<cr>
map <Leader>rt :!ctags-exuberant --extra=+f --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*<CR><CR>
"map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*<CR><CR>
"nnoremap <silent> <F8> :TlistToggle<CR>
"
" ri Dokumentation
nnoremap  ,r :call ri#OpenSearchPrompt(1)<cr> " vertical split
nnoremap  ,e :call ri#LookupNameUnderCursor()<cr> " keyword lookup

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
