#
# My .profile file ;)
#
echo .profile
[[ -r $HOME/.bashrc ]] && . $HOME/.bashrc

### NOT MANAGED BY RANCHER DESKTOP START (I CAN EDIT)
test -d "$HOME/.rd/bin" && export PATH="$HOME/.rd/bin:$PATH"
### NOT MANAGED BY RANCHER DESKTOP END (I CAN EDIT)
test -f "$HOME/.cargo/env" && . "$HOME/.cargo/env"

test -f "$HOME/.local/bin/env" && source "$HOME/.local/bin/env"
