#!/usr/bin/env zsh

# Load other configuration files
for file in .aliases .exports .functions .settings; do
    [[ -e "$HOME/.zsh/$file" ]] && source "$HOME/.zsh/$file"
done

# Enable Vim mode
bindkey -v
bindkey 'jk' vi-cmd-mode
bindkey '^?' backward-delete-char

# Enable Starship
eval "$(starship init zsh)"

# Enable fzf
[[ -e ~/.zsh/.fzf.zsh ]] && source ~/.zsh/.fzf.zsh

# Use fd instead of find in fzf
export FZF_DEFAULT_COMMAND='fd --exclude Library --type f .'

# Set default options for fzf
export FZF_DEFAULT_OPTS='--height 50% --reverse --border --multi'

# Use ';;' as a trigger sequence instead of '**'
export FZF_COMPLETION_TRIGGER=';;'

# Use fd instead of find in fzf's fuzzy completion
_fzf_compgen_path() {
    fd --exclude Library --type f . "$1"
}

# Use fd instead of find in fzf's directory completion
_fzf_compgen_dir() {
    fd --exclude Library --type d . "$1"
}

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

# Only autocomplete directories with the 'ls' command
compdef _dirs ls

# Enable fish-like autosuggestions
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Bind Ctrl-J to accept and Ctrl-K to execute a suggestion
bindkey '^j' autosuggest-accept
bindkey '^k' autosuggest-execute

# Enable fish-like syntax highlighting
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
