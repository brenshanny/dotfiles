#!/usr/bin/env bash

# install tmux
if ! tmux -V; then
  echo "Installing tmux"
  host="$(uname -s)"
  [ $host = "Darwin" ] && brew --version && brew install tmux
  [ $host = "Linux" ] && sudo apt-get update && sudo apt-get install tmux
fi

if [ -d ~/.tmux/plugins ]; then
  if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo "Installing tpm"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
  if [ ! -d ~/.tmux/plugins/tmux-pain-control ]; then
    echo "Installing pain-control"
    git clone https://github.com/tmux-plugins/tmux-pain-control ~/.tmux/plugins/tmux-pain-control
  fi

else
  echo "Installing tpm"
  echo "Installing pain-control"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  git clone https://github.com/tmux-plugins/tmux-pain-control ~/.tmux/plugins/tmux-pain-control
fi

# install vim pathogen
if [ ! -d ~/.vim/autoload ]; then
  echo "Installing vim pathogen"
  if ! [ -x "$(command -v curl)" ]; then
    echo "Installing curl"
    sudo apt-get install curl
  fi
  mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

if ! [ -x "$(command -v rbenv)" ]; then
  echo "Installing rbenv"
  sudo apt-get install rbenv
fi

if [ ! -d ~/.vim/bundle/nerdtree ]; then
  echo "Installing nerdtree"
  git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
fi

if [ ! -d ~/.vim/bundle/gruvbox ]; then
  echo "Installing gruvbox"
  git clone https://github.com/morhetz/gruvbox ~/.vim/bundle/gruvbox
fi

if [ ! -f ~/.vimrc ]; then
  echo "Symlinking vimrc"
  ln -s ~/Repositories/dotfiles/.vimrc ~/.vimrc
fi

if [ ! -f ~/.tmux.conf ]; then
  echo "Symlinking tmux.conf"
  ln -s ~/Repositories/dotfiles/.tmux.conf ~/.tmux.conf
fi

if [ ! -f ~/.gitconfig ]; then
  echo "Symlinking gitconfig"
  ln -s ~/Repositories/dotfiles/.gitconfig ~/.gitconfig
fi

if [ ! -f ~/.bash_profile ]; then
  echo "Symlinking bash_profile"
  ln -s ~/Repositories/dotfiles/.bash_profile ~/.bash_profile
fi

if [ ! -f ~/.bash_profile_mac ]; then
  echo "Symlinking bash_profile_mac"
  ln -s ~/Repositories/dotfiles/.bash_profile_mac ~/.bash_profile_mac
fi

if [ ! -f ~/.bash_profile_securedocs ]; then
  echo "Symlinking bash_profile_securedocs"
  ln -s ~/Repositories/dotfiles/.bash_profile_securedocs ~/.bash_profile_securedocs
fi

source ~/.bash_profile
