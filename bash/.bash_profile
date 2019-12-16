# Enable vim mode for command
set -o vi

# Git auto completion, if present.
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export PATH="/usr/local/bin:/bin:/sbin:/usr/bin:/usr/local/sbin:${GOPATH}/bin:/Library/Frameworks/Python.framework/Versions/3.5/bin:/Users/akashgoswami/Tools/apache-maven-3.6.1/bin:$HOME/.cargo/bin:${PATH}"

. ~/.dotfiles/bash/.env

. ~/.dotfiles/bash/.prompt

. ~/.dotfiles/bash/.alias

. ~/.dotfiles/bash/.functions

export GOPATH=$HOME/GoProj/go

# If local bashrc is present then, take that as well
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
