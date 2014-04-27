# .bash_aliases - Alan Christopher Thomas
# http://alanct.com/

# ls aliases
alias ls='ls -G --color=auto'
alias ll='ls -al'
alias la='ls -A'

# Git aliases
alias gst='git status'
alias gad='git add'
alias gbr='git branch'
alias gcm='git commit'
alias gdi='git diff --color'
alias gdt='git difftool'
alias gco='git checkout'
alias glo='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %C(cyan)(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gpv='git checkout $(git reflog | grep checkout: -m 2 | tail -n1 | cut -d " " -f 8-)'

# Git bash completion
if type __git_complete > /dev/null 2>&1; then
    __git_complete gad _git_add
    __git_complete gbr _git_branch
    __git_complete gcm _git_commit
    __git_complete gdi _git_diff
    __git_complete gdt _git_difftool
    __git_complete gco _git_checkout
fi

# Truncated pwd
_pwd_short() {
    echo ${PWD/#$HOME/\~}|sed -re "s!([^/.|^/])[^/]+/!\1/!g"
}

# Tmux aliases
alias ta='tmux -2 attach-session -t'
alias tl='tmux list-sessions'

# Use proper terminal for weechat
alias wee='TERM=screen-256color weechat'

# Python
alias py='python'
alias ipy='ipython'

# Ranger
alias rn='ranger'

# Virtualenv shortcuts
alias mkve='mkvirtualenv'
alias wo='workon'
alias conf='cat $VIRTUAL_ENV/bin/postactivate'

# Virtualenv bash completion
if type complete > /dev/null 2>&1; then
    complete -o default -o nospace -F _virtualenvs wo
fi

# Tree colorization
alias tree='tree -C'

# Run flake8 and ignore convenience imports
alias fl='flake8 | grep -v "__init__.py:[0-9]*:1: F401"'

# Start tmux session for coding
function to {
    if [ "$#" == 1 ]
        then
            tmux new-session -s $1
        elif [ "$#" == 0 ]
            then
                to $(basename $(pwd))
        else
            echo "to takes only one argument: to [sessionname]"
    fi
}

# Remotely add authorized ssh key
function rkey {
    if [ "$#" == 1 ]
        then
            ssh $1 'mkdir -p ~/.ssh && echo '`cat ~/.ssh/id_rsa.pub`' >> ~/.ssh/authorized_keys'
    else
        echo "rkey takes one argument: rkey [user]@[host]"
    fi
}

# Extract file
xf () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "unknown archive type" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}
