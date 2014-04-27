# .zshrc - Alan Christopher Thomas
# http://alanct.com/

# Enable completion
autoload -U compinit
compinit -i

# Enable colors
autoload -U colors && colors
setopt prompt_subst

# Enable prompt
if [ -f ~/.zsh_scripts/prompt.zsh ]; then
    . ~/.zsh_scripts/prompt.zsh
fi
