# .bashrc - Alan Christopher Thomas
# http://alanct.com/

# Disallow duplicates in history
HISTCONTROL=ignoredups:ignorespace

# Keep 1000 lines in history
export HISTSIZE=1000
export HISTFILESIZE=1000

# Individually append lines to history and set window title
shopt -s histappend
PROMPT_COMMAND='history -a; echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

# Use vim as default editor
export EDITOR=vim
export VISUAL=vim

# Set up virtualenv paths and settings
export WORKON_HOME=$HOME/.envs
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

# Enable programmable completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Enable ta bash completion
. ~/.bash_scripts/ta_bash_completion

# Include alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Execute .bash_local
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi
