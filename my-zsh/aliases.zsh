alias ND='NODE_ENV=development'
alias gdd='grunt dev'
alias nns='ND npm start'
alias wgs='while :; do clear && git status; sleep 1; done;'
alias c='clear'
alias kill-swap='find . -iname ".*.swp" -exec rm {} \;'
alias remove-vim-swap="find . -iname '.*.swp' -exec rm {} \;"
alias atome="tmpin atom"
alias dev="npm run dev"
# SUDO nvm nodejs
alias snode="sudo PATH=\$(dirname \$(which node)):\$PATH"

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
