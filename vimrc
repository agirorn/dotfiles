" COLOR PICKER FOR THE MAC.
" http://www.robinwood.com/Catalog/Technical/OtherTuts/MacColorPicker/MacColorPicker.html

" DISABLE VI COMPATIBILITY (EMULATION OF OLD BUGS)
set nocompatible

call pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GET BACKSPACE TO WORK
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start
syntax on
set number
set laststatus=2
set ruler
set ttyfast
set enc=utf-8
set fenc=utf-8
set encoding=utf-8
set termencoding=utf-8
set autoindent
set showmode
set showcmd
set smartindent
set tabstop=2        " TAB WIDTH IS 2 SPACES
set shiftwidth=2     " INDENT ALSO WITH 4 SPACES
set softtabstop=2    " SOFT TABS
set expandtab        " EXPAND TABS TO SPACES
set modelines=0
set visualbell
set wildmode=list:longest
set wildmenu
set scrolloff=5
set nowrap
set textwidth=79
set formatoptions=qn1
set listchars=tab:▸\ ,eol:¬
set showtabline=2
set switchbuf=usetab,newtab

" 256 COLORS
set t_Co=256
colorscheme vibrantink

" ENABLE MOUSE / THIS DESABLES THE SELECTIONS OGF TEXT WITHE THE MOUSE
set mouse=a
set tabpagemax=30
" GETTING COPY PASTE TO WORK ON THE MAC ITERM2
set clipboard=unnamed

" GET SHIFT+ARROW KEYS TO SELECT TEXT
set keymodel=startsel
set selectmode=mouse,key

" THE TIME IT TAKSE VIM TO RESOLVE KEY MAPS IN MS
"set timeoutlen=300


" THIS SEAMS TO ALLOW MY TO RESIZE THE WINDOWS SPLITS WITH THE MOUSE
set ttymouse=xterm2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CREATE THE BACKUP DIRECTORY IF IT DOESN'T EXISTS.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !isdirectory('/tmp/vim_backup')
  silent !mkdir -p ~/tmp/vim_backup
endif
set backupdir=~/tmp/vim_backup/
set directory=~/tmp/vim_backup/

" COPY BACKUPFILES WHEN EDITING CRONTAB FILES
au BufEnter crontab.* setl backupcopy=yes


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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggles NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ToggleNerdTree()
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
map <silent> <F2> :call ToggleNerdTree()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LEADER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH AS YOU TYPE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch

" HIDE SEACH SELECTION
nnoremap <leader><space> :noh<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DISABLE ARROW KEYS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN WINDOW SPLITS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

" nmap <silent> <A-Up> :wincmd k<CR>
" nmap <silent> <A-Down> :wincmd j<CR>
" nmap <silent> <A-Left> :wincmd h<CR>
" nmap <silent> <A-Right> :wincmd l<CR>

nmap gh <c-w>h
nmap gj <c-w>j
nmap gk <c-w>k
nmap gl <c-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Yank / Copy TO THE END OF THE LINE.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map Y y$
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>rc <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>rr :source $MYVIMRC<cr>

inoremap jj <ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PRESS ,i TO GO TO A VERTICAL SPLIT AND START WORKING THER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader><bar> <C-w>v<C-w>l
nnoremap <leader>_ <C-w>s<C-w>j

" map C-( hjkl ) to move bettwen splits
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>d :Bclose<CR>

" RESIZING WINDOWS
map - <C-W>-
map + <C-W>+

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IF YOU WANT TO MAXIMIZE THE WINDOW AFTER CHANGE.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <C-H> <C-W>h<C-W>_
"map <C-J> <C-W>j<C-W>_
"map <C-K> <C-W>k<C-W>_
"map <C-L> <C-W>l<C-W>_

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ENABLE WINDOW COMMANDS IN INSERT MODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <C-w> <C-o><C-w>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SET THE SYNTAX HIGHLIGHTING FOR THe Gemfile
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead Gemfile set filetype=ruby

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TRY TO MAKE IT FASTER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn sync fromstart

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Higlite trailing whitespace, except in insert mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" REMOVE TRAILING WHITESPACE ON SAVE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePre * :%s/\s\+$//e

