""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""  Read output from shell command into a new buffer
""  R <shell commands>| vim -
""
"" http://vim.wikia.com/wiki/Append_output_of_an_external_command
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:command! -nargs=* -complete=shellcmd R new | setlocal
  \ buftype=nofile bufhidden=hide noswapfile | r !<args>
