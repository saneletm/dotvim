README.md
-----------------------
This is a repository for my linux configuration (SO, IT IS MISSNAMED)
files which include  

 * vim 
 * emacs
 * bash profile (mac) 
 * tmux

###Setting up
---

#####Cloning:
......

  git clone git://github.com/saneletm/dotvim.git ~/.vim


####Note
  This repository is no longer mantained. 
  A better way to rename and organise it will be
  to: 
  * rename it "unixconfigs" Within the unixconfigs dir., have emacs, vim, tmux,
  bash directories amongst others

  * Clone this to ~/.unixconfigs/
  * And then do the syn links 


#####Create symlinks:
......

  * ln -s ~/unixconfigs/emacs/ ~/.emacs
  * ln -s ~/unixconfigs/vim/ ~/vim
  * ln -s ~/unixconfigs/vim/vimrc ~/.vimrc
  * ln -s ~/unixconfigs/tmux/tmux.conf ~/.tmux.conf 
  * ln -s ~/unixconfigs/bash/bash_profile ~/.bash_profile ### for mac 

#####Switch to the `~/.vim` directory, and fetch vim submodules:
......

  * cd ~/.vim
  * git submodule init
  * git submodule update

