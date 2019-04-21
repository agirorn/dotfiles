"" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:vim_json_syntax_conceal = 0

"" json
au FileType json setlocal nospell
autocmd BufNewFile,BufRead .jshintrc setlocal filetype=json
autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json
