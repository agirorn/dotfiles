bindkey -v

# Ensure you can delete backwards past starting point
# Gotten from http://www.zsh.org/mla/users/2009/msg00812.html
bindkey "^W" backward-kill-word    # vi-backward-kill-word
bindkey "^H" backward-delete-char  # vi-backward-delete-char
bindkey "^U" kill-line             # vi-kill-line
bindkey "^?" backward-delete-char  # vi-backward-delete-char

# No delay
export KEYTIMEOUT=1

