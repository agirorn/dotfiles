""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""  Vundle, the plug-in manager for Vim
"""
"""  https://github.com/VundleVim/Vundle.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'Valloric/YouCompleteMe'
Plugin 'Wutzara/vim-materialtheme'
Plugin 'agirorn/vim-coloresque'
Plugin 'airblade/vim-gitgutter'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ervandew/supertab'
Plugin 'gilgigilgil/anderson.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'jpalardy/vim-slime'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'nono/vim-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sophacles/vim-bundle-mako'
Plugin 'ternjs/tern_for_vim'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'vim-perl/vim-perl'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/ZoomWin'
Plugin 'vim-scripts/less.vim'
Plugin 'xero/sourcerer.vim'
Plugin 'yantze/pt_black'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/CycleColor'
" disabled until fixed.
" Plugin 'glanotte/vim-jasmine'
Plugin 'agirorn/vim-jasmine'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set backspace=indent,eol,start
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
set textwidth=80
set formatoptions=qn1
set listchars=tab:▸\ ,eol:¬
set showtabline=2
set switchbuf=usetab,newtab
set diffopt=vertical,context:8
set updatetime=250

" 256 COLORS
set t_Co=256
set background=dark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Interesting colorscheme
"""
""" anderson
""" less
""" pt_black
""" sourcerer
""" sunburst
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Favorite colorscheme
"""
""" torte
""" pablo
""" vibrantink
""" blackboard
""" materialtheme
""" twilight256
""" woju
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Current colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme materialtheme
colorscheme woju
" if has("mac")
"   colorscheme woju
" endif

""" ENABLE MOUSE / THIS DESABLES THE SELECTIONS OF TEXT WITH THE MOUSE
set mouse=a
set tabpagemax=30

" Copy to clipboard on Ubuntu Linux
set clipboard=unnamedplus

if has("mac")
  " Copy to clipboard on Mac OS X
  set clipboard=unnamed
endif

" GET SHIFT+ARROW KEYS TO SELECT TEXT
set keymodel=startsel
set selectmode=mouse,key

" THE TIME IT TAKSE VIM TO RESOLVE KEY MAPS IN MS
" set timeoutlen=300


" THIS SEAMS TO ALLOW MY TO RESIZE THE WINDOWS SPLITS WITH THE MOUSE
set ttymouse=xterm2

" Showing a different background colour in Vim past 80 and 120 characters.
" let &colorcolumn=join(range(81,999),",")
" highlight ColorColumn ctermbg=235 guibg=#2c2d27
" let &colorcolumn="81,".join(range(121,999),",")

autocmd VimEnter,BufEnter,WinEnter,BufWinEnter * call HighlightLongLines()
function! HighlightLongLines()
  highlight ColorColumn ctermbg=magenta guibg=Magenta
  call matchadd('ColorColumn', '\%82v', 100)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" CREATE THE BACKUP DIRECTORY IF IT DOESN'T EXISTS.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if !isdirectory('/tmp/vim_backup')
"   silent !mkdir -p ~/tmp/vim_backup
" endif
" set backupdir=~/tmp/vim_backup/
" set directory=~/tmp/vim_backup/

" COPY BACKUPFILES WHEN EDITING CRONTAB FILES
au BufEnter crontab.* setl backupcopy=yes

" filetype plugin on

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
nmap <silent> <F2> :call ToggleNerdTree()<CR>

""" Now you can just click on any thing and it just reacts (open og close
""" folders, and open files)
let NERDTreeMouseMode=1

""" sort files and folders by name
let NERDTreeSortOrder = ['(*|\/$)', '\.swp$', '\.bak$', '\~$']

""" Hide bundler_stubs
let NERDTreeIgnore=['^bundler_stubs$', '\~$', '\.pyc$', '\.pyo$']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Leader
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Search as you type
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch

""" Hide search selection
nnoremap <leader><space> :noh<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Disable arrow keys
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <Left> <Nop>
" map <Right> <Nop>
" map <Up> <Nop>
" map <Down> <Nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Yank / Copy TO THE END OF THE LINE.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map Y y$
nnoremap <leader>rc <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>rr :source $MYVIMRC<cr>

" Get out of insert mode by pressing jj fast
" This might be a really bad idea.
inoremap jj <ESC>

""" Vertical split ,|
nnoremap <leader><bar> <C-w>v<C-w>l
""" Horizontal split ,_
nnoremap <leader>_ <C-w>s<C-w>j

" Next buffer ,n
nnoremap <leader>n :bn<CR>

" Previous buffer ,n
nnoremap <leader>p :bp<CR>

" Close buffer ,n
nnoremap <leader>d :Bclose<CR>

" RESIZING WINDOWS
nmap - <C-W>-
nmap + <C-W>+
nmap _ :vertical res -2<CR>
nmap * :vertical res +2<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" IF YOU WANT TO MAXIMIZE THE WINDOW AFTER CHANGE.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <C-H> <C-W>h<C-W>_
"map <C-J> <C-W>j<C-W>_
"map <C-K> <C-W>k<C-W>_
"map <C-L> <C-W>l<C-W>_

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ENABLE WINDOW COMMANDS IN INSERT MODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <C-w> <C-o><C-w>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" SET THE SYNTAX HIGHLIGHTING FOR THe Gemfile
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead Gemfile set filetype=ruby

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" TRY TO MAKE IT FASTER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn sync fromstart

let g:slime_target = "tmux"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ruby
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

let g:ctrlp_working_path_mode = 'w'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" CtrlP 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Exclude files
set wildignore+=*.o,*.obj,.git,*.pyc,*.pyc
set wildignore+=vendor/**
set wildignore+=tmp/**
set wildignore+=public/system/**
set wildignore+=public/images/**
set wildignore+=db/sphinx/**
set wildignore+=node_modules/**
set wildignore+=app/bower_components/**
set wildignore+=*/compass/build
set wildignore+=*/compass/prodbuild

let g:ctrlp_max_depth = 80
let g:ctrlp_max_files = 20000
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:20,results:20'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|node_modules$\|dist$'
  \ }

