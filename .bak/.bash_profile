# Enable vim mode for command
set -o vi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# if [ $ITERM_SESSION_ID ]; then
#   export PROMPT_COMMAND='echo -ne "${PWD##*/}"';
# fi

export PATH="/usr/local/bin:/bin:/sbin:/usr/bin:/usr/local/sbin:/Library/Frameworks/Python.framework/Versions/3.5/bin:/Applications/Julia-0.5.app/Contents/Resources/julia/bin:~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools:/Users/akashgoswami/Tools/apache-maven-3.6.1/bin:${PATH}"
export TERM="screen-256color"
export SPARK_HOME="/Users/akashgoswami/Mics/spark-2.2.1-bin-hadoop2.7/" 

# export PS1=' \[\e[1;91m\]❤\[\e[0m\] \[\033[1;31m\][ ${PWD##*/} ]\[\e[0m\] '


parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function prompt {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
  local RESETCOLOR="\[\e[00m\]"

  export PS1="\n$REDBOLD ❤ $GREENBOLD \w $RESETCOLOR$GREEN\$(parse_git_branch)\n $CYAN[\#] → $RESETCOLOR"
  export PS2=" | → $RESETCOLOR"
}

prompt

# added by Miniconda3 4.3.21 installer
export PATH="/Users/akashgoswami/miniconda3/bin:$PATH"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/usr/local/bin/:${PATH}"
export PATH

alias python="/usr/local/bin/python3"

server () {
  python -m http.server $1
}

 
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# vim from brew
alias vim='/usr/local/Cellar/vim/8.1.0500/bin/vim'

# Cmd shortcut
alias cl="clear"
# History shortcut
alias h="history"

export PATH="$HOME/.cargo/bin:$PATH"
export GOPATH=$HOME/Temp/go

# Should be the last command
cmatrix -s

fortune | cowsay -f $(ls /usr/local/Cellar/cowsay/3.04/share/cows | shuf -n 1) | lolcat
