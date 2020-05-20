# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

plugins=(git rails ruby bower docker git)

source $ZSH/oh-my-zsh.sh
source $HOME/.zshrc_ps1
if [ -f ~/.profile ]; then
  source ~/.profile
fi

if [ -f ~/.bin/z/z.sh ]; then
  . ~/.bin/z/z.sh
fi
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

TERM='xterm-256color'
