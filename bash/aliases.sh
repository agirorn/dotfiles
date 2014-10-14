alias console='script/console'
alias resource='source ~/.profile'

# MySql Aliases.
alias mysql_start='sudo /opt/local/etc/LaunchDaemons/org.macports.mysql5/mysql5.wrapper start'
alias mysql_stop='sudo /opt/local/etc/LaunchDaemons/org.macports.mysql5/mysql5.wrapper stop'
alias mysql_restart='sudo /opt/local/etc/LaunchDaemons/org.macports.mysql5/mysql5.wrapper restart'

# iOs Simulator
alias iphone="open '/Applications/Xcode.app/Contents/Developer/Applications/iOS Simulator.app'"

# Usefull for runing a single test.
alias rubyt='ruby -Ilib:test'

alias bi='bundle install --path vendor'
alias be='bundle exec'
alias bu="bundle update"
alias binit="bi && bundle package && echo 'vendor/ruby' >> .gitignore"

alias nginx_restart='sudo kill `cat /opt/local/var/run/nginx/nginx.pid`'

# nginx short cuts

alias stop_nginx='sudo launchctl unload -w /Library/LaunchDaemons/org.macports.nginx.plist'
alias restart_nginx='sudo launchctl unload -w /Library/LaunchDaemons/org.macports.nginx.plist; sudo launchctl load -w /Library/LaunchDaemons/org.macports.nginx.plist'
alias ports_listengin="lsof -i -P| grep 'LISTEN'"
alias '^l'=clear
alias tmux='tmux -2'
alias tmuxpwd='tmux set default-path `pwd`'

alias ls='ls -G'
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias ll="ls -la"
else
  alias ll="ls -lf"
fi
alias l="ll"
alias la="ls -la"

alias o="open ."

alias m="mate ."

alias beep='echo -en "\007"; growlnotify -m "BEEP"'
alias sbeep='growlnotify -m "BEEP :: SILENT"'
alias gdone='growlnotify -m "BEEP :: DONE :: DONE :: DONE"'

alias total='du -hc | grep total'

# Bundler aliases.
# http://ryan.mcgeary.org/2011/02/09/vendor-everything-still-applies/
alias b="bundle"
alias bi="bundle install --path vendor"
alias bu="bundle update"
alias be="bundle exec"
alias binit="bi --path vendor && b package && echo 'vendor/ruby' >> .gitignore"

alias rs='rails s'
alias rc='rails c'
alias urs='unicorn_rails'
alias rr='rake routes| less'

function find_alias { alias| grep "alias $1"; }
alias fa=find_alias

test -z $TMUX && alias exit='tmux kill-session'
# If running in a TMUX sesion kill the session on exit
test -z $TMUX && alias exit=exit

# When ther are fast specs
alias fspec='rspec --options .fspec'
alias httpd='ruby -run -e httpd . -p5000'

alias redis-server-start='redis-server /usr/local/etc/redis.conf'
