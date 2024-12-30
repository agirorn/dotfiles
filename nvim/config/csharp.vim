let g:neoformat_enabled_cs = ['csharpier']
autocmd BufWritePre *.cs silent! Neoformat
