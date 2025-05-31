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

# Enshure the submodules have been updated
git submodule init
git submodule update


# list of files/folders to symlink in homedir

test -f ${HOME}/.ackrc       || ln -s ${HOME}/dotfiles/ackrc       ${HOME}/.ackrc
test -d ${HOME}/.ideavimrc   || ln -s ${HOME}/dotfiles/ideavimrc   ${HOME}/.ideavimrc
test -f ${HOME}/.bash        || ln -s ${HOME}/dotfiles/bash        ${HOME}/.bash
test -f ${HOME}/.oh-my-zsh   || ln -s ${HOME}/dotfiles/oh-my-zsh   ${HOME}/.oh-my-zsh
test -f ${HOME}/.profile     || ln -s ${HOME}/dotfiles/profile     ${HOME}/.profile
test -f ${HOME}/.psqlrc      || ln -s ${HOME}/dotfiles/psqlrc      ${HOME}/.psqlrc
test -f ${HOME}/.pylintrc    || ln -s ${HOME}/dotfiles/pylintrc    ${HOME}/.pylintrc
test -f ${HOME}/.pythonrc    || ln -s ${HOME}/dotfiles/pythonrc    ${HOME}/.pythonrc
test -f ${HOME}/.tmux        || ln -s ${HOME}/dotfiles/tmux        ${HOME}/.tmux
test -f ${HOME}/.tmux.conf   || ln -s ${HOME}/dotfiles/tmux.conf   ${HOME}/.tmux.conf
test -f ${HOME}/.vim         || ln -s ${HOME}/dotfiles/vim         ${HOME}/.vim
test -f ${HOME}/.vimrc       || ln -s ${HOME}/dotfiles/vimrc       ${HOME}/.vimrc
test -f ${HOME}/.nvimrc      || ln -s ${HOME}/dotfiles/nvimrc      ${HOME}/.nvimrc    
test -f ${HOME}/.nvimrc.lua  || ln -s ${HOME}/dotfiles/nvimrc.lua  ${HOME}/.nvimrc.lua    
test -f ${HOME}/.nvim        || ln -s ${HOME}/dotfiles/nvim        ${HOME}/.nvim
test -f ${HOME}/.zshrc       || ln -s ${HOME}/dotfiles/zshrc       ${HOME}/.zshrc
test -f ${HOME}/.zshrc       || ln -s ${HOME}/dotfiles/zshrc       ${HOME}/.zshrc
test -d ${HOME}/bin          || ln -s ${HOME}/dotfiles/bin         ${HOME}/bin


## Git
test -f $HOME/.gitignore_global || ln -s $HOME/dotfiles/gitignore_global $HOME/.gitignore_global
test -d $HOME/.config || ln -s $HOME/dotfiles/config $HOME/.config
