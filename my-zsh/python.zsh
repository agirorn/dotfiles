# Configuring python.
export PYTHONSTARTUP=~/.pythonrc

###############################################################################
# Python virtualenvwrapper http://virtualenvwrapper.readthedocs.org/en/latest/
#
# Don't forget: pip install virtualenvwrapper
###############################################################################
export WORKON_HOME=~/workon_envs

if [[ ! -d $WORKON_HOME ]]; then
  mkdir -p $WORKON_HOME
fi

if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi
