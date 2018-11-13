#!/usr/bin/env bash

# install tmux
if tmux -V; then
  echo "Tmux already installed";
else
  echo "Installing tmux"
  if [ "$(uname -s)" == "Darwin" ]; then
    if brew --version; then
      brew install tmux
    fi
  elif [ "$(uname -s)" == "Linux" ]; then
    sudo apt-get update && sudo apt-get install tmux
  fi
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
  mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
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
