# .bash_aliases - Alan Christopher Thomas
# http://alanchristopherthomas.com/

# text aliases
alias xc='xclip -selection clipboard'
alias lip='lorem-ipsum-generator -p'
alias lis='lorem-ipsum-generator -s'

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
alias gh='git hist'

# tmux aliases
alias tn='tmux new-session -s'
alias ta='tmux -2 attach-session -t'
alias tl='tmux list-sessions'

# development server aliases
alias runs='../$(basename $(pwd))/manage.py runserver'

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

# List running development servers
function sl {
    if [ $# == 0 ]
        then
            ps ax -o pid,cmd | awk '$2 == "python" && $4 == "runserver" && $3 ~ /^\.\.\/[a-zA-Z0-9]+\/manage\.py/ {print $3, " ", $5}' | sed -rn 's/^[\.\/]+([a-zA-Z0-9]+)\/manage\.py/\1/p'
        else
          echo "sl does not take any arguments: sl"
    fi
}

# Kill development servers
function sk {
    if [ $# -gt 0 ]
        then
            for session in $@
                do
            cmd="ps ax -o pid,cmd | awk '\$2 == \"python\" && \$4 == \"runserver\" && \$3 ~ /^\.\.\/${session}\/manage\.py/ {print \$1}'"
            pid=$(eval $cmd)
            kill $pid
            done
        else
          echo "sk takes at least one argument: sk [sessionname]"
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
