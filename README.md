README.md
-----------------------
This is a repository for my linux configuration
files which include 

 * _vim files (.vim and plugins)_
 * _bash profile: mac files (.bash_profile)_
 * _lxterminal ("locate")_
 * _tmux config (.tmux.conf)_
 * _emacs config (.emacs, dotelips)_

###Setting up
---

#####Cloning:
......

  git clone git://github.com/saneletm/dotvim.git ~/.vim

#####Create symlinks:
......

  * ln -s ~/.vim/vimrc ~/.vimrc
  * ln -s ~/.vim/tmux.conf ~/.tmux.conf 
  * ln -s ~/.vim/dotemacs ~/.emacs
  * ln -s ~/.vim/dotelips ~/.elips
  * ln -s ~/.vim/gvimrc ~/.gvimrc
  * ln -s ~/.vim/bash_profile ~/.bash_profile ### for mac 

#####Switch to the `~/.vim` directory, and fetch vim submodules:
......

  * cd ~/.vim
  * git submodule init
  * git submodule update
