#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bash_profile bashrc config zshrc git-completion.bash gitconfig gitignore_global tmux.conf gemrc resty"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
if [ -d $olddir ]; then
  echo ""
  echo -n "$olddir exists, clearing it ..."
  rm -rf $olddir
fi
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    if [ -e ~/.$file ]; then
      echo "Moving ~/.$file to $olddir"
      mv ~/.$file $olddir
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# link vim config file and folder to neovim version
echo "Moving ~/.vim to $olddir"
mv ~/.vim $olddir
echo "Creating symlink for .vim in home directory."
ln -s ~/.config/nvim ~/.vim
echo "Moving ~/.vimrc to $olddir"
mv ~/.vimrc $olddir
echo "Creating symlink for .vimrc in home directory."
ln -s ~/.config/nvim/init.vim ~/.vimrc

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
        git clone http://github.com/robbyrussell/oh-my-zsh.git
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        if [[ -f /etc/redhat-release ]]; then
            sudo yum install zsh
            install_zsh
        fi
        if [[ -f /etc/debian_version ]]; then
            sudo apt-get install zsh
            install_zsh
        fi
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

#install_zsh
