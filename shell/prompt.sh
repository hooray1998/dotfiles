#!/bin/bash
export RPROMPT="%F{red}%(?..%?)%f"
if [ -n "$BASH_VERSION" ]; then
    export PS1='\[\e[38;5;135m\]加油呀\u\[\e[0m\] \[\e[38;5;118m\]\w\[\e[0m\] > '
else
    if [ "$UID" -eq 0 ]; then
        export PROMPT="%F{135}%n%f@%F{166}%m%f %F{118}%~%f %# "
    else
        export PROMPT="%F{045}加油呀%n%f %F{118}%c%f > "
        #export PROMPT="%F{135}%n%f@%F{166}%m%f %F{118}%~%f \$ "
    fi
fi
