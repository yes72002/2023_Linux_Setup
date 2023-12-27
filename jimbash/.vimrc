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
try
  colorscheme gruvbox
catch
  colorscheme wombat256mod
endtry
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

"----------------
" plug
"----------------
" vim-plug
call plug#begin()
" css color
" Plug 'ap/vim-css-color'
" airline
Plug 'vim-airline/vim-airline'
Plug 'powerline/fonts'
" nerdtree
Plug 'preservim/nerdtree'
" ctrlp
Plug 'ctrlpvim/ctrlp.vim'
" emmet
" Plug 'mattn/emmet-vim'
" surround
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-repeat'
" Plug 'tomtom/tcomment_vim'
" snipmate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
" tagbar
Plug 'preservim/tagbar'
Plug 'universal-ctags/ctags'
" ack
Plug 'mileszs/ack.vim'

nmap <Leader><Leader> :call <SID>SynStack()<CR>

function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

call plug#end()


" plugin airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" plugin nerdtree
nnoremap <silent> <F2> :NERDTreeToggle<Enter>
let NERDTreeMinimalUI = 1
let NERDTreeChDirMode = 1
let g:NERDTreeMouseMode=3
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" plugin ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" plugin emmet
" autocmd FileType html,css imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall

" plugin tagbar
" let Tagbar_Ctags_Cmd = 'C:\Program Files (x86)\Vim\ctags58\ctags.exe'
let g:tagbar_ctags_bin = 'C:\Program Files (x86)\Vim\ctags58\ctags.exe'
nnoremap <F12> :TagbarToggle<Enter>

" plugin ack
nnoremap <Leader>a :Ack<Space>
