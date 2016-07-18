""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Add # encoding: UTF-8 to top of file.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! InsertRubyUtf8 :normal ggi<CR><ESC>ggi<c-r>'# encoding: UTF-8<ESC>
map <leader>8 :InsertRubyUtf8<CR>
