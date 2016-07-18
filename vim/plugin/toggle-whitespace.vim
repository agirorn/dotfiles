function! ToggleWhitespace()
  if !exists("w:listchars")
    let w:listchars=&listchars
    set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
    set list
  else
    let &listchars=w:listchars
    unlet w:listchars
    set nolist
  end
endfunction
command! ToggleWhitespace execute ToggleWhitespace()
