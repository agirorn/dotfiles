#
# My .profile file ;)
#

# the basics
: ${HOME=~}
: ${LOGNAME=$(id -un)}
: ${UNAME=$(uname)}

# OLD WAY Mac ports path
# For some reason fixes macports
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# MacPorts Installer addition on 2010-01-12_at_15:57:14: adding an appropriate PATH variable for use with MacPorts.

test -d /usr/local/sbin && PATH="/usr/local/sbin:$PATH"
test -d /usr/local/sbin && PATH="/usr/local/sbin:$PATH"
test -d /usr/local/bin  && PATH="/usr/local/bin:$PATH"
test -d /opt/local/sbin && PATH="/opt/local/sbin:$PATH"
test -d /opt/local/bin  && PATH="/opt/local/bin:$PATH"
test -d ~/bin           && PATH="$PATH:~/bin"

# Node.js
[ -d $HOME/local/node/bin ] && PATH=$HOME/local/node/bin:$PATH
export PATH

test -d /usr/local/share/man && MANPATH="/usr/local/share/man:$MANPATH"
test -d /opt/local/share/man && MANPATH="/opt/local/share/man:$MANPATH"
export MANPATH

export INFOPATH="/usr/local/share/info:$INFOPATH"

# SET LOCAL TO UTF-8
export LC_ALL=is_IS.UTF-8

# Set vim as my editor
export EDITOR=vim
export VISUAL=vim

# History controle
export HISTCONTROL=erasedups
export HISTSIZE=999
shopt -s histappend

# Custom bash compleations
test -d ~/.bash/completion && source ~/.bash/completion/*
test -r $rvm_path/scripts/completion && . $rvm_path/scripts/completion

# Custom bash things
test -d ~/.bash && source ~/.bash/*

# Auto complete git.
test -f /opt/local/etc/profile.d/bash_completion.sh && source /opt/local/etc/profile.d/bash_completion.sh

# Bash completion
test -f /opt/local/share/doc/git-core/contrib/completion/git-prompt.sh && source /opt/local/share/doc/git-core/contrib/completion/git-prompt.sh

# Oracle client breyta.
test -d /opt/oracle/instantclient_10_2 && export DYLD_LIBRARY_PATH=/opt/oracle/instantclient_10_2

# ODBC
test -f ~/.odbc.ini && export ODBCINI=~/.odbc.ini

# Einhver er að Íslenska Git og það er fáránlegt.
alias git='LC_ALL="en_US.UTF-8" git'

# Hostcomplete
: ${HOSTFILE=~/.ssh/known_hosts}
shopt -s hostcomplete >/dev/null 2>&1

# Color grep output
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

# ----------------------------------------------------------------------
# MACOS X / DARWIN SPECIFIC
# ----------------------------------------------------------------------
if [ "$UNAME" = Darwin ]; then
  # Run tmux if it's not running and use the latest bash if avalable
  if [ -x /opt/local/bin/bash ]; then
    test -z $TMUX && tmux -2 new-session "/opt/local/bin/reattach-to-user-namespace /opt/local/bin/bash -l"
  else
    test -z $TMUX && tmux -2 new-session "/bin/bash -l"
  fi
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
