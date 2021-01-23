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

ln -s $HOME/dotfiles/ackrc $HOME/.ackrc
ln -s $HOME/dotfiles/bash $HOME/.bash
ln -s $HOME/dotfiles/oh-my-zsh $HOME/.oh-my-zsh
ln -s $HOME/dotfiles/profile $HOME/.profile
ln -s $HOME/dotfiles/psqlrc $HOME/.psqlrc
ln -s $HOME/dotfiles/pylintrc $HOME/.pylintrc
ln -s $HOME/dotfiles/pythonrc $HOME/.pythonrc
ln -s $HOME/dotfiles/tmux $HOME/.tmux
ln -s $HOME/dotfiles/tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/vim $HOME/.vim
ln -s $HOME/dotfiles/vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/zshrc $HOME/.zshrc

## Git
ln -s $HOME/dotfiles/gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/gitignore_global $HOME/.gitignore_global

# ####################
# Git
# ####################
# ln -s $HOME/dotfiles/tern-config $HOME/.tern-config
# ln -s $HOME/dotfiles/ycm_extra_conf.py $HOME/.ycm_extra_conf.py

# ln -s $HOME/dotfiles/config $HOME/.config
# ln -s $HOME/dotfiles/eslintrc $HOME/.eslintrc
# ln -s $HOME/dotfiles/gemrc $HOME/.gemrc
# ln -s $HOME/dotfiles/irbrc $HOME/.irbrc
# ln -s $HOME/dotfiles/jshintrc $HOME/.jshintrc
# ln -s $HOME/dotfiles/noserc $HOME/.noserc
