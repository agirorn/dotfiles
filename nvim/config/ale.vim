" let g:ale_disable_lsp = 1

" Set this variable to 1 to fix files when you save them.
" let g:ale_fix_on_save = 1

" Keep the sign gutter open at all times
let g:ale_sign_column_always = 1

let g:ale_linters = {
\  'javascript': ['eslint'],
\  'typescript': ['eslint'],
\  'python': ['flake8', 'pylint'],
\}

nmap <silent> N :ALENextWrap<cr>
" nmap <silent> P :ALEPreviousWrap<cr>

command! ALEIgnoreEslint call AleIgnoreEslint()
function! AleIgnoreEslint()
  " https://stackoverflow.com/questions/54961318/vim-ale-shortcut-to-add-eslint-ignore-hint
  let l:codes = []
  if (!exists('b:ale_highlight_items'))
    echo 'cannot ignore eslint rule without b:ale_highlight_items'
    return
  endif
  for l:item in b:ale_highlight_items
    if (l:item['lnum']==line('.') && l:item['linter_name']=='eslint')
      let l:code = l:item['code']
      call add(l:codes, l:code)
    endif
  endfor
  if len(l:codes)
    exec 'normal O// eslint-disable-next-line ' . join(l:codes, ', ')
  endif
endfunction
nmap <F7> :ALEIgnoreEslint <cr>
