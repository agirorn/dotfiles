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
