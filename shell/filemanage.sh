alias xx='chmod +x $1'
alias e='cd /media/Document'
alias mv='mv -i'
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias ls='ls --color=tty'
alias fsize='du -hd 1'
alias rm='trash'
export TRASH_DIR="$HOME/.trash"
alias rl="ll $TRASH_DIR"
alias rclear="/bin/rm -rf $TRASH_DIR/*"
trash()
{
    for f in $@;do
        date_str=`date +%Y%m%d-%H:%M:%S`
        mv $f $TRASH_DIR/${f}' Del:'${date_str}
    done
}

#fzf 使用别名
ff() { 
    out=`fzf --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (rougify {} || highlight -O ansi -l {} || coderay {} || cat {}) 2> /dev/null | head -500'`
    test -f "$out" && vim $out
}

function ccat() {
    local style="monokai"
    if [ $# -eq 0 ]; then
        pygmentize -P style=$style -P tabsize=4 -f terminal256 
-g
    else
        for NAME in $@; do
            pygmentize -P style=$style -P tabsize=4 -f 
terminal256 -g "$NAME"
        done
    fi
}



# 自动解压：判断文件后缀名并调用相应解压命令
function q-extract() {
    if [ -f $1 ] ; then
        case $1 in
        *.tar.bz2)   tar -xvjf $1    ;;
        *.tar.gz)    tar -xvzf $1    ;;
        *.tar.xz)    tar -xvJf $1    ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       rar x $1       ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar -xvf $1     ;;
        *.tbz2)      tar -xvjf $1    ;;
        *.tgz)       tar -xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# 自动压缩：判断后缀名并调用相应压缩程序
function q-compress() {
    if [ -n "$1" ] ; then
        FILE=$1
        case $FILE in
        *.tar) shift && tar -cf $FILE $* ;;
        *.tar.bz2) shift && tar -cjf $FILE $* ;;
        *.tar.xz) shift && tar -cJf $FILE $* ;;
        *.tar.gz) shift && tar -czf $FILE $* ;;
        *.tgz) shift && tar -czf $FILE $* ;;
        *.zip) shift && zip $FILE $* ;;
        *.rar) shift && rar $FILE $* ;;
        esac
    else
        echo "usage: q-compress <foo.tar.gz> ./foo ./bar"
    fi
}
