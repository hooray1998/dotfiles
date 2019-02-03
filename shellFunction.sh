#!/bin/bash
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


 #fzf 使用别名
ff() { out=`fzf --preview '[[ $(file --mime {}) =~ binary ]] && 
echo {} is a binary file || (rougify {} || highlight -O ansi -l 
{} || coderay {} || cat {}) 2> /dev/null | head -500'` vim $out
}
