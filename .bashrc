# Bash configuration

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=20000
HISTFILESIZE=$HISTSIZE
# Make some commands not show up in history
HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help:* -h";

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

PS1="\[\e]0;\u@\h: \w\a\]$PS1"

if [ -f ~/.bash_aliases ]; then
      source $HOME/.bash_aliases
fi

source $HOME/.profile
