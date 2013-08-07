# .bashrc - Alan Christopher Thomas
# http://alanct.com/

# Disallow duplicates in history
HISTCONTROL=ignoredups:ignorespace

# Keep 1000 lines in history
export HISTSIZE=1000
export HISTFILESIZE=1000

# Individually append lines to history and set window title
shopt -s histappend

# Use vim as default editor
export EDITOR=vim
export VISUAL=vim

# Set up virtualenv paths and settings
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export WORKON_HOME=$HOME/.envs
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi

# Remove default Ctrl-S behavior
stty -ixon -ixoff

# Use local binaries
export PATH=~/.local/bin:$PATH

# Use full color
export TERM=xterm-256color

# Enable programmable completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Enable git bash completion
. ~/.bash_scripts/git-completion.bash

# Enable ta bash completion
. ~/.bash_scripts/ta-completion.bash

# Include alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Execute .bash_local
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

# Include custom bash prompt
if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
