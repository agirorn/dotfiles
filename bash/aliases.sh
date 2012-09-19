alias console='script/console'
alias resource='source ~/.profile'

# MySql Aliases.
alias mysql_start='sudo /opt/local/etc/LaunchDaemons/org.macports.mysql5/mysql5.wrapper start'
alias mysql_stop='sudo /opt/local/etc/LaunchDaemons/org.macports.mysql5/mysql5.wrapper stop'
alias mysql_restart='sudo /opt/local/etc/LaunchDaemons/org.macports.mysql5/mysql5.wrapper restart'

# Usefull for runing a single test.
alias rubyt='ruby -Ilib:test'

alias bi='bundle install --path vendor'
alias be='bundle exec'
alias bu="bundle update"
alias binit="bi && bundle package && echo 'vendor/ruby' >> .gitignore"

alias nginx_restart='sudo kill `cat /opt/local/var/run/nginx/nginx.pid`'

# nginx short cuts
alias start_nginx='sudo launchctl load -w /Library/LaunchDaemons/org.macports.nginx.plist'
alias stop_nginx='sudo launchctl unload -w /Library/LaunchDaemons/org.macports.nginx.plist'
alias restart_nginx='sudo launchctl unload -w /Library/LaunchDaemons/org.macports.nginx.plist; sudo launchctl load -w /Library/LaunchDaemons/org.macports.nginx.plist'
alias ports_listengin="lsof -i -P| grep 'LISTEN'"
alias '^l'=clear
alias tmux='tmux -2'

alias l="ls -lh"
alias ll="ls -l"


