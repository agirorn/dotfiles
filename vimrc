""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim configuration file.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              "" be iMproved, required
filetype off                  "" required for Vundle

"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"" Defaults
Plugin 'tpope/vim-sensible'

"" Tools
Plugin 'bronson/vim-trailing-whitespace'
" Plugin 'ervandew/supertab' " Incompatible wihte 
" Plugin 'jlanzarotta/bufexplorer'
" Plugin 'jpalardy/vim-slime'
Plugin 'ctrlpvim/ctrlp.vim'

" This can probably be disabled
Plugin 'majutsushi/tagbar'

Plugin 'pbrisbin/vim-mkdir'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/ZoomWin'
Plugin 'Raimondi/delimitMate'
Plugin 'guns/xterm-color-table.vim'
Plugin 'joegesualdo/jsdoc.vim'
Plugin 'christoomey/vim-sort-motion'
Plugin 'evanleck/vim-svelte'
Plugin 'jparise/vim-graphql'

"" Autocomplete
Plugin 'neoclide/coc.nvim'
" Plugin 'iamcco/coc-tailwindcss'

" Plugin 'Valloric/YouCompleteMe'
" Plugin 'Shougo/neocomplete.vim'

Plugin 'tpope/vim-markdown'

"" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

"" CSS
Plugin 'agirorn/vim-coloresque'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'vim-scripts/less.vim'

"" Tmux
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'wellle/tmux-complete.vim'

"" javascript
Plugin 'styled-components/vim-styled-components'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
" Plugin 'glanotte/vim-jasmine'
Plugin 'kchmck/vim-coffee-script'
Plugin 'myhere/vim-nodejs-complete'
" Plugin 'ternjs/tern_for_vim'
Plugin 'elzr/vim-json'
Plugin 'moll/vim-node'
Plugin 'posva/vim-vue'
" Plugin 'agirorn/vim-vue'
Plugin 'sekel/vim-vue-syntastic'
Plugin 'digitaltoad/vim-pug'

" typescript
Plugin 'leafgarland/typescript-vim'
let g:typescript_indent_disable = 1

" TwiG templates
Plugin 'lumiliet/vim-twig'

"" Ruby
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

"" Handlebars
Plugin 'nono/vim-handlebars'

"" Color schemes.
Plugin 'flazz/vim-colorschemes'
Plugin 'gilgigilgil/anderson.vim'
Plugin 'Wutzara/vim-materialtheme'
Plugin 'xero/sourcerer.vim'

"" Test this out on next C++ session
Plugin 'mbbill/echofunc'

"" GYP syntax
Plugin 'kelan/gyp.vim'

""" SQL
Plugin 'shmup/vim-sql-syntax'

"" Haskell
Plugin 'neovimhaskell/haskell-vim'
Plugin 'kevinoid/vim-jsonc'

call vundle#end()            " required

" Disable the old RegEx engine for performance reasons
"
" - https://jameschambers.co.uk/vim-typescript-slow
set re=0

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

set number
set tabstop=2        " Tab width is 2 spaces
set shiftwidth=2     " Indent also with 4 spaces
set softtabstop=2    " Soft tabs
set expandtab        " Expand tabs to spaces
set wildmode=list:longest
set scrolloff=5      " Leave 5 line top and bottom while scrolling
set nowrap
set textwidth=80
set formatoptions=qn1
set diffopt=vertical,context:8
set updatetime=2000
set wildignore+=*.o,*.obj,.git,*.pyc,*.pyc
set spell
set mouse=a            "" enable mouse selection.
set ttymouse=xterm2    "" Allow mouse to resize pane.
set background=dark
colorscheme woju

"" Allow moves fomr the end of line to next or previous ling
set whichwrap+=h,l

set cursorline
set conceallevel=0

"" Search as you type
set ignorecase
set smartcase
set hlsearch

"" Copy backup files when editing crontab files
au BufEnter crontab.* setl backupcopy=yes

"" Lets just do this for all files to ensure if they are mounted in Docker that
"" they get picked up.
au BufEnter * setl backupcopy=yes

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"" Leader
let mapleader = ","

"" Hide search selection
nnoremap <LEADER><SPACE> :nohlsearch<C-R>=has('diff')?'<BAR>diffupdate':''<CR><CR><C-L>

"" Yank / Copy to the end of the line.
map Y y$

"" Open ~/.vimrc
nnoremap <leader>rc <C-w><C-v><C-l>:e $MYVIMRC<cr>

"" Reload ~/.vimrc
nnoremap <leader>rr :source $MYVIMRC<cr>

"" Get out of insert mode by pressing jj fast
inoremap jj <ESC>

"" Vertical split ,|
nnoremap <leader><bar> <C-w>v<C-w>l
"" Horizontal split ,_
nnoremap <leader>_ <C-w>s<C-w>j

"" Next buffer ,n
nnoremap <leader>n :bn<CR>

"" Previous buffer ,p
nnoremap <leader>p :bp<CR>

"" Close buffer ,d
nnoremap <leader>d :Bclose<CR>

"" If the <ESC> key is just to far away.
inoremap jj <Esc>
"" Fix files indentation.
map <leader>ii gg=G

"" Close buffer
map <leader>q :q<CR>

"" Switch previous file
map <leader><leader> <C-^>

"" Go to next spelling mistake.
nmap N ]s

"" Toggle spell checker on and off.
map <f12> :set spell!<cr>

"" Resizing windows
nmap - <C-W>-
nmap + <C-W>+
nmap _ :vertical res -2<CR>
nmap * :vertical res +2<CR>

"" Enable window commands in insert mode
imap <C-w> <C-o><C-w>

"" preview markdown in vim
" map <Leader>m :w<cr>:!pandoc % \| lynx -stdin<cr>:redraw!<cr>

"" Set the syntax highlighting for the gemfile
autocmd BufNewFile,BufRead Gemfile set filetype=ruby

"" OPEN FILES IN DIRECTORY OF CURRENT FILE
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

"" Keep selection when indenting
vnoremap > >gv
vnoremap < <gv

"" Indent with the tab key
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"" Copy and cut in selection mode
vmap y y
vmap x x

"" Spell checker.
nmap <leader>s :set spell<CR>
"" Next spell word
nmap <leader>sn ]s
"" List of suggested spelling
nmap <leader>sl z=

"" Toggle comment for current line
map <leader>l gcc

"" If you prefer the Omni-Completion tip window to close when a selection is
"" made, these lines close it on movement in insert mode or when leaving
"" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let expect to to_not
highlight def link rubyRspec Function

"" Tagbar
nmap <F8> :TagbarToggle<CR>
nmap <F9> :TagbarOpenAutoClose<CR>
nmap <F11> :ToggleWhitespace<CR>

set backupcopy=yes

"" tmux-complete
let g:tmuxcomplete#trigger = 'omnifunc'

nmap <leader>s :BufExplorer<cr>

"" css
au BufRead,BufNewFile *.scss set filetype=scss.css

"" ejs templates
au BufNewFile,BufRead *.ejs set filetype=html

"" vim
au BufNewFile,BufRead *.vim set filetype=vim

"" gitmessage
au FileType gitcommit set tw=72

"" Map git diff
map <leader>g :Gdiff<CR>

"" Fix spell color
au BufNewFile,BufRead * hi SpellBad cterm=underline,bold ctermfg=009 ctermbg=000 guifg=#FFFFFF guibg=#000000 gui=none

"" yardman
au BufRead,BufNewFile .yardmanrc set filetype=sh

"" buildfile
au BufRead,BufNewFile buildfile set filetype=sh

"" GYP files
au BufRead,BufNewFile bindings.gyp set filetype=gyp

autocmd FileType make setlocal noexpandtab

autocmd FileType php setlocal commentstring=#\ %s

map! <F3> :echo 'F3 is disabled and the current time is ' . strftime('%c')<CR>

" Search literally!
com! -nargs=1 Search :let @/='\V'.escape(<q-args>, '\\')| normal! n

:nmap <F1> :echo<CR>
:imap <F1> <C-o>:echo<CR>
