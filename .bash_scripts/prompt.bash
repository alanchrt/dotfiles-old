# .bash_prompt - Alaln Christopher Thomas
# http://alanct.com

# Readable variables
Yellow="\[\033[38;5;227m\]"
Cyan="\[\033[38;5;152m\]"
Orange="\[\033[38;5;202m\]"
Gray="\[\033[38;5;240m\]"
ColorOff="\[\033[0m\]"
Hostname="\h"

# Truncate pwd
export PROMPT_COMMAND='CurDir=`echo ${PWD/#$HOME/\~}|sed -re "s!([^/.|^/])[^/]+/!\1/!g"`'

# Export the prompt
export PS1=$Gray$Hostname$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
    echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
    if [ "$?" -eq "0" ]; then \
        echo "'$Cyan'"$(__git_ps1 " [%s]"); \
    else \
        echo "'$Orange'"$(__git_ps1 " {%s}"); \
    fi) '$Yellow'$CurDir'$ColorOff'\$ "; \
else \
    echo " '$Yellow'$CurDir'$ColorOff'\$ "; \
fi)'
