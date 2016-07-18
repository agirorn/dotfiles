"" vim-javascript
let g:javascript_plugin_jsdoc = 1

"" javascript
autocmd BufNewFile,BufRead .jshintrc setlocal filetype=json nospell
autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json nospell

"" GYP syntax ( Generate Your Projects )
au BufRead,BufNewFile *.gyp set filetype=json
