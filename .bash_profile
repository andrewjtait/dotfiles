# Bash Aliases File

# Navigation
alias ll="ls -l"
alias lla="ls -la"
alias ..="cd .."
alias ...="cd ../.."
alias dev="cd ~/developments"

# Git
alias g="git"
alias gs="git status "
alias ga="git add "
alias gb="git branch "
alias gc="git commit "
alias gd="git diff "
alias go="git checkout "

# Bundler
alias b="bundle"
alias be="bundle exec "

# Evergreen
alias evergreen="be rails s -p 4000"

# Chrome debugging
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222"

# Bash prompt

function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

CYAN="\[\033[0;36m\]"
PURPLE="\[\033[0;35m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$RED\$(date +%H:%M) \w$YELLOW\$(parse_git_branch)\$ $NO_COLOUR"

# 256 Colour Stuff for Vim/ Tmux
export TERM='screen-256color'

#Editor set to vim
export EDITOR=vim

#Set proxy for selenium webdriver issue
export no_proxy=127.0.0.1

# turn on garbage collection
export DGC=true

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
