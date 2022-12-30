#
# My .profile file ;)
#
source "$HOME/.cargo/env"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
test -d $HOME/work-bin && export PATH="$PATH:$HOME/work-bin"
eval "$(pyenv init --path)"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH=${HOME}/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
