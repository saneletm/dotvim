README.md

This is a repository for my linux configuration
files which include 
 * vim files (.vim and plugins)
 * lxterminal (config
 * tmux config (.tmux.conf)
 * emacs config (.emacs)

Installation:
  git clone git://github.com/nelstrom/dotvim.git ~/.vim

Create symlinks:
  ln -s ~/.vim/vimrc ~/.vimrc
  ln -s ~/.vim/gvimrc ~/.gvimrc

Switch to the `~/.vim` directory, and fetch submodules:
  cd ~/.vim
  git submodule init
  git submodule update
