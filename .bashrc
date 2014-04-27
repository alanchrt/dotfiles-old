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

# Remove default Ctrl-S behavior
if [ -t 0 ]; then
    stty -ixon -ixoff
fi

# Add Heroku toolkit to path
export PATH="/usr/local/heroku/bin:$PATH"

# Use local binaries
export PATH=~/.local/bin:$PATH

# Use full color
export TERM=xterm-256color

# Store Go code in home directory
export GOPATH=$HOME/.gocode

# Predictable SSH authentication socket location.
# From http://unix.stackexchange.com/a/76256
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

# Import smartcd config
[ -r "$HOME/.smartcd_config" ] && ( [ -n $BASH_VERSION ] || [ -n $ZSH_VERSION ] ) && source ~/.smartcd_config

# Set up virtualenv
if [ -n "$BASH_VERSION" ]; then
    # startup virtualenv-burrito
    if [ -f "$HOME/.venvburrito/startup.sh" ]; then
        . "$HOME/.venvburrito/startup.sh"
    fi
fi

# Virtualenv settings
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

# Enable programmable completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Enable git bash completion
if [ -f ~/.bash_scripts/git-completion.bash ]; then
    . ~/.bash_scripts/git-completion.bash
fi

# Enable git prompt
if [ -f ~/.bash_scripts/git-prompt.bash ]; then
    . ~/.bash_scripts/git-prompt.bash
fi

# Enable ta bash completion
if [ -f ~/.bash_scripts/ta-completion.bash ]; then
    . ~/.bash_scripts/ta-completion.bash
fi

# Include alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable prompt
if [ -f ~/.bash_scripts/prompt.bash ]; then
    . ~/.bash_scripts/prompt.bash
fi

# Execute .bash_local
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi
