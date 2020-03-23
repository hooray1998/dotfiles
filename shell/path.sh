alias j='z'
alias zb='z -b'
#alias zz='z -i'
#alias zc='z -c'
#alias zf='z -I'
#alias zb='z -b'
#alias zh='z -I -t .'
#alias zzc='zz -c'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

if [ -n "$BASH_VERSION" ];then
    eval "$(lua $CONFIG/niceBinary/z.lua --init bash enhanced once echo)"
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
elif [ -n "$ZSH_VERSION" ];then
    eval "$(lua $CONFIG/niceBinary/z.lua --init zsh enhanced once echo)"
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

export MARKPATH=$HOME/.local/share/marks
source $CONFIG/niceBinary/m.sh
alias go_marks='mark=`ls $MARKPATH| fzf --header="Jump to mark"`&& test -n $mark && cd $(readlink $MARKPATH/$mark 2> /dev/null)'
# alias go_marks='cd $(readlink $MARKPATH/`ls $MARKPATH| fzf --header="Jump to mark"` 2> /dev/null)'

LFCD=~/.config/lf/lfcd.sh
if [ -f "$LFCD" ]; then
    source $LFCD
fi
