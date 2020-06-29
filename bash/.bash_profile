# Enable vim mode for command
set -o vi

# Git auto completion, if present.
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

. ~/.dotfiles/bash/.env

. ~/.dotfiles/bash/.prompt

. ~/.dotfiles/bash/.alias

. ~/.dotfiles/bash/.functions

. ~/.dotfiles/bash/.path

# If local bashrc is present then, take that as well
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Git bash completion
[[ -r /usr/local/etc/profile.d/bash_completion.sh ]] && . /usr/local/etc/profile.d/bash_completion.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


