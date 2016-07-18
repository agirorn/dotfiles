function! SetupVimrc()
  let l:vimrc_spellfile = expand('$HOME').'/.vim/spell/vimrc.utf-8.add'
  echo "file is readable"
  let &l:spellfile = l:vimrc_spellfile
  setlocal spell
  setlocal spelllang=en_us
endfunction

autocmd BufNewFile,BufRead vimrc,.vimrc call SetupVimrc()

"" Load a project .vimrc
if filereadable(".vimrc") && expand('~') != getcwd()
  source .vimrc
endif
