LS_BLACK=a
LS_RED=b
LS_GREEN=c
LS_YELLOW=d
LS_BLUE=e
LS_MAGENTA=f
LS_CYAN=g
LS_WHITE=h    # light grey
LS_BBLACK=A   # bold black, usually shows up as dark grey
LS_BRED=B
LS_BGREEN=C
LS_BBROWN=D   # bold brown, usually shows up as yellow
LS_BBLUE=E
LS_BMAGENTA=F
LS_BCYAN=G
LS_BWHITE=H   # bold light grey; looks like bright white
LS_DEFAULT=x  # default foreground or background

LS_01=$LS_BGREEN$LS_DEFAULT # directory
LS_02=$LS_CYAN$LS_DEFAULT # symbolic link
LS_03=$LS_GREEN$LS_DEFAULT # socket
LS_04=$LS_BLUE$LS_DEFAULT # pipe
LS_05=$LS_WHITE$LS_MAGENTA # executable
LS_06=$LS_BLUE$LS_CYAN # block special
LS_07=$LS_BLUE$LS_YELLOW # character special
LS_08=$LS_BLACK$LS_RED # executable with setuid bit set
LS_09=$LS_BLACK$LS_CYAN # executable with setgid bit set
LS_10=$LS_BLACK$LS_GREEN # directory writable to others, with sticky bit
LS_11=$LS_BLACK$LS_GREEN # directory writable to others, without sticky bit

export CLICOLOR=1
export LSCOLORS=$LS_01$LS_02$LS_03$LS_04$LS_05$LS_06$LS_07$LS_08$LS_09$LS_10$LS_11


# ON LINUX DO THIS
# LS_COLORS (make directories purple instead of dark blue . The rest are what ubuntu shipped w/by default)

# LS_COLORS='no=00:fi=00:di=01;35:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.flac=01;35:*.mp3=01;35:*.mpc=01;35:*.ogg=01;35:*.wav=01;35:';
# export LS_COLORS
