# Compleation for Fabric! http://www.fabfile.org/
_fab_completion() {
  COMPREPLY=()

  local cur="${COMP_WORDS[COMP_CWORD]}"

  local tasks=$(fab --shortlist 2>/dev/null)
  COMPREPLY=( $(compgen -W "${tasks}" -- ${cur}) )
}
complete -F _fab_completion fab
