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
test -d /usr/local/share/npm/bin && PATH="${PATH}:/usr/local/share/npm/bin"

# Node.js
[ -d $HOME/local/node/bin ] && PATH=$HOME/local/node/bin:$PATH
export PATH

test -d /usr/local/share/man && MANPATH="/usr/local/share/man:$MANPATH"
test -d /opt/local/share/man && MANPATH="/opt/local/share/man:$MANPATH"
export MANPATH

export INFOPATH="/usr/local/share/info:$INFOPATH"

# SET LOCAL TO UTF-8
# expor LC_ALL=is_IS.UTF-8

# Set vim as my editor
export EDITOR=vim
export VISUAL=vim

# History controle
export HISTCONTROL=erasedups
export HISTSIZE=999
shopt -s histappend

# Python
export PYTHONSTARTUP=~/.pythonrc
test -d ~/Library/Python/2.7/bin && PATH=$PATH:~/Library/Python/2.7/bin
export PATH

# Python virtualenvwrapper http://virtualenvwrapper.readthedocs.org/en/latest/
export WORKON_HOME=~/workon_envs
mkdir -p $WORKON_HOME
test -f /usr/local/bin/virtualenvwrapper.sh && source /usr/local/bin/virtualenvwrapper.sh

###########################################################################
# sources(dir)
#
# This function sources any file or all files in directory if they exist.
###########################################################################
function sources {
  local dir=$1
  local file=$1
  test -f $file && source $file

  test ! -d $dir && return 1
  for file in $dir/*; do
    test -f $file && source $file;
  done
}


sources $rvm_path/scripts/completion # RVM
sources /opt/local/etc/profile.d # Mac Ports
sources /opt/local/share/doc/git-core/contrib/completion/git-prompt.sh # Mac Ports
sources /usr/local/git/contrib/completion/git-prompt.sh
sources /usr/local/git/contrib/completion/git-completion.bash
sources /usr/local/etc/bash_completion.d # HomeBrew
sources ~/.bash/completion
sources ~/.bash

# Oracle client breyta.
test -d /opt/oracle/instantclient_10_2 && export DYLD_LIBRARY_PATH=/opt/oracle/instantclient_10_2
test -d /opt/oracle/instantclient_11_2 && export DYLD_LIBRARY_PATH=/opt/oracle/instantclient_11_2

# ODBC
test -f ~/.odbc.ini && export ODBCINI=~/.odbc.ini

# Einhver er að Íslenska Git og það er fáránlegt.
alias git='LC_ALL="en_US.UTF-8" git'

# Hostcomplete
: ${HOSTFILE=~/.ssh/known_hosts}
shopt -s hostcomplete >/dev/null 2>&1

alias http_start='python -m SimpleHTTPServer'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
