# Profile the zsh boot
# zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/dotfiles/my-zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  bazel
  bower
  bundler
  cargo
  docker
  docker-compose
  fabric
  fzf
  git
  git-extras
  git-kraken
  gitx
  grunt
  highlight
  history-substring-search
  karma
  mvn
  my-perl
  my-react
  my-yarn
  nvm
  nvmrc
  pip
  postgres
  # pyenv
  ripgrep
  rust
  rustup
  rvm
  urltools
  vagrant
  vi-mode
  yarn
  zsh-better-npm-completion
)

# User configuration

export PATH="/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
test -d $HOME/bin && export PATH="$PATH:$HOME/bin"
test -d $HOME/work-bin && export PATH="$PATH:$HOME/work-bin"
test -d $HOME/.local/bin && export PATH="$PATH:$HOME/.local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=is_IS.UTF-8
export LC_CTYPE=is_IS.UTF-8

export EDITOR='nvim'

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias gs=gss
alias npm-exec='PATH=$(npm bin):$PATH'

function gdwide() {
  git difftool --no-prompt --extcmd="colordiff -ydw"  $1| less
}

# No delay
export KEYTIMEOUT=1

[[ -s "/home/agirorn/.gvm/scripts/gvm" ]] && source "/home/agirorn/.gvm/scripts/gvm"

setopt noincappendhistory
setopt nosharehistory
export LUCINITY_UPDATE_RC=false
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=false


eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Dirty hack since for some reason nvm does not use the correct version
nvm use default
