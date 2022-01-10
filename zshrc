#!/usr/bin/env zsh

# Load other configuration files
for file in ~/.zsh/.{aliases,exports,functions,settings}; do
    [[ -e "$file" ]] && source "$file"
done

# Enable Vim mode
bindkey -v
bindkey '^?' backward-delete-char

# Enable Starship prompt
eval "$(starship init zsh)"

# Use already typed text as a start-point for searching
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# Enable and set up a completion system
zstyle ':completion:*' matcher-list \
    'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
    'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

autoload -Uz compinit && compinit

# Enable fish-like autosuggestions
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
