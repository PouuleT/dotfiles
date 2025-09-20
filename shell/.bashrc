HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=20000
HISTFILESIZE=$HISTSIZE
HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help:* -h";
HISTTIMEFORMAT="%F %T  "

PS1="\[\e]0;\u@\h: \w\a\]$PS1"

if [ -f "$HOME/.shell" ]; then
	. "$HOME/.shell"
fi
