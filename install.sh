#!/bin/bash

no_of_arguments=$#

function install_dotfiles_for_bash() {
    local stat=1
    echo "============================"
    echo "Installing dotfiles for bash"
    echo "============================"

    if [[ -f ~/.bash_profile ]]; then
        stat=$(( stat*2 ))
    fi

    if [[ -f ~/.local_profile.bash ]]; then
        stat=$(( stat*3 ))
    fi

    if [[ stat -eq 6 ]]; then
        echo "Both local_profile and bash_profile found; Deleting bash_profile; local_profile untouched"
        rm ~/.bash_profile
    elif [[ stat -eq 2 ]]; then
        echo "Found bash_profile; Renaming it for bootstrapping"
        mv ~/.bash_profile ~/.local_profile.bash
    elif [[ stat -eq 3 ]]; then
        echo "local_profile found; Will be sourcing it"
    fi
    

    echo "Creating symbolic link to home"
    ln -sv ~/.dotfiles/bash/.bash_profile ~

    echo "Sourcing"
    source ~/.bash_profile

    echo ""
    echo "COMPLETED"
}

function install_dotfiles_for_tmux() {
    echo "============================"
    echo "Installing dotfiles for tmux"
    echo "============================"

    # If tpm is not installed, install tpm
    if [[ ! -d ~/.tmux/plugins/tpm ]]; then
        echo "Installing tmux plugin manager"
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi

    if [[ -f ~/.tmux.conf ]]; then
        mv ~/.tmux.conf ~/.tmux/tmux.bu.conf
    fi

    if [[ -f ~/.tmux/tmux.remote.conf ]]; then
        mv ~/.tmux/tmux.remote.conf ~/.tmux/tmux.remote.bu.conf
    fi

    echo "Linking tmux conf"
    ln -sv ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
    ln -sv ~/.dotfiles/tmux/tmux.remote.conf ~/.tmux/tmux.remote.conf

    echo ""
    echo "COMPLETED"
}

function install_dotfiles_for_vim() {
    local stat=1
    if [[ stat -eq 6 ]]; then
        echo "Both vimrc and vimrc_local found; Deleting vimrc; vimrc_local untouched"
        rm ~/.vimrc
    elif [[ stat -eq 2 ]]; then
        echo "Found vimrc; Renaming it for bootstrapping"
        mv ~/.vimrc ~/.vimrc_local
    elif [[ stat -eq 3 ]]; then
        echo "vimrc_local found; Will be sourcing it"
    fi

    echo "Creating symbolic link to home"
    ln -sv ~/.dotfiles/vim/.vimrc ~

    echo "Unwinding neovim setup files"
    cp ~/.dotfiles/vim/nvim.zip ~/.config/
    cd ~/.config
    unzip nvim.zip
    rm nvim.zip

    echo ""
    echo "COMPLETED"
}

if [[ no_of_arguments -eq 0 ]]; then
    install_dotfiles_for_bash
    install_dotfiles_for_tmux
    install_dotfiles_for_vim

    exit 1
fi

for arg in "$@"
do
    case $arg in
        "bash")
            install_dotfiles_for_bash;;

        "tmux")
            install_dotfiles_for_tmux;;

        "vim")
            install_dotfiles_for_vim;;

    esac
done

exit 1
