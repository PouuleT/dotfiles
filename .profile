# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
      . "$HOME/.bashrc"
    fi
fi

if [ -f "$HOME/.functions" ]; then
  . "$HOME/.functions"
fi

add_path() {
        [ -s "$1" ] || return 0
        export PATH="$PATH:$1"
}

# set PATH with custom locations
add_path "/sbin"
add_path "/usr/sbin"
add_path "/usr/local/go/bin"
add_path "$HOME/bin"
add_path "$HOME/.local/bin"
add_path "$HOME/dev/go/bin"
add_path "$HOME/.cargo/bin"
add_path "$HOME/.rbenv/bin" && eval "$(rbenv init -)"

export GOPATH=$HOME/dev/go
export GO111MODULES=on

export EDITOR='vim'

# Loads nvm
[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"
