" colorscheme-switcher
"   plugin xolox/vim-colorscheme-switcher
map <F7> :PrevColorScheme<CR>
map <F6> :colorscheme<CR>

if (has("termguicolors"))
  set termguicolors
endif
syntax enable
colorscheme ayu

" colorscheme woju
" colorscheme palenight
" colorscheme apprentice
" colorscheme solarized
" colorscheme zenburn
" colorscheme zephyr
" colorscheme base16-horizon-dark
" colorscheme behelit

" Mark the 80 column
let &colorcolumn=join(range(82,999),",")
highlight ColorColumn ctermbg=232 guibg=#2c2d27

set background=dark
