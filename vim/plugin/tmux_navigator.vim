"
"" Fixes a redraw issue  when using tmux + vim + syntastic
""
"" https://github.com/vim-syntastic/syntastic/issues/822
"
autocmd VimEnter * nnoremap <silent> <c-j> :TmuxNavigateDown<cr>:redraw!<cr>
