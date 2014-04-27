# .bash_prompt - Alaln Christopher Thomas
# http://alanct.com

# Readable variables
Yellow="\[\033[0;33m\]"
White="\[\033[0;37m\]"
IBlack="\[\033[0;90m\]"
ColorOff="\[\033[0m\]"
Hostname="\h"

# Truncate pwd
export PROMPT_COMMAND='CurDir=`echo ${PWD/#$HOME/\~}|sed -re "s!([^/.|^/])[^/]+/!\1/!g"`'

# Export the prompt
export PS1=$IBlack$Hostname$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
    echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
    if [ "$?" -eq "0" ]; then \
        echo "'$White'"$(__git_ps1 " (%s)"); \
    else \
        echo "'$White'"$(__git_ps1 " {%s}"); \
    fi) '$Yellow'$CurDir'$ColorOff'\$ "; \
else \
    echo " '$Yellow'$CurDir'$ColorOff'\$ "; \
fi)'
