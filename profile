#
# My .profile file ;)
#
echo .profile
[[ -r $HOME/.bashrc ]] && . $HOME/.bashrc

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
test -d ${HOME}/.rd/bin && export PATH=${HOME}/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
test -f "$HOME/.cargo/env" && . "$HOME/.cargo/env"

test -f "$HOME/.local/bin/env" && source "$HOME/.local/bin/env"
