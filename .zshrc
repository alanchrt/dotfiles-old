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

# History settings
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
SAVEHIST=1000
HISTFILE=$HOME/.zhistory

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

# Modules
if [ -f ~/.zsh_modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    . ~/.zsh_modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
fpath=($HOME/.zsh_modules/zsh-completions/src $fpath)
if [ -f ~/.zsh_modules/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
    . ~/.zsh_modules/zsh-history-substring-search/zsh-history-substring-search.zsh
fi
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# Execute .bash_local
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi
