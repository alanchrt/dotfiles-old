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
alias gh='git hist'

# tmux aliases
alias tn='tmux new-session -s'
alias ta='tmux -2 attach-session -t'
alias tl='tmux list-sessions'

# tree colorization
alias tree='tree -C'

# flake8 command
alias f8='flake8'

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
