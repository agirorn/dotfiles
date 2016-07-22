"" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:vim_json_syntax_conceal = 0

"" javascript
autocmd BufNewFile,BufRead .jshintrc setlocal filetype=json nospell
autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json nospell

"" GYP syntax ( Generate Your Projects )
au BufRead,BufNewFile *.gyp set filetype=json
