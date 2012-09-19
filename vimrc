" Color picker for the mac.
" http://www.robinwood.com/Catalog/Technical/OtherTuts/MacColorPicker/MacColorPicker.html

" disable vi compatibility (emulation of old bugs)
set nocompatible

call pathogen#infect()
" Get Backspace to work
set backspace=indent,eol,start
syntax on
"filetype plugin indent on

" This seams to make me resize the windows splits withe my mouse
set ttymouse=xterm2

set modelines=0

" Create the backup directory if it doesn't exists.
if !isdirectory('/tmp/vim_backup')
  silent !mkdir -p ~/tmp/vim_backup
endif
set backupdir=~/tmp/vim_backup/
set directory=~/tmp/vim_backup/

" Copy backupfiles when editing crontab files
au BufEnter crontab.* setl backupcopy=yes

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

" Search
let mapleader = ","

" nnoremap / /\v
" vnoremap / /\v

" Search as you type
set ignorecase
set smartcase
set gdefault
set incsearch
" set showmatch
set hlsearch

nnoremap <leader><space> :noh<cr>

" autoindent and textwraping
set nowrap
set textwidth=79
set formatoptions=qn1
" set formatoptions=n1croql " the old walue.
" set formatoptions=n1coql  " the old value with out the auto commenting.

" set colorcolumn=120

" show invisable chars like TextMate
" set list
set listchars=tab:▸\ ,eol:¬

""" Toggles NERDTree
"map <silent> <F1> :call NTFinderP()<CR>

" Always show tabs
set showtabline=2

" How open behaves
set switchbuf=usetab,newtab


" disable the arrow keys
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

" Yank/Copy to the end of the line.
map Y y$
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>rc <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>rr :source $MYVIMRC<cr>

inoremap jj <ESC>

" Press ,i to go to a vertical split and start working ther
nnoremap <leader><bar> <C-w>v<C-w>l
nnoremap <leader>_ <C-w>s<C-w>j

" Run unittests for the current file
nnoremap <leader>T :w<cr> :!clear; ruby -Itest %<cr>


" map C-( hjkl ) to move bettwen splits
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>d :Bclose<CR>

" Switch between Vim window splits easily
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

" Resizing windows
map - <C-W>-
map + <C-W>+

" Use this if you want to make the hidden windows colaps to nothing.
" set wmh=0

" If you want to maximize the window after change.
"map <C-H> <C-W>h<C-W>_
"map <C-J> <C-W>j<C-W>_
"map <C-K> <C-W>k<C-W>_
"map <C-L> <C-W>l<C-W>_

" Enable window commands in insert mode
imap <C-w> <C-o><C-w>

" Enable Mouse / This desables the selections ogf text withe the mouse
set mouse=a

"tab ball

set tabpagemax=30


" single character insert
nmap <Space> i_<Esc>r


" Getting Copy Paste to work on the mac iTerm2
set clipboard=unnamed

" Set the syntax highlighting for the Gemfile
autocmd BufNewFile,BufRead Gemfile set filetype=ruby

" Try to make it faster
syn sync fromstart

" Higlite trailing whitespace, except in insert mode
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

let g:slime_target = "tmux"

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" Command-T uses this to exclude files
set wildignore+=*.o,*.obj,.git
set wildignore+=vendor/**
set wildignore+=tmp/**
set wildignore+=public/system/images/**
set wildignore+=public/images/**

let g:CommandTMaxFiles=20000

" Borrowed from: http://thelackthereof.org/docs/dotfiles/.vimrc
" Command-T: Fix up-arrow, left-arrow, and backspace
let g:CommandTSelectPrevMap=['<C-p>','<C-k>','<Esc>0A','<Up>']
let g:CommandTCursorLeftMap=['<Left>']
let g:CommandTBackspaceMap=['<BS>', '<C-h>']

" Command-T: Keep the results at the top to save eyeball focus
let g:CommandTMatchWindowAtTop=1
"let g:CommandTMaxHeight=15

" Command-T maped key's
map <leader>ta :CommandT app/assets/<CR>
map <leader>tc :CommandT app/controllers/<CR>
map <leader>th :CommandT app/helpers/<CR>
map <leader>tm :CommandT app/models/<CR>
map <leader>tv :CommandT app/views/<CR>
map <leader>tl :CommandT app/lib/<CR>
map <leader>tt :CommandT test/<CR>
map <leader>tu :CommandT test/units/<CR>
map <leader>ti :CommandT test/integration/<CR>
map <leader>tf :CommandT test/functional/<CR>

" Flush Command-T cache
" :map <[SOME CHAR]> :CommandTFlush

" Swithc betwen files
map ,, <C-^>



:command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

" add routs to a new bufer
map rou :R rake routes
" Close buffer
map <leader>q :q<CR>

" Keap selection when indenting
vnoremap > >gv
vnoremap < <gv

" Indent withe the tab key
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Get SHIFT+arrow keys to select text
set keymodel=startsel
set selectmode=mouse,key

" Copy and cut in selection mode
vmap y y
vmap x x

nmap <leader>s :set spell<CR>
" Next spell word
nmap <leader>sn ]s
" List of suggested spelling
nmap <leader>sl z=

" Lookup the current word on dictionary.com
function! LookupCurrentWordOnDictionaryCom()
  :silent ! open http://dictionary.reference.com/browse/<cword>
  redraw!
endfunction
map <leader>D :call LookupCurrentWordOnDictionaryCom()<CR>

" Lookup the current word on IKEA.is
function! LookupCurrentWordOnIkeaIs()
  :silent ! open http://www.ikea.is/search\?\&search=<cword>
  redraw!
endfunction
map <leader>I :call LookupCurrentWordOnIkeaIs()<CR>

" Lookup the current word on IKEA.is
function! OpenVimCheatSheet()
  :silent ! open http://www.worldtimzone.com/res/vi.html
  redraw!
endfunction
map <leader>c :call OpenVimCheatSheet()<CR>

" If the Esc key is just to far away.
inoremap jj <Esc>

" The time it takse vim to resolve key maps in ms
set timeoutlen=300

map <leader>ii gg=G
