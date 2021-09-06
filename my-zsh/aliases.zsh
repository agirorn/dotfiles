alias ND='NODE_ENV=development'
alias gdd='grunt dev'
alias nns='ND npm start'
alias wgs='while :; do clear && git status; sleep 1; done;'
alias c='clear'
alias kill-swap='find . -iname ".*.swp" -exec rm {} \;'
alias remove-vim-swap="find . -iname '.*.swp' -exec rm {} \;"
alias atome="tmpin atom"
# SUDO nvm nodejs
alias snode="sudo PATH=\$(dirname \$(which node)):\$PATH"

# Only using neovim now
alias vim=nvim

# Start PostgreSQL
alias pg-start="pg_ctl -D /usr/local/var/postgres start"

# Mac only aliases
if [[ `uname` == 'Darwin' ]]; then
  alias abricotine=/Applications/Abricotine.app/Contents/MacOS/Abricotine
fi

unalias gm

# close like vim
alias :q=exit

# run command for ever with 1 sec delay.
#
# loop 'echo "nothing"; ls -l'
function loop() {
  while :; do clear && eval "$@"; sleep 1; done
}

# kill all running vim editors
function kill-all-vims() {
  ps aux | grep vim | grep -v grep | awk '{print $2}' | xargs -L1 kill -s kill
}

# Open all files found by ripgrep in vim
#
# https://github.com/BurntSushi/ripgrep
function vrg() { nvim `rg -l $@` }

# Open files marked as changed by git in vim
function vgchanged() {
  folder='.'
  if (( ${+1} )); then
    # echo $ 1 is set to $1
    folder=$1
    # else
    # echo $ 1 is NOT set to ANYTHING
  fi
  echo $folder

  nvim `git status -s $folder | awk '{print $2}'`
}

export PATH="$(yarn global bin):$PATH"
export PATH="$HOME/bin:$PATH"

## This is to get python 3.8.0 installed on mac os
# https://github.com/pyenv/pyenv/issues/1740
# And the commadn to install python also requiers a patch
# pyenv install 3.8.0 --patch < <(curl -sSL https://github.com/python/cpython/commit/8ea6353.patch)
test -d /usr/local/opt/zlib/li && \
  bexport LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
test -d /usr/local/opt/zlib/include && \
  export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# This is required by PYENV for seom strange reason the plugin can not just
# figure this out
export ZSH_PYENV_QUIET=true
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
