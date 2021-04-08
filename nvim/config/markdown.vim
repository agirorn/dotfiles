let g:markdown_fenced_languages = [
\    'c',
\    'cmake',
\    'cpp',
\    'css',
\    'erb=eruby',
\    'gql=graphql',
\    'graphql',
\    'javascript',
\    'js=javascript',
\    'json',
\    'python',
\    'ruby',
\    'sass',
\    'sh',
\    'bash=sh',
\    'shell=sh',
\    'sql',
\    'typescript',
\    'ts=typescript',
\    'vim',
\    'xml',
\    'yaml'
\  ]

" Reuse the default nvim cnfig config for plugin plasticboy/vim-markdown
let g:vim_markdown_fenced_languages = g:markdown_fenced_languages
