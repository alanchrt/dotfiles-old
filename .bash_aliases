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
alias ta='tmux attach-session -t'
alias tl='tmux list-sessions'

# Start tmux session for django project
function tdj {
    tmux new-session -d -s $1 -n 'vim' 'vim'
    tmux split-window -t $1:0 -v -l 4 './manage.py runserver'
    tmux new-window -t $1:1 -n 'bash'
    tmux last-window
    tmux select-pane -t test:0.0
    tmux attach-session -t $1
}

# Remotely add authorized ssh key
function rkey {
    ssh $1 'mkdir -p ~/.ssh && echo '`cat $2`' >> ~/.ssh/authorized_keys'
}
