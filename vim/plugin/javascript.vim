"" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:vim_json_syntax_conceal = 0

let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 1

"" json
au FileType json setlocal nospell
autocmd BufNewFile,BufRead .jshintrc setlocal filetype=json
autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript
augroup END
