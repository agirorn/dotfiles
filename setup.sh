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

########## Configuration

dot_files_dir=~/dotfiles                    # dotfiles directory
backup_dir=~/dotfiles_old             # old dotfiles backup directory

# list of files/folders to symlink in homedir
dot_files=(
  ackrc
  bash
  config
  eslintrc
  gemrc
  irbrc
  jshintrc
  noserc
  oh-my-zsh
  profile
  psqlrc
  pylintrc
  pythonrc
  tern-config
  tmux
  tmux.conf
  vim
  vimrc
  ycm_extra_conf.py
  zshrc
)


########## Banner
echo '########################'
echo "# Uptating Dow Files   #"
echo '########################'
echo ''

########## Updating Dot Files
#
# move any existing dotfiles in the home directory to dotfiles_old directory,
# then create symlinks from the homedir to any files in the ~/dotfiles directory
# specified in $files, excluding things that have been simlinkt before
for file in $dot_files; do
  link_to_dot_file=~/.$file
  dot_file=$dot_files_dir/$file

  if [ -f $link_to_dot_file ]; then
    if [ ! \( -h $link_to_dot_file \) ]; then
     if [ ! \( -d $backup_dir \) ]; then
        echo "Creating backup directory: $backup_dir"
        mkdir -p $backup_dir
      fi
      echo "Backing up $link_to_dot_file to $backup_dir/ "
      mv $link_to_dot_file $backup_dir/
    fi
  fi

  if [ ! \( -h $link_to_dot_file \) ]; then
    echo "Symlinking $dot_file to $link_to_dot_file"
    ln -s $dot_file $link_to_dot_file
  fi

done


for program in $(ls ~/dotfiles/bin)
do
  if [[ ! -f ~/bin/$program ]]; then
    ln -s ~/dotfiles/bin/$program ~/bin
  fi
done
