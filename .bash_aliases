# .bash_aliases - Alan Christopher Thomas
# http://alanct.com/

# ls aliases
alias ls='ls -G'
alias ll='ls -al'
alias la='ls -A'

# git aliases
alias gst='git status'
alias gad='git add'
alias gbr='git branch'
alias gcm='git commit'
alias gdi='git diff --color'
alias gdt='git difftool'
alias gco='git checkout'
alias glo='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %C(cyan)(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gpv='git checkout $(git reflog | grep checkout: -m 2 | tail -n1 | cut -d " " -f 8-)'

# git bash completion
__git_complete gad _git_add
__git_complete gbr _git_branch
__git_complete gcm _git_commit
__git_complete gdi _git_diff
__git_complete gdt _git_difftool
__git_complete gco _git_checkout

# tmux aliases
alias ta='tmux -2 attach-session -t'
alias tl='tmux list-sessions'

# use proper terminal for irssi
alias wee='TERM=screen-256color weechat'

# python
alias py='python'
alias ipy='ipython'

# ranger
alias rn='ranger'

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
