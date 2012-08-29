"# Color picker for the mac.
"# http://www.robinwood.com/Catalog/Technical/OtherTuts/MacColorPicker/MacColorPicker.html

call pathogen#infect()
" Get Backspace to work
set backspace=indent,eol,start
syntax on
"filetype plugin indent on

" This seams to make me resize the windows splits withe my mouse
set ttymouse=xterm2

" disable vi compatibility (emulation of old bugs)
set nocompatible
set modelines=0

" Create the backup directory if it doesn't exists.
if !isdirectory('/tmp/vim_backup')
  silent !mkdir -p ~/tmp/vim_backup
endif
set backupdir=~/tmp/vim_backup/
set directory=~/tmp/vim_backup/

" Turn off the bell
"set vb
"set vb t_vb=''."
set visualbell


" File autocompleat
set wildmode=list:longest
set wildmenu

" Give you some typing space
set scrolloff=5

if has("autocmd")
	" Enable filetype detection
	filetype plugin indent on

	" Restore cursor position
	autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif
endif
if &t_Co > 2 || has("gui_running")
endif



" set relativenumber " sets the line numbers relitev to the cursor
"set undofile   " If you vant to be able to undo after closing a file uncomment this

" turn line numbers on
set number

" set cursorline
set laststatus=2
set ruler
set ttyfast
set enc=utf-8
set fenc=utf-8
set encoding=utf-8
set termencoding=utf-8
" use indentation of previous line
set autoindent
set showmode
set showcmd
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=2        " tab width is 2 spaces
set shiftwidth=2     " indent also with 4 spaces
set softtabstop=2    " Soft tabs
set expandtab        " expand tabs to spaces

" open NERDTree with the folder for the current file.
"au VimEnter * NERDTreeFind


function! NTFinderP()
    "" Check if NERDTree is open
    if exists("t:NERDTreeBufName")
        let s:ntree = bufwinnr(t:NERDTreeBufName)
    else
        let s:ntree = -1
    endif
    if (s:ntree != -1)
        "" If NERDTree is open, close it.
        :NERDTreeClose
    else
        "" Try to open a :Rtree for the rails project
        if exists(":Rtree")
            "" Open Rtree (using rails plugin, it opens in project dir)
            :Rtree
        else
            "" Open NERDTree in the file path
            :NERDTreeFind
        endif
    endif
endfunction

" Toggles NERDTree
map <silent> <F2> :call NTFinderP()<CR>

"#############################
"# Search
"#############################
let mapleader = ","

"# nnoremap / /\v
"# vnoremap / /\v

" Search as you type
set ignorecase
set smartcase
set gdefault
set incsearch
"#set showmatch
set hlsearch

nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"# autoindent and textwraping
set nowrap
set textwidth=79
set formatoptions=qn1
"# set formatoptions=n1croql "# the old walue.
"# set formatoptions=n1coql  "# the old value with out the auto commenting.

" set colorcolumn=120

"# show invisable chars like TextMate
" set list
set listchars=tab:▸\ ,eol:¬

""" Toggles NERDTree
"map <silent> <F1> :call NTFinderP()<CR>

" Always show tabs
set showtabline=2

" How open behaves
set switchbuf=usetab,newtab


"# disable the arrow keys
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" nnoremap j gj
" nnoremap k gk

" 256 colors pleas ;)
set t_Co=256

" # colors
" colorscheme darkblue
 colorscheme vibrantink
" colorscheme delek
" colorscheme desert
" colorscheme new/256-jungle

"#####################################################
"# My verry on custom things
"#
"# called with , + ?
"####################################################

"# Yank/Copy to the end of the line.
map Y y$
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>rc <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>rr :source $MYVIMRC<cr>

inoremap jj <ESC>
nnoremap <leader>i <C-w>v<C-w>l "# Press ,i to go to a vertical split and start working ther

" Run unittests for the current file
nnoremap <leader>T :w<cr> :!clear; ruby -Itest %<cr>


"# map C-( hjkl ) to move bettwen splits
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>d :b#<bar>bd#<CR>

nnoremap <leader>t :tab
nnoremap <leader>m :tabn<cr>




" Enable Mouse / This desables the selections ogf text withe the mouse
set mouse=a

"tab ball

set tabpagemax=30


" single character insert
nmap <Space> i_<Esc>r


"# Getting Copy Paste to work on the mac iTerm2
set clipboard=unnamed

"# Set the syntax highlighting for the Gemfile
autocmd BufNewFile,BufRead Gemfile set filetype=ruby

"# Try to make it faster
syn sync fromstart

" tap indent movement (use mark `m' for cursor position)
map <S-Tab>  mm<`m:<C-U>exec "normal ".&shiftwidth."h"<CR>mmgv`m
map <Tab>    mm>`m:<C-U>exec "normal ".&shiftwidth."l"<CR>mmgv`m


"# Higlite trailing whitespace, except in insert mode
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"# Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

