#! /bin/bash

xscreensaver &

# set rapid cursor
xset r rate 200 44

# set mapping to qwerty
setxkbmap us
# use right alt as compose key
setxkbmap -option compose:ralt

# load awesome shortcuts
(sleep 5 ; xmodmap ~/.config/awesome/.Xmodmap) &

# export locales
export LC_ALL=en_US.UTF-8

# execute awesome
exec awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr

