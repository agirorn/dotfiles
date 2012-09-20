# command compleation for nown rake commands.

export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

_capistrano_complete() {
  COMPREPLY=($(compgen -W "`cap -T | grep '#' |awk '{{print $2}}'`" -- ${COMP_WORDS[COMP_CWORD]}))
  return 0
}
complete -o default -o nospace -F _capistrano_complete cap