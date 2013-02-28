export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# SET LOCAL TO UTF-8
export LC_ALL=is_IS.UTF-8

# Set vim as my editor
export EDITOR=vim
export VISUAL=vim

# History controle
export HISTCONTROL=erasedups
export HISTSIZE=999
shopt -s histappend

[ -r /usr/local/etc/bash_completion.d/git-completion.bash ] && source /usr/local/etc/bash_completion.d/git-completion.bash
[ -r /usr/local/etc/bash_completion.d/git-prompt.sh ] && source /usr/local/etc/bash_completion.d/git-prompt.sh

[ -r ~/.bash/prompt.sh ] && source ~/.bash/prompt.sh
[ -r ~/.bash/aliases.sh ] && source ~/.bash/aliases.sh
[ -r ~/.bash/ls_colors.sh ] && source ~/.bash/ls_colors.sh
[ -r ~/.bash/bundler_mate.sh ] && source ~/.bash/bundler_mate.sh
[ -r /opt/local/etc/profile.d/bash_completion.sh ] && source /opt/local/etc/profile.d/bash_completion.sh
[ -r /opt/local/share/doc/git-core/contrib/completion/git-prompt.sh ] && source /opt/local/share/doc/git-core/contrib/completion/git-prompt.sh

# Custom bash compleations
[ -r ~/.bash/completion/rake.sh ] && source ~/.bash/completion/rake.sh
[ -r ~/.bash/completion/capistrano.sh ] && source ~/.bash/completion/capistrano.sh
[ -r ~/.bash/completion/code.sh ] && source ~/.bash/completion/code.sh
[ -r ~/.bash/completion/compleations.sh ] && source ~/.bash/completion/compleations.sh
[ -r ~/.bash/completion/tmux-completion.sh ] && source ~/.bash/completion/tmux-completion.sh
[ -r $rvm_path/scripts/completion ] && source $rvm_path/scripts/completion
[ -r ~/.bash/bundler_mate.sh ] && source ~/.bash/bundler_mate.sh

# Hostcomplete
: ${HOSTFILE=~/.ssh/known_hosts}
shopt -s hostcomplete >/dev/null 2>&1

tmux
