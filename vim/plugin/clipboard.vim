"" Configure clipboard to work with system clipboard.
if has("mac")
  "" Copy to clipboard on Mac OS X
  set clipboard=unnamed
else
  "" Copy to clipboard on Ubuntu Linux
  set clipboard=unnamedplus
endif
