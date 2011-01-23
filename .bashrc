# .bashrc - Alan Christopher Thomas
# http://alanchristopherthomas.com/

# Disallow duplicates in history
HISTCONTROL=ignoredups:ignorespace

# Use vim keybindings
set -o vi

# Use vim as default editor
export EDITOR=vim
export VISUAL=vim

# Include alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
