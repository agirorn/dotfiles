"" auto-install vim-plug
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.nvim/autoload')
  " A universal set of defaults that (hopefully)
  Plug 'tpope/vim-sensible'

  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'

  " File Explorer
  Plug 'preservim/nerdtree'

  " Make your Vim/Neovim as smart as VSCode.
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " This plugin causes trailing whitespace to be highlighted in red.
  Plug 'bronson/vim-trailing-whitespace'

  " Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
  Plug 'ctrlpvim/ctrlp.vim'

  " Automatically create folders in the file path being edited
  Plug 'pbrisbin/vim-mkdir'

  " Asynchronous Lint Engine
  Plug 'dense-analysis/ale'

  " Comment stuff out
  Plug 'tpope/vim-commentary'
  Plug 'tomtom/tcomment_vim'

  "A painless, powerful Vim auto-pair plugin.
  Plug 'tmsvg/pear-tree'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " Tmux
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmux-plugins/vim-tmux'
  Plug 'wellle/tmux-complete.vim'

  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-colorscheme-switcher'

  " Color schemes.
  Plug 'flazz/vim-colorschemes'
  Plug 'chriskempson/base16-vim'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'altercation/vim-colors-solarized'
  Plug 'flazz/vim-colorschemes'

  """"""""""""""""""""
  " Disabled plugins "
  """"""""""""""""""""

  " This is a simple plugin that helps to end certain structures automatically. 
  " Plug 'tpope/vim-endwise'
  " Plug 'tpope/vim-unimpaired'

  " A set of mappings for HTML, XML, PHP, ASP, eRuby, JSP, and more (formerly allml)
  " Plug 'tpope/vim-ragtag'

  " Plug 'tpope/vim-surround'
  " Plug 'vim-scripts/ZoomWin'
  " Plug 'Raimondi/delimitMate'
  " Plug 'guns/xterm-color-table.vim'
  " Plug 'joegesualdo/jsdoc.vim'
  " Plug 'christoomey/vim-sort-motion'
  " Plug 'evanleck/vim-svelte'
  " Plug 'jparise/vim-graphql'
  " " Plug 'iamcco/coc-tailwindcss'
  " " Plug 'Valloric/YouCompleteMe'
  " " Plug 'Shougo/neocomplete.vim'
  " Vim Markdown runtime files
  " Plug 'tpope/vim-markdown'

  " " CSS
  " Plug 'agirorn/vim-coloresque'
  " Plug 'cakebaker/scss-syntax.vim'
  " Plug 'vim-scripts/less.vim'

  " " javascript
  " Plug 'styled-components/vim-styled-components'

  " Plug 'jelera/vim-javascript-syntax'
  " Plug 'pangloss/vim-javascript'
  " Plug 'maxmellon/vim-jsx-pretty'
  " " Plug 'glanotte/vim-jasmine'
  " Plug 'kchmck/vim-coffee-script'
  " Plug 'myhere/vim-nodejs-complete'
  " " Plug 'ternjs/tern_for_vim'
  " Plug 'elzr/vim-json'
  " Plug 'moll/vim-node'
  " Plug 'posva/vim-vue'
  " " Plug 'agirorn/vim-vue'
  " Plug 'sekel/vim-vue-syntastic'
  " Plug 'digitaltoad/vim-pug'

  " " typescript
  " Plug 'leafgarland/typescript-vim'

  " let g:typescript_indent_disable = 1

  " " TwiG templates
  " Plug 'lumiliet/vim-twig'

  " " Ruby
  " Plug 'tpope/vim-rails'

  " Plug 'vim-ruby/vim-ruby'

  " " Handlebars
  " Plug 'nono/vim-handlebars'

  " Plug 'gilgigilgil/anderson.vim'
  " Plug 'Wutzara/vim-materialtheme'
  " Plug 'xero/sourcerer.vim'

  " "" Test this out on next C++ session
  " Plug 'mbbill/echofunc'

  " "" GYP syntax
  " Plug 'kelan/gyp.vim'

  " """ SQL
  " Plug 'shmup/vim-sql-syntax'

  " "" Haskell
  " Plug 'neovimhaskell/haskell-vim'

  " Plug 'kevinoid/vim-jsonc'

  " It provides a smarter way to correct spelling mistakes by supporting
  " PascalCase, camelCase and snake_case
  " Plug 'kamykn/spelunker.vim'
  " Plug 'ryanoasis/vim-devicons'
  "
call plug#end()
