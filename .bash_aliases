# .bash_aliases - Alan Christopher Thomas
# http://alanchristopherthomas.com/

# ls aliases
alias ls='ls --color=auto'
alias ll='ls -al'
alias la='ls -A'

# git aliases
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias go='git checkout'

# tmux aliases
alias tn='tmux new-session -s'
alias ta='tmux -2 attach-session -t'
alias tl='tmux list-sessions'

# Start tmux session for coding
function to {
    if [ $# == 1 ]
        then
            tmux new-session -d -s $1 -n 'vim' 'vim'
            tmux new-window -t $1:1 -n 'bash'
            tmux last-window
            tmux select-pane -t $1:0.0
            tmux -2 attach-session -t $1
        elif [ $# == 0 ]
            then
                to $(basename $(pwd))
        else
            echo "to takes only one argument: to [sessionname]"
    fi
}

# Remotely add authorized ssh key
function rkey {
    if [ $# == 2 ]
        then
            ssh $1 'mkdir -p ~/.ssh && echo '`cat $2`' >> ~/.ssh/authorized_keys'
    else
        echo "rkey takes two arguments: rkey [user]@[host] [publickeyfile]"
    fi
}
