# This scripts is copied from (MIT License):
# https://raw.githubusercontent.com/dotnet/sdk/main/scripts/register-completions.zsh

_dotnet_completion() {
  local -a completions=("${(@f)$(dotnet complete "${words}")}")
  compadd -a completions
  _files
}

compdef _dotnet_completion dotnet
