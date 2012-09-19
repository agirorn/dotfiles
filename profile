#
# My .profile file ;)
#

# the basics
: ${HOME=~}
: ${LOGNAME=$(id -un)}
: ${UNAME=$(uname)}

# MacPorts Installer addition on 2010-01-12_at_15:57:14: adding an appropriate PATH variable for use with MacPorts.
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/local/sbin:$PATH"
export PATH="/opt/local/bin:$PATH"
export PATH="$PATH:~/bin"
export MANPATH="/usr/local/share/man:$MANPATH"
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

# My custom bash compleations
source ~/.bash/completion/rake.sh
source ~/.bash/completion/capistrano.sh
source ~/.bash/completion/code.sh

# My custom prompt
source ~/.bash/prompt.sh
source ~/.bash/ls_colors.sh
source ~/.bash/aliases.sh

# Auto complete git.
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

# Bash completion
if [ -f /opt/local/share/doc/git-core/contrib/completion/git-prompt.sh ]; then
  . /opt/local/share/doc/git-core/contrib/completion/git-prompt.sh
fi


# Oracle client breyta.
test -d /opt/oracle/instantclient_10_2 && export DYLD_LIBRARY_PATH=/opt/oracle/instantclient_10_2

# ODBC
test -f ~/.odbc.ini && export ODBCINI=~/.odbc.ini

# Einhver er að Íslenska Git og það er fáránlegt.
alias git='LC_ALL="en_US.UTF-8" git'

# Hostcomplete
: ${HOSTFILE=~/.ssh/known_hosts}
shopt -s hostcomplete >/dev/null 2>&1


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
