alias ND='NODE_ENV=development'
alias gdd='grunt dev'
alias nns='ND npm start'
alias wgs='while :; do clear && git status; sleep 1; done;'
alias c='clear'
alias kill-swap='find . -iname ".*.swp" -exec rm {} \;'
alias remove-vim-swap='find . -iname '.*.swp' -exec rm {} \;'
alias atome="tmpin atom"

# run command for ever with 1 sec delay.
#
# loop 'echo "nothing"; ls -l'
function loop() {
  while :; do clear && eval "$@"; sleep 1; done
}
