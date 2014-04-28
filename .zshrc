# .zshrc - Alan Christopher Thomas
# http://alanct.com/

# Enable completion
autoload -U compinit
compinit -i
zstyle ':completion:*' menu select
setopt menu_complete

# Enable colors
autoload -U colors && colors
setopt prompt_subst

# Emacs bindings
bindkey -e

# Properly set shell
export SHELL=$(which zsh)

# Include shell environment
if [ -f ~/.shenv ]; then
    . ~/.shenv
fi

# Include alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable prompt
if [ -f ~/.zsh_scripts/prompt.zsh ]; then
    . ~/.zsh_scripts/prompt.zsh
fi

# Execute .bash_local
if [ -f ~/.zsh_scripts/prompt.zsh ]; then
    . ~/.zsh_scripts/prompt.zsh
fi
