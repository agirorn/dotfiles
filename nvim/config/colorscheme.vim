if (has("termguicolors"))
  set termguicolors
endif
syntax enable

" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme

" #######################################################
" OLD find colorscheme
" #######################################################
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu

" let g:nord_custom_bg = '#262C38' " Just a litle darker background

" #######################################################
" Nord colorscheme
"
" https://www.nordtheme.com/ports/vim
" #######################################################
" colorscheme nord
" execute 'hi Normal guibg=' . g:nord_custom_bg . ' ctermbg=NONE'
" execute 'hi NormalNC guibg=' . g:nord_custom_bg
" execute 'hi EndOfBuffer guibg=' . g:nord_custom_bg
" execute 'hi VertSplit guibg=' . g:nord_custom_bg
" execute 'hi StatusLine guibg=' . g:nord_custom_bg
" execute 'hi LineNr guibg=' . g:nord_custom_bg


" colorscheme tokyonight-night
colorscheme yorumi
" colorscheme kanagawa

" colorscheme onedarker
" colorscheme jellybeans
" colorscheme kanagawa
" colorscheme catppuccin-mocha
" colorscheme tokyonight-night

if $AEGIRORN_CUSTOM_NVIM_WIDTH == ''
  " Mark the 80 column
  let &colorcolumn=join(range(82,999),",")
  " autocmd! BufEnter * match ErrorMsg /\%>81c/
else
  " Mark the custom width column
  let &colorcolumn=join(range($AEGIRORN_CUSTOM_NVIM_WIDTH,999),",")
endif
highlight ColorColumn ctermbg=232 guibg=#2c2d27

" Change the editor space to 100cols for rust
autocmd FileType rust set colorcolumn=101,999

" " colorscheme-switcher
" "   plugin xolox/vim-colorscheme-switcher
" map <F7> :PrevColorScheme<CR>
" map <F6> :colorscheme<CR>

" " Print the Highlighting group under the cursor
" " Very nice to have when things are not look exactly as planed
" function! EchoHighlightingGroupUnderTheCursor()
"   if !exists("*synstack")
"     return
"   endif
"   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfunc
" map <F5> :call EchoHighlightingGroupUnderTheCursor()<CR>
" autocmd CursorMoved * call EchoHighlightingGroupUnderTheCursor() 
