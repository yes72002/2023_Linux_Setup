"----------------
" function
"----------------
set clipboard=unnamed
set noswapfile
set encoding=UTF-8
set backspace=indent,eol,start

"----------------
" appearance
"----------------
set number
set ruler
set wrap
set linebreak
set showmode
set showcmd
set cursorline
set smartcase
set nolist

"----------------
" scroll
"----------------
set scrolloff=3
set hlsearch
set ignorecase
set incsearch

"----------------
" tab and sapce
"----------------
set softtabstop=2
set shiftwidth=2
set expandtab

"----------------
"tab
"----------------
set showtabline=2
set splitbelow
set splitright

"----------------
" color
"----------------
syntax on
" colorscheme default
" colorscheme darkblue
set t_Co=256
set t_ut=
set mouse=a

"----------------
" filetype
"----------------
filetype on
filetype indent on
filetype plugin on
set autoindent
set smartindent

"----------------
" key mapping
"----------------
vmap <Tab> >>
vmap <S-Tab> <
nmap <Enter> o
" :imap jj <Esc>
" let mapleader = ","
inoremap ( ()<Esc>i
" inoremap { {}<Esc>i
inoremap { {}<Esc>i<CR><Esc><BS>O
" vmap <C-w>

"----------------
" autocommand
"----------------
" display the cursor on the current window
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
" delete blank of line tails
autocmd BufWritePre * :%s/\s\+$//e
" F5 execute file
if executable("ruby")
  autocmd BufRead,BufNewFile *.rb noremap <F5> :% w !ruby -w<Enter>
else
  autocmd BufRead,BufNewFile *.rb noremap <F5> :% w !echo "you need to install Ruby first!"
endif
autocmd BufRead,BufNewFile *.js noremap <F5> :% w !node<Enter>
" configuration takes effect immediately
autocmd BufWritePost $MYVIMRC source $MYVIMRC
