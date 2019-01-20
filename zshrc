source /etc/profile
#2. 替换 Homebrew Bottles源
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/iff/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
 #See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
#ZSH_THEME="ys"
#RPROMPT="%/"        #右提示符

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export DEFAULT_USER="iff"
# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set per'sonal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# man 语法高亮

#export LESS_TERMCAP_mb=$'\E[1m\E[32m'
#export LESS_TERMCAP_mh=$'\E[2m'
#export LESS_TERMCAP_mr=$'\E[7m'
#export LESS_TERMCAP_md=$'\E[1m\E[36m'
#export LESS_TERMCAP_ZW=""
#export LESS_TERMCAP_us=$'\E[4m\E[1m\E[37m'
#export LESS_TERMCAP_me=$'\E(B\E[m'
#export LESS_TERMCAP_ue=$'\E[24m\E(B\E[m'
#export LESS_TERMCAP_ZO=""
#export LESS_TERMCAP_ZN=""
#export LESS_TERMCAP_se=$'\E[27m\E(B\E[m'
#export LESS_TERMCAP_ZV=""
#export LESS_TERMCAP_so=$'\E[1m\E[33m\E[44m'

# 开关机别名设置

alias gg='shutdown -h now'
alias cq='shutdown -r now'
alias g-='shutdown -h $1 '
alias c-='shutdown -r $1 '
alias qx='shutdown -c'


# proxy
export http_proxy=http://127.0.0.1:1087
export https_proxy=$http_proxy

# 编译运行C++, shell文件
last2="init"
source ~/.runcpp_sh					#运行cpp
source ~/.runsh_sh					#运行cpp
source ~/.record_last_vimfile_sh	#记录上一个编辑的文件
#qt快速打包
#source /home/itt/Coding/QtCoding/.auto_package/autoPackage.sh
#快速压缩解压
source ~/.fast_tar_untar.sh


#git 
alias gall='git add *'
alias gci='git commit -m \"$*\"'
alias glg='git lg'
alias rlg='git reflog'
alias rst='git reset --hard '
alias cm='gaa ; gci'

#chmod +x 
alias xx='chmod +x $1'
alias ee='nohup nautilus ./ > $HOME/.nohup_out 2>&1 &'
#kill process
alias ki='pkill -9 $1'

#other
alias mv='mv -i'

# 更新路径
source ~/.local/config/z.sh


# 快速编辑文件
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias szsh='source ~/.zshrc'
alias gh='vim ~/.vim/gitStudy.txt'


# fzf 快速查找文件
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
 #fzf 使用别名
#ff() {
#fzf --preview '[[ $(file --mime {}) =~ binary  ]] && echo {} is a binary file || (rougify {}  || highlight -O ansi -l {} || coderay {} || cat {}) 2> /dev/null | head -500'
#}


alias study='vim ~/study.sh'
alias study2='vim ~/.local/config/bash.sh'
alias e='cd /media/Document'
alias jpt='jupyter notebook > $HOME/.nohup_out 2>&1 &'
alias j='cd `cat ~/.local/.path`'
alias jv='f=`cat .local/.last_vim `; cd ${f%/*}'
alias fin='find ./ -name '
alias vi='vv'
alias tt='taskbook'
alias aa='brew install'
alias fsize='du -h -d 1'
