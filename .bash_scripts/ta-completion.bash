# ta-completion.bash - Alan Christopher Thomas
# http://alanct.com/

_ta() {
    local word opts
    if [ ${#COMP_WORDS[@]} == 2 ]
        then
            word="${COMP_WORDS[COMP_CWORD])}"
            opts="`tmux list-sessions 2> /dev/null | awk -F':' '{ORS=\" \"; print $1}'`"
            COMPREPLY=($(compgen -W "${opts}" -- ${word}))
            return 0
    fi
}
complete -F _ta ta
