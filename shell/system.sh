alias guanji='shutdown -h now'
alias cq='shutdown -r now'
alias g-='shutdown -h $1 '
alias c-='shutdown -r $1 '
alias quxiaoguanji='shutdown -c'

# ===========================================================
# proxy 终端下翻墙, 访问github更快
clearproxy(){
    export http_proxy=""
    export https_proxy="$http_proxy"
    export all_proxy="socks://127.0.0.1:1080"
}
setproxy(){
    export http_proxy="http://127.0.0.1:10809"
    export https_proxy="$http_proxy"
    export all_proxy="socks5://127.0.0.1:1080"
}

[ -n "$ZSH_VERSION" ] && setopt no_nomatch  # zsh通配符问题
