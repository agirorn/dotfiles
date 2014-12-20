# Aliases to control Postgres
# Paths noted below are for Postgres installed via Homebrew on OSX

alias ps_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias ps_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias ps_restart='stoppost && sleep 1 && startpost'
alias ps_reload='pg_ctl reload -D /usr/local/var/postgres -s'
alias ps_status='pg_ctl status -D /usr/local/var/postgres -s'
