#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")"

doIt() {
  echo "-- Synchronizing files/folders..."
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "install.sh" \
  --exclude "README.md" -av --no-perms . ~

  read -p "Do you want to configure vim? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "-- Setting up vim plugins..."
    rm -rf ~/.vim/bundle/Vundle.vim
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
  fi

  echo "-- Reloading bash profile..."
  source ~/.bash_profile

  echo "-- All done!"
}

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  doIt
fi

unset doIt
