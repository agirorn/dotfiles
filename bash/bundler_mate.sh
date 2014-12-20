# Open a bundlerd Gem in textmate
function bmate {
  if [ ! -e Gemfile ]; then
    echo "Nothing to do since there's no Gemfile in the current directory"
    return
  fi

  if [ -z $1 ]; then
    echo "Can't show you an unnamed bundler"
    return
  fi

  mate `bundle show $1`
}

_bmatecomplete() {
  if [ ! -e Gemfile ]; then return; fi
  COMPREPLY=($(compgen -W "`bundle show | awk '{{print $2}}'`" -- ${COMP_WORDS[COMP_CWORD]}))
  return 0
}
complete -o default -o nospace -F _bmatecomplete bmate
