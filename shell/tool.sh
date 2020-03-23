# bc is basic calculation
# toilet cheat lolcat bash-handbook
# fortune espeak
#以进度条的方式显示命令行的执行进度。
#tail -f file
#能够监控文件的变化，实时输出到标准输出

alias tt='dosbox /home/itt/DOSBox/tt.exe  &'
alias s='$CONFIG/search_and_record.sh'
alias word='vim $CONFIG/word.list'
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
export tldr_dir="$CONFIG/tldr-pages/"
hhedit(){
    cmd_name=${1:-`ls -t $tldr_dir|sed 's/.md//g'|fzf --reverse --inline-info --height 60% --header='选择需要编辑的命令'`}
    test -z $cmd_name && return
    test -f ${tldr_dir}${cmd_name} && vim ${tldr_dir}${cmd_name} || vim ${tldr_dir}${cmd_name}.md
}
hh(){
    cmd_name=${1:-`ls -t $tldr_dir|sed 's/.md//g'|fzf --reverse --inline-info --height 60% --header='选择需要查询的命令'`}
    test -z $cmd_name && return
    test -f $CONFIG/cheat/$cmd_name && cheat $cmd_name
    test -f ${tldr_dir}${cmd_name} && vim ${tldr_dir}${cmd_name} || tldr -f ${tldr_dir}${cmd_name}.md
}
