#!/usr/bin/env bash

# Find current script dir
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Read input with default value
read -rp "Install all files for '$USER' user ? (Y/n)" -n 1 choice
choice=${choice:-"y"};

# Yes or no ?
case ${choice} in
    y|Y)
        # Config files
        FILES=(
            .bashrc
            .bash_aliases
            .bashrc_ps1
            .gitconfig
            .inputrc
            .oh-my-zsh
            .functions
            .profile
            .screenrc
            .tmux.conf
            .vim
            .vimrc
            .Xdefaults
            .xinitrc
            .zshrc
            .zshrc_ps1
            .config/i3
            .config/i3status
            .local/bin
        )

        for FILE in "${FILES[@]}"
        do
            if [ -f "$HOME/$FILE" ]
            then
                echo "File exists : $FILE not linked"
            elif [ -d "$HOME/$FILE" ]
            then
                echo "Folder exists: ${FILE} not linked"
            else
                ORIGINAL_FILE="$DIR/$FILE"
                SYMBOLIC_LINK="$HOME/$FILE"
                ln -s "$ORIGINAL_FILE" "$SYMBOLIC_LINK"
                echo "$FILE linked"
            fi
        done
        ;;
    n|N)
        echo "Too bad.."
        exit
        ;;
esac