let g:slime_target = "tmux"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ruby
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-T USES THIS TO EXCLUDE FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*.o,*.obj,.git
set wildignore+=vendor/**
set wildignore+=tmp/**
set wildignore+=public/system/images/**
set wildignore+=public/images/**

let g:CommandTMaxFiles=20000

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Borrowed from: http://thelackthereof.org/docs/dotfiles/.vimrc
" Command-T: Fix up-arrow, left-arrow, and backspace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:CommandTSelectPrevMap=['<C-p>','<C-k>','<Esc>0A','<Up>']
"let g:CommandTCursorLeftMap=['<Left>']
let g:CommandTBackspaceMap=['<BS>', '<C-h>']

" Command-T: Keep the results at the top to save eyeball focus
let g:CommandTMatchWindowAtTop=1
"let g:CommandTMaxHeight=15

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPS TO JUMP TO SPECIFIC COMMAND-T TARGETS AND FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gr :topleft :split config/routes.rb<cr>
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets/sass<cr>
map <leader>gS :CommandTFlush<cr>\|:CommandT spec<cr>
map <leader>gf :CommandTFlush<cr>\|:CommandT features<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>gt :CommandTFlush<cr>\|:CommandTTag<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

"# " Command-T maped key's
"# map <leader>ta :CommandT app/assets/<CR>
"# map <leader>tc :CommandT app/controllers/<CR>
"# map <leader>th :CommandT app/helpers/<CR>
"# map <leader>tm :CommandT app/models/<CR>
"# map <leader>tv :CommandT app/views/<CR>
"# map <leader>tl :CommandT app/lib/<CR>
"# map <leader>tt :CommandT test/<CR>
"# map <leader>tu :CommandT test/units/<CR>
"# map <leader>ti :CommandT test/integration/<CR>
"# map <leader>tf :CommandT test/functional/<CR>

" Flush Command-T cache
" :map <[SOME CHAR]> :CommandTFlush

" Swithc betwen files
map <leader><leader> <C-^>



:command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ADD ROUTS TO A NEW BUFER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map rou :R rake routes

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CLOSE BUFFER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>q :q<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEAP SELECTION WHEN INDENTING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap > >gv
vnoremap < <gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INDENT WITH THE TAB KEY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy AND Cut IN SELECTION MODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap y y
vmap x x

nmap <leader>s :set spell<CR>
" NEXT SPELL WORD
nmap <leader>sn ]s
" LIST OF SUGGESTED SPELLING
nmap <leader>sl z=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LOOKUP THE CURRENT WORD ON dictionary.com
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! LookupCurrentWordOnDictionaryCom()
  :silent ! open http://dictionary.reference.com/browse/<cword>
  redraw!
endfunction
map <leader>D :call LookupCurrentWordOnDictionaryCom()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LOOKUP THE CURRENT WORD ON IKEA.is
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! LookupCurrentWordOnIkeaIs()
  :silent ! open http://www.ikea.is/search\?\&search=<cword>
  redraw!
endfunction
map <leader>I :call LookupCurrentWordOnIkeaIs()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LOOKUP THE CURRENT WORD ON IKEA.IS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenVimCheatSheet()
  :silent ! open http://www.worldtimzone.com/res/vi.html
  redraw!
endfunction
map <leader>c :call OpenVimCheatSheet()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IF THE <ESC> KEY IS JUST TO FAR AWAY.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap jj <Esc>
map <leader>ii gg=G

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>mv :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction

function! AlternateForCurrentFile()
  let current_file  = expand("%")
  let new_file      = current_file
  let is_erb        = match(current_file, '\<views\>') != -1
  let is_controller = match(current_file, '\<controllers\>') != -1
  let is_model      = match(current_file, '\<models\>') != -1
  let is_view       = match(current_file, '\<views\>') != -1
  let is_helper     = match(current_file, '\<helpers\>') != -1
  let is_mailer     = match(current_file, '\<mailer\>')
  let in_spec       = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app        = is_controller || is_model || is_view || is_helper || is_mailer
  let in_lib        = match(current_file, '\<lib\>') != -1

  if going_to_spec
    if in_lib
      let new_file = substitute(new_file, '^lib/', '', '')
    end
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    if is_erb
      let new_file = substitute(new_file, '\.erb$', '.erb_spec.rb', '')
    else
      let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    end
    let new_file = 'spec/' . new_file
  else
    if is_erb
      let new_file = substitute(new_file, '\.erb_spec\.rb$', '.erb', '')
    else
      let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    end
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    else
      let new_file = 'lib/' . new_file
    end
  endif

  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>
map <leader>a :call RunTests('')<cr>
map <leader>c :w\|:!script/features<cr>
map <leader>w :w\|:!script/features --profile wip<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo

    if match(a:filename, '_test.rb$') != -1
        exec ":!ruby -Itest " . a:filename
    elseif match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        elseif filereadable("Gemfile")
            exec ":!bundle exec rspec --color " . a:filename
        else
            exec ":!rspec --color " . a:filename
        end
    end
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ADD # encoding: UTF-8 TO TOP OF FILE.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! InsertRubyUtf8 :normal ggi<CR><ESC>ggi<c-r>'# encoding: UTF-8<ESC>
map <leader>8 :InsertRubyUtf8<CR>

" TOGGLE COMMENT FOR CURRENT LINE
map <leader>l \\\

" Make SuperTab work with OmniComplete
" let g:SuperTabDefaultCompletionType = "context"

" Color of SuperTab Menu
highlight   Pmenu         ctermfg=2 ctermbg=0
highlight   PmenuSel      ctermfg=0 ctermbg=255
" highlight   PmenuSbar     ctermfg=0 ctermbg=50
" highlight   PmenuThumb    ctermfg=0 ctermbg=7

autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
highlight def link rubyRspec Function

