# ==============================================================================
# Zinit
# ==============================================================================

declare -A ZINIT
ZINIT[HOME_DIR]="$HOME/.local/zsh/zinit"
ZINIT[BIN_DIR]="${ZINIT[HOME_DIR]}/bin"

# Ask to clone Zinit if it's not already available on disk.
[ ! -d "${ZINIT[BIN_DIR]}" ] &&
  read -q "REPLY?Zinit not installed, clone to ${ZINIT[BIN_DIR]}? [y/N]:" &&
  echo &&
  git clone --depth=1 "https://github.com/zdharma-continuum/zinit.git" "${ZINIT[BIN_DIR]}"

# Load Zinit
source "${ZINIT[BIN_DIR]}/zinit.zsh"

# Enable interactive selection of completions.
zinit for @OMZ::lib/completion.zsh

# Enable history search in prompt.
zinit for @OMZ::plugins/history-substring-search/history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Enable fzf for interactive history
export FZF_CTRL_T_OPTS="--preview='less {}'"
export FZF_DEFAULT_OPTS="--bind=ctrl-k:kill-line --border=none --tabstop=4"
export FZF_TMUX=0
export FZF_TMUX_HEIGHT=100%
# Install fzf binary from latest GitHub Release.
zinit light-mode wait lucid from'gh-r' as'program' pick'fzf' \
  for @junegunn/fzf

# Install fzf-tmux command and zsh plugins from default branch on GitHub.
zinit light-mode wait lucid from'gh' as'program' pick'bin/fzf-tmux' \
  multisrc'shell/{completion,key-bindings}.zsh' \
  id-as'junegunn/fzf-extras' \
  for @junegunn/fzf

zinit light-mode wait lucid blockf \
  for @zsh-users/zsh-completions

# ==============================================================================
# Completion
# ==============================================================================

# Group completions by type under group headings
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%d%b'

autoload -Uz compinit
compinit

# ==============================================================================
# Prompt
# ==============================================================================

if ! command-exists starship; then
  read -q 'REPLY?starship is not installed, install with `brew install starship`? [y/N]:' &&
    echo && brew install starship
fi

if command-exists starship; then
  eval "$(starship init zsh)"
fi

if command-exists mise; then
  eval "$(mise activate zsh)"
fi

# ==============================================================================
# Aliases
# ==============================================================================

# Navigation
alias ll="ls -l"
alias lla="ls -la"
alias ..="cd .."
alias ...="cd ../.."
alias dev="cd ~/dev"

# Helpers
alias reload="exec $SHELL -l"

# Git
alias gs="git status "
alias gp='git pull origin $(git branch | grep \* | cut -d " " -f2)'

# Bundler
alias b="bundle"
alias be="bundle exec "

# SSH
alias korulet="ssh -R5000:koru.localhost:5000 -R50041:koru.localhost:50041 root@koru-dev-andrew-korulet-hosting-1.koru-staging.katapult.cloud"

# MariaDB
alias mysql-start="( dev && cd local/mariadb && docker-compose up -d )"
alias mysql="docker exec -it mariadb-mariadb-1 mariadb -u root"

autoload -U +X bashcompinit && bashcompinit
