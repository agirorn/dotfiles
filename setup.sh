#!/bin/bash
################################################################################
# setup.sh
#
# This file installes the dotfiles from ~/dotfiles to your home directory.
# In the process it take a backup of any files it could overwite.
#
# This is meant to be a non destructive command that you can run any time you
# update the dot files or add new ones.
################################################################################

# list of files/folders to symlink in homedir

test -f $HOME/.ackrc     || ln -s $HOME/dotfiles/ackrc     $HOME/.ackrc
test -f $HOME/.bash      || ln -s $HOME/dotfiles/bash      $HOME/.bash
test -f $HOME/.oh-my-zsh || ln -s $HOME/dotfiles/oh-my-zsh $HOME/.oh-my-zsh
test -f $HOME/.profile   || ln -s $HOME/dotfiles/profile   $HOME/.profile
test -f $HOME/.psqlrc    || ln -s $HOME/dotfiles/psqlrc    $HOME/.psqlrc
test -f $HOME/.pylintrc  || ln -s $HOME/dotfiles/pylintrc  $HOME/.pylintrc
test -f $HOME/.pythonrc  || ln -s $HOME/dotfiles/pythonrc  $HOME/.pythonrc
test -f $HOME/.tmux      || ln -s $HOME/dotfiles/tmux      $HOME/.tmux
test -f $HOME/.tmux.conf || ln -s $HOME/dotfiles/tmux.conf $HOME/.tmux.conf
test -f $HOME/.vim       || ln -s $HOME/dotfiles/vim       $HOME/.vim
test -f $HOME/.vimrc     || ln -s $HOME/dotfiles/vimrc     $HOME/.vimrc
test -f $HOME/.zshrc     || ln -s $HOME/dotfiles/zshrc     $HOME/.zshrc
test -f $HOME/.zshrc     || ln -s $HOME/dotfiles/zshrc     $HOME/.zshrc

## Git
test -f $HOME/.gitignore_global || ln -s $HOME/dotfiles/gitignore_global $HOME/.gitignore_global
test -d $HOME/.config || ln -s $HOME/dotfiles/config $HOME/.config


which -s fnm
if [[ $? != 0 ]]; then
  echo "innstalling Fast Node Manager"
  curl -fsSL https://fnm.vercel.app/install | bash
else
  echo "Skipping Fast Node Manager installation since it is already installed"
fi
