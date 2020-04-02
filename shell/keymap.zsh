# bind '"\e[15~":"task\n"' # F5
if [ -n "$BASH_VERSION" ]; then
    bind '"\C-t":"\C-utask\C-m"'
    bind '"\C-g":"\C-um\C-m"'
    bind '"\C-o":"\C-ulfcd\C-m"'
    bind '"\C-y":"\C-utell\C-m"'
elif [ -n "$ZSH_VERSION" ]; then
    # 修改fzf的按键绑定为c-f
    bindkey -s '\C-t' '\C-utask\n'
    bindkey -s '\C-g' '\C-um\n'
    bindkey -s '\C-o' '\C-ulfcd\n'
    bindkey -s '\C-y' '\C-utell\n'

    # default keymap
    bindkey -s '\ee' '\C-uvim\n'
    bindkey '\eh' backward-char
    bindkey '\el' forward-char
    bindkey '\ej' down-line-or-history
    bindkey '\ek' up-line-or-history
    bindkey '\eH' backward-word
    bindkey '\eL' forward-word
    bindkey '\eJ' beginning-of-line
    bindkey '\eK' end-of-line

    bindkey -s '\eo' '\C-ucd ..\n'
    bindkey -s '\e;' '\C-ull\n'

fi

