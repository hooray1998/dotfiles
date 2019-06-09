alias vim=nvim
source /etc/profile # 更新环境变量
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles # 替换 Homebrew Bottles源
export PATH="$HOME/.cabal/bin:$PATH"

#. ~/anaconda3/etc/profile.d/conda.sh # 可以使用conda命令
#source ~/.local/config/z.sh # 自动路径跳转

eval "$(lua $HOME/.local/config/z.lua --init zsh enhanced once echo)"
alias zb='z -b'
source $HOME/.local/config/m.sh
#alias zz='z -i'
#alias zc='z -c'
#alias zf='z -I'
#alias zb='z -b'
#alias zh='z -I -t .'
#alias zzc='zz -c'
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
#fanqiang(){
	#export http_proxy=http://127.0.0.1:1080
	#export https_proxy=$http_proxy
	#export all_proxy="socks5://127.0.0.1:1081"	
#}

 #===========================================================
# zsh
export ZSH="/home/itt/.oh-my-zsh"
#RPROMPT="%/" #右提示符
ZSH_THEME="robbyrussell" 
#ZSH_THEME="ys" 
#ZSH_THEME="agnoster" 

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
cm(){ gaa; git commit -m "$*" }
gmerge_dev(){ git merge --no-ff -m "$*" develop }



# ===========================================================
# install app
alias aa='sudo apt install'
alias ba='brew install'
alias na='npm install'
alias pa='pip install'

# ===========================================================
# 快速编辑文件
alias zshrc='vim ~/.local/config/.zshrc'
alias vimrc='vim ~/.config/nvim/init.vim'
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
alias studyShell2='vim ~/.local/config/bash-handbook.md'
alias studyCppSTL='vim /home/itt/Coding/CppCoding/csp/golden.cpp'
alias e='cd /media/Document'
alias ml='cd ML; ls -1'
alias jpt='jupyter notebook'
alias fin='find ./ -name '
alias tt='dosbox /home/itt/DOSBox/tt.exe  &'
alias fsize='du -h -d 1'
alias s='$HOME/.local/config/search_and_record.sh'
alias h='tldr'
alias pp='ipython'

# ===========================================================
#alias note='cd /home/itt/pySpree/PY_notes/ ; ls -tr|grep note'
alias words='vim ~/.words'

# For Blog
alias writeBlog='cd ~/blog; ./.new-a-blog.sh'
alias edit='~/blog/.edit-this-blog.sh'
alias bb='cd ~/Blog; open -a "/Applications/Google Chrome.app" index.html'
alias bbb='cd ~/Blog; open -a "/Applications/Google Chrome.app" http://hoorayitt.coding.me/blog/index'
#alias aa='cd ~/love; open -a "/Applications/Google Chrome.app" index.html'

# ===========================================================
# For todo && note
source /home/itt/.todo/config/todo.sh
alias list='vim ./*.list'
alias md='vim ~/MyNutStore/Notes'

function note(){


last=`cat $HOME/.last-vim-list/last-note`
if [ -n "$*"  ]; then
		case $* in
		.*) shift && vim ~/MyNutStore/Notes ;;
		a*) shift && vim ~/MyNutStore/Notes/algorithm ;;
		n*) shift && vim ~/MyNutStore/Notes/新建笔记.md;;
		j*) shift && cd ${last%/*};find ~/MyNutStore/Notes  -mtime -3 -type f |grep md ;;
		 *) shift ;;
		esac
	#done
else
	vim $last
fi
}

alias tim-er='/home/itt/Coding/QtRelease/send_to_tim.app/send_to_tim.sh &'
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
#alias jk='cd /home/itt/Coding/QtCoding/TestXlsx/'
alias j='cd /home/itt/Coding/QtCoding/ComeOnBoy/'
alias jj='/home/itt/Coding/QtCoding/sendData/TcpClient &'

alias vimm='vim `cat $HOME/.last-vim-list/last-md`'
alias vimc='vim `cat $HOME/.last-vim-list/last-cpp`'
alias vimp='vim `cat $HOME/.last-vim-list/last-py`'

alias jn='f=`cat $HOME/.last-vim-list/last-note`; cd ${f%/*}'
alias jm='f=`cat $HOME/.last-vim-list/last-md`; cd ${f%/*}'
alias jc='f=`cat $HOME/.last-vim-list/last-cpp`; cd ${f%/*}'
alias jp='f=`cat $HOME/.last-vim-list/last-py`; cd ${f%/*}'

# bc is basic calculation
alias jk='mycli -h localhost -u root -p 123456'
echo "正确指法按4（）-"

alias fanqiang-TW="cp ~/MyNutStore/v2ray/TW.json ~/MyNutStore/v2ray/config.json; service v2ray restart; service v2ray status"
alias fanqiang-JP="cp ~/MyNutStore/v2ray/JP.json ~/MyNutStore/v2ray/config.json; service v2ray restart; service v2ray status"
alias fanqiang-HK="cp ~/MyNutStore/v2ray/HK.json ~/MyNutStore/v2ray/config.json; service v2ray restart; service v2ray status"

#进入目录，然后 source activate myblogvenv 开启虚拟环境, source deactivate退出
export NOTE="$HOME/MyNutStore/Notes"
