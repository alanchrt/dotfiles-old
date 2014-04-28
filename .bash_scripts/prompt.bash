# .bash_prompt - Alaln Christopher Thomas
# http://alanct.com

# Readable variables
Yellow="\[\033[38;5;227m\]"
Red="\[\033[38;5;197m\]"
DarkGray="\[\033[38;5;240m\]"
Gray="\[\033[38;5;244m\]"
LightGray="\[\033[38;5;248m\]"
ColorOff="\[\033[0m\]"
Hostname="\h"

# Truncate pwd
export PROMPT_COMMAND='CurDir=$(_pwd_short)'

# Export the prompt
export PS1=$Gray'$(_current_venv)'$ColorOff$DarkGray$Hostname$ColorOff'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
    echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
    if [ "$?" -eq "0" ]; then \
        echo "'$LightGray'"$(__git_ps1 " [%s]"); \
    else \
        echo "'$Red'"$(__git_ps1 " {%s}"); \
    fi) '$Yellow'$CurDir'$ColorOff'\$ "; \
else \
    echo " '$Yellow'$CurDir'$ColorOff'\$ "; \
fi)'
