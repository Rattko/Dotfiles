#!/usr/bin/env zsh

# Load other configuration files
for file in ~/.zsh/.{aliases,exports,functions,prompt,settings}; do
    [[ -e "$file" ]] && source "$file"
done

# Enable Vim mode
bindkey -v
bindkey '^?' backward-delete-char

# Use already typed text as a start-point for searching
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

autoload -Uz compinit && compinit

# Enable fish-like autosuggestions
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
