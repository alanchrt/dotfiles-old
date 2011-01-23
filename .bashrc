# .bashrc - Alan Christopher Thomas
# http://alanchristopherthomas.com/

# Disallow duplicates in history
HISTCONTROL=ignoredups:ignorespace

# Keep 1000 lines in history
export HISTSIZE=1000
export HISTFILESIZE=1000

# Use vim keybindings
set -o vi

# Use vim as default editor
export EDITOR=vim
export VISUAL=vim

# Include alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
