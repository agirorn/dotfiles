# Colors from http://wiki.archlinux.org/index.php/Color_Bash_Prompt

# misc
P_NO_COLOR='\e[0m' #disable any colors

# regular colors
P_BLACK='\e[0;30m'
P_RED='\e[0;31m'
P_GREEN='\e[0;32m'
P_YELLOW='\e[0;33m'
P_BLUE='\e[0;34m'
P_MAGENTA='\e[0;35m'
P_CYAN='\e[0;36m'
P_WHITE='\e[0;37m'

# emphasized (bolded) colors
P_EBLACK='\e[1;30m'
P_ERED='\e[1;31m'
P_EGREEN='\e[1;32m'
P_EYELLOW='\e[1;33m'
P_EBLUE='\e[1;34m'
P_EMAGENTA='\e[1;35m'
P_ECYAN='\e[1;36m'
P_EWHITE='\e[1;37m'

# underlined colors
P_UBLACK='\e[4;30m'
P_URED='\e[4;31m'
P_UGREEN='\e[4;32m'
P_UYELLOW='\e[4;33m'
P_UBLUE='\e[4;34m'
P_UMAGENTA='\e[4;35m'
P_UCYAN='\e[4;36m'
P_UWHITE='\e[4;37m'

# background colors
P_BBLACK='\e[40m'
P_BRED='\e[41m'
P_BGREEN='\e[42m'
P_BYELLOW='\e[43m'
P_BBLUE='\e[44m'
P_BMAGENTA='\e[45m'
P_BCYAN='\e[46m'
P_BWHITE='\e[47m'

PROMPT_DIR="\[$P_WHITE\]\w\[$P_NO_COLOR\]"
PROMPT_GIT_ARG="$P_YELLOW:%s$P_NO_COLOR"
PROMPT_GIT='$(__git_ps1 $PROMPT_GIT_ARG)'
PROMPT_ARROW="\[$P_EBLACK\]→\[$P_NO_COLOR\]"

# For the therminal title.
PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}: ${PWD/$HOME/~}\007"'
export PS1="\n$PROMPT_DIR$PROMPT_GIT \n$PROMPT_ARROW "
