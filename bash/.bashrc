# If local bashrc is present then, take that as well

set -o vi

. ~/.dotfiles/bash/env

. ~/.dotfiles/bash/prompt

. ~/.dotfiles/bash/alias

. ~/.dotfiles/bash/functions

. ~/.dotfiles/bash/path

. ~/.dotfiles/bash/libs/z/z.sh

[ -f ~/.dotfiles/bash/.fzf.bash ] && source ~/.dotfiles/bash/.fzf.bash

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# VS code window throws error
update_terminal_cwd() {
    # Identify the directory using a "file:" scheme URL,
    # including the host name to disambiguate local vs.
    # remote connections. Percent-escape spaces.
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]7;%s\a' "$PWD_URL"
}


# alias note='nvim ~/Documents/note.txt'
nnote() {
  nvim ~/Documents/nvim_notes/note-$1.md
}


if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

[[ -r /usr/local/etc/profile.d/bash_completion.sh ]] && . /usr/local/etc/profile.d/bash_completion.sh

# This is until neovim 0.5 is not GA
# https://dev.to/creativenull/installing-neovim-nightly-alongside-stable-10d0 
alias nnvim='MYVIMRC=~/.config/nvim-nightly/init.vim NVIM_RPLUGIN_MANIFEST=~/.local/share/nvim-nightly/rplugin.vim VIMRUNTIME=~/toolchains/nightly/neovim/runtime ~/toolchains/nightly/neovim/build/bin/nvim "$@" -u ~/.config/nvim-nightly/init.vim'

export TERM=xterm-256color

