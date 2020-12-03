function! s:Trim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

"" Syntastic plugin.
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_auto_loc_list = 2
let g:syntastic_loc_list_height = 10
let g:syntastic_check_on_wq = 0
let g:syntastic_echo_current_error = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_loc_list_height = 1
let g:syntastic_python_checkers = ['pep8']
let g:syntastic_vue_checkers = ['eslint']

"" lint scss files with https://github.com/brigade/scss-lint
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_filetype_map = { "javascriptreact": "javascript" }

" javascript
" let s:eslint = s:Trim(system('npm-which eslint'))
" let g:syntastic_javascript_eslint_exec = s:eslint
" let g:syntastic_vue_eslint_exec = s:eslint

" ruby
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_markdown_mdl_exec = './node_modules/.bin/markdownlint'
let g:syntastic_markdown_mdl_args = ''

" AngularJs
"" Ignore the proprietary attribute that are used in AngularJs
let g:syntastic_html_tidy_ignore_errors=[
  \ "trimming empty <span>",
  \ "proprietary attribute"
  \]

let g:syntastic_mode_map={
  \ 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': ['eruby', 'html']
\ }

