alias xx='chmod +x $1'
alias e='cd /media/Document'
alias mv='mv -i'
alias la='ls -lAh'
alias ll='ls -lah'
alias ls='ls --color=tty'
alias fsize='du -hd 1'

export TRASH_DIR="$HOME/.local/share/Trash/files/"
alias rrm='/bin/rm'
alias rm='trash-put'
alias rget='trash-restore'
alias rl="trash-list"
alias rclear="trash-empty"

# 自动解压：判断文件后缀名并调用相应解压命令
function Extract() {
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
        echo "usage: Extract <foo.tar.gz>"
    fi
}

# 自动压缩：判断后缀名并调用相应压缩程序
function Compress() {
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
        echo "usage: Compress <foo.tar.gz> ./foo ./bar"
    fi
}
