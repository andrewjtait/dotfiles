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

# allows local installations of node packages without using symlinks
function install-local {
  npm install $(npm pack $1 | tail -1)
}

# Bash prompt
function parse_git_branch {
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^On branch ([^${IFS}]*)"
  ahead_pattern="Your branch is ahead of"
  behind_pattern="Your branch is behind"
  staged_pattern="Changes to be committed"
  unstaged_pattern="Changes not staged for commit"
  untracked_pattern="Untracked files"
  diverge_pattern="Your branch and (.*) have diverged"

  if [[ ${git_status}} =~ ${staged_pattern} ]];     then state+="${YELLOW}*"; fi
  if [[ ${git_status}} =~ ${unstaged_pattern} ]];   then state+="${GREEN}*"; fi
  if [[ ${git_status}} =~ ${untracked_pattern} ]];  then state+="${CYAN}*"; fi

  if   [[ ${git_status} =~ ${ahead_pattern} ]];     then remote="${CYAN}↑"
  elif [[ ${git_status} =~ ${behind_pattern} ]];    then remote="${CYAN}↓"
  elif [[ ${git_status} =~ ${diverge_pattern} ]];   then remote="${RED}↕"; fi

  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo "$YELLOW:$branch$remote$state"
  fi
}
function prompt_func() {
  PS1="$RED\$(date +%H:%M) \w$(parse_git_branch)$YELLOW\$ $NO_COLOUR"
}
PROMPT_COMMAND=prompt_func

# Colours
CYAN="\[\033[0;36m\]"
PURPLE="\[\033[0;35m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

# 256 Colour Stuff for Vim/ Tmux
export TERM='screen-256color'

#Editor set to vim
export EDITOR=vim

#Set proxy for selenium webdriver issue
export no_proxy=127.0.0.1

# turn on garbage collection
export DGC=true

# default queue provider
export CACHE_STORE_HOST="redis"
export MQ_ENDPOINT="rabbitmq"
export QUEUE_PROVIDER="rabbitmq"

# rbenv
eval "$(rbenv init -)"

# android
export PATH=${PATH}:~/developments/android-sdk-macosx/platform-tools:~/developments/android-sdk-macosx/tools

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# make ruby faster
export RUBY_GC_MALLOC_LIMIT=60000000
export RUBY_GC_HEAP_FREE_SLOTS=200000

# mysql defaults
export MYSQL_USERNAME='root'
export MYSQL_PASSWORD='admin'

export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
