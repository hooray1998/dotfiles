source /etc/profile # 更新环境变量
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles # 替换 Homebrew Bottles源
. /Users/iff/anaconda3/etc/profile.d/conda.sh # 可以使用conda命令
source ~/.local/config/z.sh # 自动路径跳转
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # fzf 快速查找文件
eval $(thefuck --alias) # for thefuck

# ===========================================================
# someFunction:
#	1. ccat, 高亮cat
#	2. ff,   实时预览的fzf
source ~/.local/config/shellFunction.sh
alias someFunction='vi ~/.local/config/shellFunction.sh'

# ===========================================================
# proxy 终端下翻墙, 访问github更快
fanqiang(){
	export http_proxy=http://127.0.0.1:1087
	export https_proxy=$http_proxy
}

# ===========================================================
# zsh
export ZSH="/Users/iff/.oh-my-zsh"
#RPROMPT="%/" #右提示符
ZSH_THEME="robbyrussell" 
plugins=( git ) 
source $ZSH/oh-my-zsh.sh 

export DEFAULT_USER="iff"

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
#source /home/itt/Coding/QtCoding/.auto_package/autoPackage.sh #qt快速打包

# ===========================================================
# 编辑配置
alias vimrc_null='vim  ~/.local/config/.vimrc_null'
alias vimrc_ycm='vim  ~/.local/config/.vimrc_ycm'
# Vim 切换
alias null='cp ~/.local/config/.vimrc_null ~/.vimrc; echo "vim快捷版"'
alias ycm='cp ~/.local/config/.vimrc_ycm ~/.vimrc; echo "vim完整版"'
cp ~/.local/config/.vimrc_null ~/.vimrc # 默认启用vim快捷版

# ===========================================================
# Git常用命令: git gaa cm ggpush ggpull
alias glg='git lg' 
alias grlg='git reflog' 
alias grst='git reset --hard ' 
alias ignore='vim .gitignore'
cm(){
	if [ `pwd` = "/Users/iff/.local/config" ]
	then
		echo '拷贝相关文件'
		cp ~/.gitconfig ./gitconfig
		cp ~/.zshrc ./zshrc
		cp ~/.vimrc ./vimrc
	fi
	gaa
	git commit -m "$*"
}
gmerge_dev(){
	git merge --no-ff -m "$*" develop
}



# ===========================================================
# install app
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
alias jpt='jupyter notebook'
alias jv='f=`cat .local/.last_vim `; cd ${f%/*}'
alias fin='find ./ -name '
alias tt='taskbook'
alias fsize='du -h -d 1'
alias note='cd /Users/iff/pySpree/PY_notes/ ; ls -tr|grep note'
alias s='tl'
alias helpbash='vim ~/.local/config/bash-handbook.md'
alias h='tldr'
alias todo='vim ~/.local/config/.todo.sh'
alias words='vim ~/.local/config/.words'

# For Blog
alias writeBlog='cd ~/Blog; ./.new-a-blog.sh'
alias edit='~/blog/.edit-this-blog.sh'
alias bb='cd ~/Blog; open -a "/Applications/Google Chrome.app" index.html'
alias bbb='cd ~/Blog; open -a "/Applications/Google Chrome.app" http://hoorayitt.coding.me/blog/index'
alias aa='cd ~/love; open -a "/Applications/Google Chrome.app" index.html'

# ===========================================================
# other tool:
# tl tldr toilet cheat thefuck lolcat bash-handbook tmux 
# FileFormat jp2a

