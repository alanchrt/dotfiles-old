# .zshrc - Alan Christopher Thomas
# http://alanct.com/

# Enable completion
autoload -U compinit
compinit -i

# Enable colors
autoload -U colors && colors
setopt prompt_subst

# Include alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable prompt
if [ -f ~/.zsh_scripts/prompt.zsh ]; then
    . ~/.zsh_scripts/prompt.zsh
fi
