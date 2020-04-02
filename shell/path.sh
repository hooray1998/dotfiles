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
    eval "$(lua $CONFIG/binary/bin/z.lua --init bash enhanced once echo)"
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
elif [ -n "$ZSH_VERSION" ];then
    eval "$(lua $CONFIG/binary/bin/z.lua --init zsh enhanced once echo)"
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi
unalias z 2> /dev/null
z() {
    [ $# -gt 0 ] && _zlua "$*" && return
    cd "$(_zlua -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

export MARKPATH=$HOME/.local/share/marks
source $CONFIG/binary/bin/m.sh

LFCD=~/.config/lf/lfcd.sh
if [ -f "$LFCD" ]; then
    source $LFCD
fi
