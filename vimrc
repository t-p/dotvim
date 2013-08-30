filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" original repos on github
" Bundle 'tpope/vim-rails'
" Bundle 'tpope/vim-surround'
" Bundle 'tpope/vim-pastie'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-dispatch'
Bundle 'vim-scripts/jQuery'
Bundle 'vim-scripts/vim-json-bundle'
Bundle 'vim-scripts/taglist.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'scrooloose/syntastic'
" http://robots.thoughtbot.com/post/55273519322/running-specs-from-vim-sent-to-tmux-via-tslime
Bundle 'thoughtbot/vim-rspec'
Bundle 'jgdavey/tslime.vim'
" Bundle 'wincent/Command-T'
Bundle 'kien/ctrlp.vim'
Bundle 'chrismetcalf/vim-taglist'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-ruby/vim-ruby'
Bundle 'pangloss/vim-javascript'
Bundle 'pbrisbin/html-template-syntax'
Bundle 'airblade/vim-gitgutter'
" colorscheme
Bundle 'chriskempson/base16-vim'
"
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

syntax enable

if !has("gui_running")
    set t_Co=256
endif
set background=dark
" colorscheme base16-default
colorscheme Custom-Night
" colorscheme mustang
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
set clipboard=unnamed

set encoding=utf-8
set scrolloff=3
set autoindent
set autoread      " reload files when changed on disk, i.e. via `git checkout
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

" Set the Ruby filetype for a number of common Ruby files without .rb
autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,config.ru,*.rake} set filetype=ruby
" Treat JSON files like JavaScript
autocmd BufNewFile,BufRead *.json set filetype=javascript
" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" statusline
set statusline=%f\ %m\ %r
set statusline+=%{fugitive#statusline()}
set statusline+=\ Line:%l/%L[%p%%]
set statusline+=\ Col:%v
set statusline+=\ Buf:#%n
"set statusline=[%F%m%r%h%w]
"set statusline+=\ %{fugitive#statusline()}
"set statusline+=\ [line\ %l\/%L]
"set statusline+=\ %{v:register}
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
  if(&rnu == 1)
    set nornu
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
" nmap <silent> <Leader>n :CommandT<CR>
nmap <silent> <Leader>m :CommandTBuffer<CR>
let g:CommandTMaxHeight=15
let g:CommandTMatchWindowReverse=1
" :set wildignore+="coverage/**"
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

" Support resizing in tmux
if exists('$TMUX')
  set ttymouse=xterm2
endif

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" ===================
" plugins
" ===================

" NerdTree
map <leader>t :NERDTree<cr>
map <leader>tm :NERDTreeMirror<cr>
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeWinPos="right"
let NERDTreeWinSize=32
let NERDTreeShowHidden=0
let NERDTreeMouseMode=2

" TagList
map <Leader>b :TlistToggle<CR>
"let Tlist_Ctags_Cmd = "/usr/bin/ctags-exuberant"
"let Tlist_WinWidth = 50
"map <F6> :TlistToggle<cr>
"map <Leader>rt :!ctags-exuberant --extra=+f --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*<CR><CR>
"map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*<CR><CR>
"nnoremap <silent> <F8> :TlistToggle<CR>
"
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
" RSpec.vim mappings
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>d :call RunCurrentSpecFile()<CR>
map <Leader>f :call RunLastSpec()<CR>


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
