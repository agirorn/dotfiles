" AstroNvim is a very interestinf vim convifutaion project to look into
" https://github.com/AstroNvim/AstroNvim
" And also this one is nice
" https://gist.github.com/benfrain/97f2b91087121b2d4ba0dcc4202d252f

" Initeresting new plugins
" Plug 'editorconfig/editorconfig-vim'

" " Cold be usefull
" Plug 'glepnir/lspsaga.nvim'

" https://github.com/mhartington/formatter.nvim
" https://github.com/nvim-telescope/telescope.nvim

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
  " Plug 'sheerun/vim-polyglot'

  " File Explorer
  " Plug 'preservim/nerdtree'

  " Make your Vim/Neovim as smart as VSCode.
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " This plugin causes trailing whitespace to be highlighted in red.
  Plug 'bronson/vim-trailing-whitespace'

  " Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
  Plug 'ctrlpvim/ctrlp.vim'

  " Automatically create folders in the file path being edited
  Plug 'pbrisbin/vim-mkdir'

  " Asynchronous Lint Engine
  " Plug 'dense-analysis/ale'

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


  " Only usefull to toggle throut avaiable colorschemes
  " No neead to have in all the time
  " Plug 'xolox/vim-misc'
  " Plug 'xolox/vim-colorscheme-switcher'

  " Color schemes.
  Plug 'ayu-theme/ayu-vim'
  Plug 'nanotech/jellybeans.vim'

  Plug 'nvim-lua/plenary.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'MunifTanjim/nui.nvim'
  Plug 'nvim-neo-tree/neo-tree.nvim'

  Plug 'jlanzarotta/bufexplorer'
  Plug 'evanleck/vim-svelte', {'branch': 'main'}
  Plug 'wfxr/minimap.vim'

  Plug 'nvim-lua/plenary.nvim'
  " Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
  Plug 'nvim-telescope/telescope.nvim'

  " Semantic language support
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'neovim/nvim-lspconfig'
  " Plug 'nvim-lua/lsp_extensions.nvim'
  Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
  Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
  Plug 'hrsh7th/cmp-path', {'branch': 'main'}
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
  Plug 'ray-x/lsp_signature.nvim'

  " # RUST
  Plug 'simrat39/rust-tools.nvim'

  " # RUST DEBUGGING
  Plug 'nvim-lua/plenary.nvim'
  Plug 'mfussenegger/nvim-dap'

  Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

  " Trouble https://github.com/folke/trouble.nvim
  Plug 'folke/trouble.nvim'

  " Only because nvim-cmp _requires_ snippets
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  " Syntactic language support
  " Plug 'cespare/vim-toml'
  " Plug 'stephpy/vim-yaml'
  " Plug 'rust-lang/rust.vim'
  " Plug 'rhysd/vim-clang-format'
  " "Plug 'fatih/vim-go'
  " Plug 'dag/vim-fish'
  " Plug 'godlygeek/tabular'
  " Plug 'preservim/vim-markdown'

  " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  "" You may need to run this after PlugInstall for treesitter to work propperly
  "" $nvim --headless -c "TSInstallSync bash c" -c q
  "" $ nvim --headless -c "TSUpdateSync" -c q
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'folke/which-key.nvim'

  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-ui'
  Plug 'kristijanhusak/vim-dadbod-completion'
  Plug 'google/vim-maktaba'
  Plug 'bazelbuild/vim-bazel'
  Plug 'rebelot/kanagawa.nvim'

  "" For C#
  Plug 'Hoffs/omnisharp-extended-lsp.nvim'
  Plug 'sbdchd/neoformat'

  Plug 'ray-x/go.nvim'
  Plug 'slint-ui/vim-slint'

  " Plug 'elmcast/elm-vim'
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
call plug#end()
