#!/bin/sh

# set rapid cursor
xset r rate 200 44

# set mapping to qwerty
setxkbmap us
# use right alt as compose key
setxkbmap -option compose:ralt

# export locales
export LC_ALL=en_US.UTF-8
