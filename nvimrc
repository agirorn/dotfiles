" You may need to install plugins for Coc.vim
"
" CocInstall coc-json coc-tsserver coc-css coc-python coc-rls
" CocInstall coc-svelte coc-tailwindcss coc-sql coc-xml coc-yaml
"
set runtimepath^=~/.nvim runtimepath+=~/.nvim/after
let &packpath = &runtimepath
source $HOME/.nvim/vim-plug/plugins.vim
for f in split(glob('~/.nvim/plugins/*.vim'), '\n')
    exe 'source' f
endfor
for f in split(glob('~/.nvim/config/*.vim'), '\n')
    exe 'source' f
endfor
