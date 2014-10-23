# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

if [ -d ~/mbl_env ] ; then
  # if running bash
  if [ -n "$BASH_VERSION" ]; then
      # include .bashrc if it exists
      if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
      fi
  fi

  # set PATH so it includes user's private bin if it exists
  if [ -d "$HOME/bin" ] ; then
      PATH="$HOME/bin:$PATH"
  fi
  export PATH

  alias mbl_activate='source ~/mbl_env/bin/activate'
  alias mbl_start_server='cd ~/dj/apps && ./manage.py runserver 0.0.0.0:3030'
  alias mbl_mason_start='cd ~/mason/psgi/ && plackup -p 3040 devel.psgi'
  alias mbl_shell='cd ~/dj/apps && ./manage.py shell'
  alias mbl_compass_watch='cd ~/dj/compass/ && compass watch'
  alias mbl_python_update='cd ~/dj/ && pip install -r requirements.txt --upgrade'

  # configurein Perl and Mason
  # gotten from running this command: perl -Mlocal::lib
  export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:/home/agir/perl5";
  export PERL_MB_OPT="--install_base /home/agir/perl5";
  export PERL_MM_OPT="INSTALL_BASE=/home/agir/perl5";
  export PERL5LIB="/home/agir/perl5/site-perl:$PERL5LIB";
  export PATH="/home/agir/perl5/bin:$PATH";

fi
