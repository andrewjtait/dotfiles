# ==============================================================================
# Helpers
# ==============================================================================

command-exists() {
  (( ${+commands[$1]} ))
  return $?
}

# ==============================================================================
# Env
# ==============================================================================

# default terminal editor
export EDITOR=vim

# default queue provider
export CACHE_STORE_HOST="redis"
export MQ_ENDPOINT="rabbitmq"
export QUEUE_PROVIDER="rabbitmq"

# mysql defaults
export MYSQL_USERNAME='root'

# additional binaries to path
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/usr/local/opt/influxdb@1/bin:$PATH"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:./bin"

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY="YES"

# Orbstack
source ~/.orbstack/shell/init.bash 2>/dev/null || :

# Rust
source "$HOME/.cargo/env"
