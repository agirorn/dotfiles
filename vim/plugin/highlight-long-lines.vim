autocmd VimEnter,BufEnter,WinEnter,BufWinEnter * call HighlightLongLines()
function! HighlightLongLines()
  highlight ColorColumn ctermbg=magenta guibg=Magenta
  call matchadd('ColorColumn', '\%82v', 100)
endfunction
