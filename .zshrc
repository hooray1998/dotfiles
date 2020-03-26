# ======================================================
# File Name: .zshrc
# Author: z50006490
# Mail:zhuyafei1@huawei.com
# Created Time: 2020-03-26 15:44
# Copyright © 2020 Huawei. All Rights Reserved.
# ======================================================
# 历史命令使用Ctrl-r
# 复杂定制任务使用task
# 命令查询使用tell
# 原理总结使用note笔记存储
# ======================================================

export CONFIG=$HOME/.local/config
export PATH=$CONFIG/niceBinary:$PATH
export PATH=$HOME/anaconda3/bin:$PATH
export PATH=$HOME/.local/go/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/SoftWare/node-v12.14.1-linux-x64/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/.config/yarn/global/node_modules/.bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$HOME/.local/config/niceBinary:$PATH

test -n "$ZSH_VERSION" &&
    source $HOME/.vim/niceVim/new.zsh # zsh增强功能

source $CONFIG/shell/vim.sh           # vim
source $CONFIG/shell/tool.sh          # 工具
source $CONFIG/shell/filemanage.sh    # 文件管理
source $CONFIG/shell/path.sh          # 路径
source $CONFIG/shell/git.sh           # git
source $CONFIG/shell/note.sh          # 笔记
source $CONFIG/shell/task.sh          # 任务
source $CONFIG/shell/system.sh        # 系统
source $CONFIG/shell/prompt.sh        # 命令提示符


#——————————————————————————————————————————————————————————————————
# Title: 按键映射
#——————————————————————————————————————————————————————————————————

# bind '"\e[15~":"task\n"' # F5
if [ -n "$BASH_VERSION" ]; then
    bind '"\C-t":"\C-utask\C-m"'
    bind '"\C-f":"\C-uff\C-m"'
    bind '"\C-g":"\C-ugo_marks\C-m"'
    bind '"\C-o":"\C-ulfcd\C-m"'
    bind '"\C-y":"\C-utell\C-m"'
elif [ -n "$ZSH_VERSION" ]; then
    bindkey -s '\C-t' '\C-utask\n'
    bindkey -s '\C-f' '\C-uff\n'
    bindkey -s '\C-g' '\C-ugo_marks\n'
    bindkey -s '\C-o' '\C-ulfcd\n'
    bindkey -s '\C-y' '\C-utell\n'
fi

test -z "$TMUX" && (tmux attach || tmux new-session)
