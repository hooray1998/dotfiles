source /etc/profile # 更新环境变量
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles # 替换 Homebrew Bottles源
#. ~/anaconda3/etc/profile.d/conda.sh # 可以使用conda命令
#source ~/.local/config/z.sh # 自动路径跳转
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # fzf 快速查找文件
#eval $(thefuck --alias) # for thefuck

# ===========================================================
# someFunction:
#	1. ccat, 高亮cat
#	2. ff,   实时预览的fzf
source ~/.local/config/shellFunction.sh
alias someFunction='vi ~/.local/config/shellFunction.sh'

# ===========================================================
# proxy 终端下翻墙, 访问github更快
fanqiang(){
	#export http_proxy=http://127.0.0.1:1080
	#export https_proxy=$http_proxy
	export all_proxy="socks5://127.0.0.1:1080"	
}

# ===========================================================
# zsh
export ZSH="/home/itt/.oh-my-zsh"
#RPROMPT="%/" #右提示符
ZSH_THEME="robbyrussell" 
plugins=( git ) 
source $ZSH/oh-my-zsh.sh 

export DEFAULT_USER="itt"

# ===========================================================
# 开关机别名设置
alias gg='shutdown -h now' 
alias cq='shutdown -r now' 
alias g-='shutdown -h $1 ' 
alias c-='shutdown -r $1 ' 
alias qx='shutdown -c'


# ===========================================================
# 编译运行C++, shell文件
last2="init"
source ~/.local/config/.runcpp_sh #运行cpp
source ~/.local/config/.runsh_sh #运行cpp
source ~/.local/config/.record_last_vimfile_sh #记录上一个编辑的文件

#===========================================================
source ~/.local/config/.fast_tar_untar_sh #快速压缩解压
source /home/itt/Coding/QtCoding/.auto_package/autoPackage.sh #qt快速打包

# ===========================================================
# 编辑配置
alias vimrc_null='vim  ~/.local/config/.vimrc_null'
alias vimrc_ycm='vim  ~/.local/config/.vimrc_ycm'
# Vim 切换
alias null='cp ~/.local/config/.vimrc_null ~/.vimrc; echo "vim快捷版"'
alias ycm='cp ~/.local/config/.vimrc_ycm ~/.vimrc; echo "vim完整版"'
cp ~/.local/config/.vimrc_ycm ~/.vimrc # 默认启用完整版

# ===========================================================
# Git常用命令: git gaa cm ggpush ggpull
alias gitstudy='vim $HOME/.local/config/gitStudy.sh'
alias glg='git lg' 
alias grlg='git reflog' 
alias grst='git reset --hard ' 
alias ignore='vim .gitignore'
cm(){
	if [ `pwd` = "/home/itt/.local/config" ]
	then
		echo '拷贝相关文件'
		cp ~/.gitconfig ./
		cp ~/.zshrc ./
	fi
	gaa
	git commit -m "$*"
}
gmerge_dev(){
	git merge --no-ff -m "$*" develop
}



# ===========================================================
# install app
alias aa='sudo apt install'
alias ba='brew install'
alias na='npm install'
alias pa='pip install'

# ===========================================================
# 快速编辑文件
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias szsh='source ~/.zshrc'
alias gh='vim ~/.vim/gitStudy.txt'

# ===========================================================
# other
alias xx='chmod +x $1' 
alias ee='nohup nautilus ./ > $HOME/.nohup_out 2>&1 &'
alias ki='pkill -9 $1' #kill process
alias mv='mv -i'
# ===========================================================
#alias study='vim ~/study.sh'
alias study='vim ~/.local/config/bash.sh'
alias e='cd /media/Document'
alias ml='cd ML; ls -1'
alias jpt='jupyter notebook'
alias jv='f=`cat .local/.last_vim `; cd ${f%/*}'
alias fin='find ./ -name '
alias tt='taskbook'
alias fsize='du -h -d 1'
alias s='$HOME/.local/config/search_and_record.sh'
alias helpbash='vim ~/.local/config/bash-handbook.md'
alias h='tldr'
alias pp='ipython'

# ===========================================================
alias note='cd /home/itt/pySpree/PY_notes/ ; ls -tr|grep note'
alias words='vim ~/.words'

# For Blog
alias writeBlog='cd ~/Blog; ./.new-a-blog.sh'
alias edit='~/blog/.edit-this-blog.sh'
alias bb='cd ~/Blog; open -a "/Applications/Google Chrome.app" index.html'
alias bbb='cd ~/Blog; open -a "/Applications/Google Chrome.app" http://hoorayitt.coding.me/blog/index'
#alias aa='cd ~/love; open -a "/Applications/Google Chrome.app" index.html'

# ===========================================================
# other tool:
# tl tldr toilet cheat thefuck lolcat bash-handbook tmux 
# FileFormat jp2a
# thefuck 
#	命令拼写错误
#	命令输错
#	权限不够
#
# fortune espeak
# pv
#以进度条的方式显示命令行的执行进度。
#tail -f file
#能够监控文件的变化，实时输出到标准输出


#alias todo='vim ~/.todo-vim/*.Todo -u ~/.todo-vim/.todo.vimrc' # 专属的vimrc启动
#alias todo2='vim ~/testUpdate/*.Todo -u ~/.todo-vim/.todo.vimrc' # 专属的vimrc启动
#cat ~/.todo-vim/*.Todo
#source $HOME/.todo-vim/todo.sh

# git clone --recursive https://github.com/davidhalter/jedi-vim.git ~/.vim/plugged/jedi-vim 
# 运行着ss， 输入fanqiang就解决了
# clone github 时使用国内的也挺快
#alias 回退='grst'
source /home/itt/.todo/bin/todo.sh
