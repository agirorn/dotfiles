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

function python_tests() {
  # run tests for a python project in a infinite loop
  # with a default 60 sec delay between runs.

  delay=$1
  if [ -z "$delay" ]; then
    delay=60
  fi

  while :; do
    clear
    if which -s jasmine-ci >> /dev/null; then
      jasmine-ci --browser phantomjs
    fi

    # Only if Jasmine's tests pass.
    if [ $? -eq 0 ]; then
      if which -s nosetests >> /dev/null ; then
        SELENIUM_DRIVER=PhantomJS nosetests tests/
      fi
    fi

    sleep $delay
  done
}

alias nn='nosetests'
