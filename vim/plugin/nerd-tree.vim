"" NERDTree
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
" Open file file explorer on Mac-Book Pro where the F2 key is not on all the
" time
nmap <silent> <C-F> :call ToggleNerdTree()<CR>

"" Now you can just click on any thing and it just reacts (open or close
"" folders, and open files)
let NERDTreeMouseMode=1

"" sort files and folders by name
" let NERDTreeSortOrder = ['(*|\/$)', '\.swp$', '\.bak$', '\~$']

"" Hide bundler_stubs
let NERDTreeIgnore=['^.git$', '^bundler_stubs$', '\~$', '\.pyc$', '\.pyo$']


