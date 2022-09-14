#!/usr/bin/env zsh

# Create needed directories
mkdir -p ~/.zsh ~/.config/{bat,git,kitty}

# Kitty
ln -s -f $(realpath kitty.conf) ~/.config/kitty/kitty.conf

# Zsh
ln -s -f $(realpath zshenv) ~/.zshenv

for file in aliases exports functions settings zprofile zshrc; do
    ln -s -f $(realpath $file) ~/.zsh/.$file
done

# Starship
ln -s -f $(realpath starship.toml) ~/.config/starship.toml

# Vim
ln -s -f $(realpath vimrc) ~/.vimrc

# Git
ln -s -f $(realpath gitconfig) ~/.config/git/config
ln -s -f $(realpath gitignore) ~/.config/git/ignore

# Bat
ln -s -f $(realpath bat.conf) ~/.config/bat/config
