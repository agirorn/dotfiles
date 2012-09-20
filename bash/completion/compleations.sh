c() { cd ~/code/$1 ; }

_code() {
    local cur
    cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $( compgen -d ~/code/$cur | perl -pi -e 's/.*\/(.*)/$1\//g' ) )
}

complete -o nospace -F _code c