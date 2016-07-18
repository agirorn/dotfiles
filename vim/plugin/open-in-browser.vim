"" Lookup the current word on dictionary.com
function! LookupCurrentWordOnDictionaryCom()
  :silent ! open http://dictionary.reference.com/browse/<cword>
  redraw!
endfunction
map <leader>D :call LookupCurrentWordOnDictionaryCom()<CR>

"" Lookup the current word on ikea.is
function! LookupCurrentWordOnIkeaIs()
  :silent ! open http://www.ikea.is/search\?\&search=<cword>
  redraw!
endfunction
map <leader>I :call LookupCurrentWordOnIkeaIs()<CR>

"" Lookup the current word on ikea.is
function! OpenVimCheatSheet()
  :silent ! open http://www.worldtimzone.com/res/vi.html
  redraw!
endfunction
map <leader>c :call OpenVimCheatSheet()<CR>
