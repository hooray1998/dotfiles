
function note(){
    last=`cat $HOME/.last-vim-list/last-note`
    if [ -n "$*"  ]; then
        case $* in
            j*) shift && cd ${last%/*};find ~/MyNutStore/Notes  -mtime -3 -type f |grep md ;;
            *) shift ;;
        esac
    else
        vim $last
    fi
}

export NOTE="$HOME/MyNutStore/Notes"
