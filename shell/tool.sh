# bc is basic calculation
# toilet cheat lolcat bash-handbook
# fortune espeak
#以进度条的方式显示命令行的执行进度。
#tail -f file
#能够监控文件的变化，实时输出到标准输出
export tldr_dir="$CONFIG/tldr-pages/"
export cheat_dir="$CONFIG/cheat/"

alias tt='dosbox /home/itt/DOSBox/tt.exe  &'
alias s='$CONFIG/search_and_record.sh'
alias word='vim $CONFIG/word.list'
export test_dir="$HOME/.test"
t(){
    test_dir=$HOME/.test
    if [ -n "$*"  ]; then
        case $* in
            py) vim $test_dir/*.py;;
            c)  vim $test_dir/*.c;;
            cpp)vim $test_dir/*.cpp;;
            sh) vim $test_dir/*.sh;;
            *)  vim test.$1;;
        esac
        #done
    else
        vim $test_dir
    fi
}
