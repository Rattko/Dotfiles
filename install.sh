#!/usr/bin/env zsh

# Helper function to retrieve an absolute path of a given file
get_absolute_path() {
    echo "$(find $(pwd) -maxdepth 1 -name "$1")"
}

# Create needed directories
mkdir -p ~/.zsh ~/.config/{bat,git,kitty}

# Kitty
ln -s -f $(get_absolute_path kitty.conf) ~/.config/kitty/kitty.conf

# Zsh
ln -s -f $(get_absolute_path zshenv) ~/.zshenv

for file in aliases exports functions settings zprofile zshrc; do
    ln -s -f $(get_absolute_path $file) ~/.zsh/.$file
done

# Starship
ln -s -f $(get_absolute_path starship.toml) ~/.config/starship.toml

# Vim
ln -s -f $(get_absolute_path vimrc) ~/.vimrc

# Git
ln -s -f $(get_absolute_path gitconfig) ~/.config/git/config
ln -s -f $(get_absolute_path gitignore) ~/.config/git/ignore

# Bat
ln -s -f $(get_absolute_path bat.conf) ~/.config/bat/config