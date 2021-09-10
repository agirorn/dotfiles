#
# My .profile file ;)
#
source "$HOME/.cargo/env"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
test -d $HOME/work-bin && export PATH="$PATH:$HOME/work-bin"
eval "$(pyenv init --path)"
