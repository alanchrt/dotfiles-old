# .bash_aliases - Alan Christopher Thomas
# http://alanct.com/

# ls aliases
alias ls='ls -G'
alias ll='ls -al'
alias la='ls -A'

# git aliases
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff --color'
alias gt='git difftool'
alias go='git checkout'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %C(cyan)(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

# git bash completion
__git_complete ga _git_add
__git_complete gb _git_branch
__git_complete gc _git_commit
__git_complete gd _git_diff
__git_complete gt _git_difftool
__git_complete go _git_checkout

# tmux aliases
alias tn='tmux new-session -s'
alias ta='tmux -2 attach-session -t'
alias tl='tmux list-sessions'

# python shorthand
alias py='python'
alias ipy='ipython'

# virtualenv shortcuts
alias mkve='mkvirtualenv'
alias wo='workon'
alias conf='cat $VIRTUAL_ENV/bin/postactivate'

# virtualenv bash completion
complete -o default -o nospace -F _virtualenvs wo

# tree colorization
alias tree='tree -C'

# Run flake8 and ignore convenience imports
alias fl='flake8 | grep -v "__init__.py:[0-9]*:1: F401"'

# Start tmux session for coding
function to {
    if [ $# == 1 ]
        then
            tmux new-session -s $1
        elif [ $# == 0 ]
            then
                to $(basename $(pwd))
        else
            echo "to takes only one argument: to [sessionname]"
    fi
}

# Remotely add authorized ssh key
function rkey {
    if [ $# == 1 ]
        then
            ssh $1 'mkdir -p ~/.ssh && echo '`cat ~/.ssh/id_rsa.pub`' >> ~/.ssh/authorized_keys'
    else
        echo "rkey takes one argument: rkey [user]@[host]"
    fi
}
