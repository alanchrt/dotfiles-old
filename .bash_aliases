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

# Remotely add authorized ssh key
function rkey {
    ssh $1 'mkdir -p ~/.ssh && echo '`cat $2`' >> ~/.ssh/authorized_keys'
}
