export PATH=/home/itt/anaconda3/bin:$PATH
export PATH=/home/itt/.local/go/bin:$PATH
export PATH=/home/itt/.local/bin:$PATH
export PATH=/home/itt/SoftWare/node-v12.14.1-linux-x64/bin:$PATH
export PATH=/home/itt/.yarn/bin:$PATH
export PATH=/home/itt/.config/yarn/global/node_modules/.bin:$PATH
export PATH=/home/itt/.cabal/bin:$PATH
export PATH=/home/itt/.local/config/niceBinary:$PATH
export CONFIG=$HOME/.local/config

test -n "$ZSH_VERSION" && source $HOME/.vim/niceVim/new.zsh  # zsh增强功能
source $CONFIG/shell/vim.sh        # vim
source $CONFIG/shell/tool.sh       # 工具
source $CONFIG/shell/filemanage.sh # 文件管理
source $CONFIG/shell/path.sh       # 路径
source $CONFIG/shell/git.sh        # git
source $CONFIG/shell/note.sh       # 笔记
source $CONFIG/shell/task.sh       # 任务
source $CONFIG/shell/system.sh     # 系统
source $CONFIG/shell/prompt.sh     # 命令提示符


#——————————————————————————————————————————————————————————————————
# Title: 按键映射
#——————————————————————————————————————————————————————————————————

# bind '"\e[15~":"task\n"' # F5
if [ -n "$BASH_VERSION" ]; then
    bind '"\C-t":"task\C-m"'
    bind '"\C-f":"ff\C-m"'
    bind '"\C-g":"go_marks\C-m"'
    bind '"\C-o":"lfcd\C-m"'
    bind '"\C-y":"hhedit\C-m"'
elif [ -n "$ZSH_VERSION" ]; then
    bindkey -s '\C-t' 'task\n'
    bindkey -s '\C-f' 'ff\n'
    bindkey -s '\C-g' 'go_marks\n'
    bindkey -s '\C-o' 'lfcd\n'
    bindkey -s '\C-y' 'hhedit\n'
fi

test -z "$TMUX" && (tmux attach || tmux new-session)
