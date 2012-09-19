export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

_capcomplete() {
	if [ ! -e Capfile ]; then
		return
	fi
  COMPREPLY=($(compgen -W "`cap  -T  2>/dev/null| awk '{{ if ( $3 ~ /\#/ ) print $2}}'`" -- ${COMP_WORDS[COMP_CWORD]}))
  return 0
}
 
complete -o default -o nospace -F _capcomplete cap