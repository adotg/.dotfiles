# Enable vim mode for command
set -o vi

# Git auto completion, if present.
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export PATH="/usr/local/bin:/bin:/sbin:/usr/bin:/usr/local/sbin:${PATH}"

. ~/.dotfiles/bash/.env

. ~/.dotfiles/bash/.prompt

. ~/.dotfiles/bash/.alias

. ~/.dotfiles/bash/.functions

# If local bash profile is present then, take that as well
if [ -f ~/.local_profile.bash ]; then
    . ~/.local_profile.bash
fi

