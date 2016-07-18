function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

"" Syntastic plugin.
let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pep8']
let g:syntastic_javascript_checkers = ['eslint']

"" lint scss files with https://github.com/brigade/scss-lint
let g:syntastic_scss_checkers = ['scss_lint']

"" find the right eslint for syntastic to use.
let b:syntastic_javascript_eslint_exec = StrTrim(system('npm-which eslint'))

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

let g:syntastic_echo_current_error=1