" Flush Command-T cache
" :map <[SOME CHAR]> :CommandTFlush

" Switch previous file
map <leader><leader> <C-^>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""  Read output from shell command into a new buffer
"""  R <shell commands>| vim -
"""
""" http://vim.wikia.com/wiki/Append_output_of_an_external_command
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:command! -nargs=* -complete=shellcmd R new | setlocal
  \ buftype=nofile bufhidden=hide noswapfile | r !<args>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Add rails routs to a new buffer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map rou :R rake routes

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Close buffer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>q :q<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Keep selection when indenting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap > >gv
vnoremap < <gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Indent with the tab key
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Copy and cut in selection mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap y y
vmap x x

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Spell checker.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>s :set spell<CR>
" NEXT SPELL WORD
nmap <leader>sn ]s
" LIST OF SUGGESTED SPELLING
nmap <leader>sl z=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Lookup the current word on dictionary.com
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! LookupCurrentWordOnDictionaryCom()
  :silent ! open http://dictionary.reference.com/browse/<cword>
  redraw!
endfunction
map <leader>D :call LookupCurrentWordOnDictionaryCom()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Lookup the current word on ikea.is
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! LookupCurrentWordOnIkeaIs()
  :silent ! open http://www.ikea.is/search\?\&search=<cword>
  redraw!
endfunction
map <leader>I :call LookupCurrentWordOnIkeaIs()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Lookup the current word on ikea.is
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenVimCheatSheet()
  :silent ! open http://www.worldtimzone.com/res/vi.html
  redraw!
endfunction
map <leader>c :call OpenVimCheatSheet()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" If the <ESC> key is just to far away.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap jj <Esc>
map <leader>ii gg=G

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Rename current file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Switch between test and production code
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e! ' . new_file
endfunction

function! AlternateForCurrentFile()
  let current_file  = expand("%")
  let new_file      = current_file

  let is_erb        = match(current_file, '\<views\>') != -1
  let is_controller = match(current_file, '\<controllers\>') != -1
  let is_model      = match(current_file, '\<models\>') != -1
  let is_view       = match(current_file, '\<views\>') != -1
  let is_helper     = match(current_file, '\<helpers\>') != -1
  let is_mailer     = match(current_file, '\<mailers\>') != -1
  let in_rspec      = match(current_file, '^spec/') != -1
  let in_fspec      = match(current_file, '^fspec/') != -1
  let in_spec       = in_rspec || in_fspec
  let in_fast_spec  = match(current_file, '^fast_spec/') != -1
  let going_to_spec = !(in_spec || in_fast_spec)
  let in_app        = is_controller || is_model || is_view || is_helper || is_mailer
  let in_lib        = match(current_file, '\<lib\>') != -1

  if going_to_spec
    let new_file = substitute(new_file, '^lib/', '', '')
    let new_file = substitute(new_file, '^app/', '', '')

    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = substitute(new_file, '\.erb$', '.erb_spec.rb', '')

    let fast_spec_file = 'fspec/' . new_file
    let spec_file = 'spec/' . new_file

    if filereadable(spec_file)
      let new_file = spec_file
    else
      if isdirectory("fspec")
        let new_file = fast_spec_file
      else
        let new_file = spec_file
      end
    end
  else
    if is_erb
      let new_file = substitute(new_file, '\.erb_spec\.rb$', '.erb', '')
    else
      let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    end

    let new_file = substitute(new_file, '^fspec/', '', '')
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Running TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>t :call RunTestFile()<cr>
map <leader>F :call RunDocumentFormatedTest()<cr>
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

function! RunDocumentFormatedTest()
  call RunTestFile(" -f d")
endfunction

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !clear

  let is_fast_spec  = ( match(a:filename, '^fast_spec/') != -1 || match(a:filename, '^fspec/') != -1 ) && filereadable(".fspec")

  if match(a:filename, '_test.rb$') != -1
      exec ":!ruby -Itest " . a:filename
  elseif match(a:filename, '\.feature$') != -1
      exec ":!script/features " . a:filename
  else
    if filereadable("script/test")
      exec ":!script/test " . a:filename
    elseif is_fast_spec
      exec ":!rspec --color -O .fspec " . a:filename
    elseif filereadable("Gemfile")
      exec ":!bundle exec rspec --color " . a:filename
    else
      exec ":!rspec --color " . a:filename
    end
  end
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add # encoding: UTF-8 to top of file.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! InsertRubyUtf8 :normal ggi<CR><ESC>ggi<c-r>'# encoding: UTF-8<ESC>
map <leader>8 :InsertRubyUtf8<CR>

" Toggle comment for current line
map <leader>l gc

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" YouCompleteMe plugin
let g:ycm_semantic_triggers =  {
 \ 'css': [ 're!^\s+', 're!:\s+' ],
 \ 'javascript': [ 're!=\s+', ]
 \ }

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" " Color of SuperTab Menu
" highlight   Pmenu         ctermfg=2 ctermbg=0
" highlight   PmenuSel      ctermfg=0 ctermbg=255
" " highlight   PmenuSbar     ctermfg=0 ctermbg=50
" " highlight   PmenuThumb    ctermfg=0 ctermbg=7

" Let the Buffer Explorer display relative paths.
let g:bufExplorerShowRelativePath=1

" Sort Buffer Explorer by most recently used.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
" Sort Buffer Explorer by name.
" let g:bufExplorerSortBy='name'       " Sort by the buffer's name.

autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let expect to to_not
highlight def link rubyRspec Function

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Syntastic plugin.
"""
""" https://github.com/scrooloose/syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pep8']
let g:syntastic_javascript_checkers = ['eslint']

" lint scss files with https://github.com/brigade/scss-lint
let g:syntastic_scss_checkers = ['scss_lint']

" let g:syntastic_javascript_eslint_exec = 'eslint'
let b:syntastic_javascript_eslint_exec = StrTrim(system('npm-which eslint'))

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" vim-javascript
"""
""" https://github.com/pangloss/vim-javascript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:javascript_plugin_jsdoc = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" vim-gitgutter
"""
""" https://github.com/airblade/vim-gitgutter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_sign_column_always = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Debug syntax highlighting.
"""
""" Identify the syntax highlighting group used at the cursor
""" http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" Ignore the proprietary attribute that asre used in AngularJs
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_html_tidy_ignore_errors=[
  \ "trimming empty <span>",
  \ "proprietary attribute"
  \]

