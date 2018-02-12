#!/bin/sh

cd "$(dirname "${BASH_SOURCE}")"

function doIt() {
  echo "-- Synchronizing files/folders..."
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "install.sh" \
  --exclude "iterm-profile.json" --exclude "README.md" -av --no-perms . ~
  echo "-- Setting up vim plugins..."
  rm -rf ~/.vim/bundle/Vundle.vim
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
  echo "-- Configuring iterm..."
  tic -o ~/.terminfo ~/.vim/xterm-256-color-italic.terminfo
  echo "-- Reloading bash profile..."
  source ~/.bash_profile
  echo "-- All done!"
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt
  fi
fi

unset doIt
