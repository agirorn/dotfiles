_pip_completion() {
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    pip="${COMP_WORDS[0]}"

    commands=$($pip --help | awk '/Commands\:/,/General Options\:/' | \
               \grep -E -o "^\s{2}\w+" | tr -d ' ')

    # Fallback for pip version 1.1
    if [ -z "$commands" ]; then
        commands=$($first --help | awk '/Commands available/,/Commands\:/' | \
               \grep -E -o "^\s{2}\w+" | tr -d ' ')
    fi

    opts=$($pip --help | \grep -E -o "((-\w{1}|--(\w|-)*=?)){1,2}")

    if [ $COMP_CWORD == 1 ] ; then
        COMPREPLY=( $(compgen -W "${commands}" -- ${cur}) )
        return 0
    fi

    if [[ ${cur} == -* ]] ; then
        local command_opts=$($pip $prev --help | \
                             \grep -E -o "((-\w{1}|--(\w|-)*=?)){1,2}")
        COMPREPLY=( $(compgen -W "${command_opts}" -- ${cur}) )
        return 0
    fi
}

complete -o default -F _pip_completion pip
complete -o default -F _pip_completion pip2
complete -o default -F _pip_completion pip3