let g:syntastic_mode_map={
  \ 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': ['eruby', 'html']
\ }

let g:syntastic_echo_current_error=1

nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" Spell config.
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=red 
nmap N ]s
set spell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" Set Mako Templates
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.mc    set ft=mako
autocmd BufNewFile,BufRead *.mhtml set ft=mako

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" Perl files.
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.psgi set ft=perl

nmap <leader>s :BufExplorer<cr>


" if !isdirectory("~/mbl_env")
"   " Forcing some MBL.is love.
"   autocmd BufNewFile,BufRead *.py set tabstop=4        " TAB WIDTH IS 2 SPACES
"   autocmd BufNewFile,BufRead *.py set shiftwidth=4     " INDENT ALSO WITH 4 SPACES
"   autocmd BufNewFile,BufRead *.py set softtabstop=4    " SOFT TABS
" endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" GYP syntax ( Generate Your Projects )
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.gyp set filetype=json

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" .jshintrc syntax
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead .jshintrc set filetype=javascript

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" Mason syntax.
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead */mason/*
    \ if getline(1) =~ '^\(%\|<[%&].*>\)' |
    \     set filetype=mason |
    \ endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" scss
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.scss set filetype=scss.css
set iskeyword-=.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" ejs templates
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.ejs set filetype=html

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" vuejs templates
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.vue set filetype=html

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" gitmessage
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType gitcommit set tw=72

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" Get EditorCnfig working.
"""
""" https://github.com/editorconfig/editorconfig/issues/132#issuecomment-42256808
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EditorConfig_core_mode = 'external_command'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Load a project .vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(".vimrc") && expand('~') != getcwd()
    source .vimrc
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Map Git diff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>g :Gdiff<CR>

