# Git 用法总结

### 基本用法

命令|说明
:-|:-
`git init`|初始化一个 git 仓库
`git status`|显示当前 git 仓库状态
`git add <filename>`|增加文件到暂存区
`git add --all`|增加所有文件到暂存区
`git commit -m "版本说明"`|提交一次版本记录
`git log`|显示 git 提交日志
`git diff [filename]`|显示工作区和暂存区或最近的一次提交的不同
`git reflog`|记录每一次的版本变动

### 丢弃工作区的修改，恢复到暂存区或最近的一次提交

```sh
git checkout -- *
git checkout -- <filename>
```

### 丢弃工作区和暂存区的所有改动

>只要是版本变动都会**清空工作区和暂存区的内容**

```sh
git reset --hard HEAD # 重置到最新的一次提交，丢弃未提交的所有内容。
git reset --hard HEAD^  # 再上一个
git reset --hard HEAD^^
git reset --hard versionNumber # 只输入前几位即可
```

### 推送到远程仓库

```sh
# （本地）创建 ssh 秘钥
ssh-keygen -t rsa -C "hooray1998@foxmail.com"
# （远程）添加本机的公钥
# （远程）然后新建一个存储库

# （本地）增加远程仓库，起名 origin
git remote add origin git@github.com:hooray1998/linuxConfig.git
# （本地）初次 push 需要加 -u 参数
git push -u origin master
# 后续 push 不需要
git push origin master
# 拉取远程分支
git pull origin master
```

### 克隆远程仓库

```sh
git clone git@github.com:hooray1998/QtCoding.git
#仅获取最新版和一个历史版本，即最后 2 个版本
git clone git@github.com:hooray1998/QtCoding.git --depth=1
```

### 使用分支

```sh
查看分支
git branch
创建分支
git branch <name>     # make this branch
git branch -d <name>   # del this branch
切换分支
git checkout <name>  # change to this branch
创建并切换
git checkout -b <name>  #  make and change to this branch
删除分支
git branch -D <name>  # delete a branch unmerged
```

合并分支的两种方式

1. 快进 (Fast-forward) 合并到当前分支
    - `git merge <name>`
2. no-Fast-forward 合并到当前分支，方便看到合并的痕迹
    - `git merge  --no-ff -m "合并说明"  develop`

### 储藏当前的工作区

>经常有这样的事情发生，当你正在进行项目中某一部分的工作，里面的东西处于一个**比较杂乱的状态**，而你想转到其他分支上进行一些工作。问题是，你**不想提交进行了一半的工作**，否则以后你无法回到这个工作点。解决这个问题的办法就是**git stash**命令。
>“储藏”可以获取你工作目录的**中间状态**——也就是你**修改过的被追踪的文件和暂存的变更**——并将它保存到一个未完结变更的**堆栈**中，随时可以重新应用。

```sh
# 暂时储藏
git stash    # save the current workspace uncomplish
# 显示所有储藏
git stash list   # show the list of you stash before
# 恢复最新的储藏
git stash apply [stash@{N}]
# 恢复并删除
git stash pop
# 删除储藏
git stash drop [stash@{N}]
```

### 使用标签

```sh
# 在当前版本上创建轻量级标签
git tag <name>
# 在当前版本上创建带注释的标签
git tag -a <tagName> -m  "balabala..."
# 展示所有的标签
git tag
# 删除标签
git tag -d <tagName> # delete a tag
# 展示某个标签的信息
git show <tagName>
# 切换到某一标签
git checkout <tagName>
# push 某个标签到远程
git push origin <tagName>
# push 所有标签到远程
git push origin --tags
# 删除某个远程的标签
git push origin :refs/tags/<tagName>
```

### 使用.gitignore 文件

>.gitignore 中的文件或目录会被忽略

如果之前未忽略，以后想忽略，需要执行`git rm -r --cached <file/dir>`, 否则可能会忽略失败

gitignore 文件可以参考 [github 上的示例](https:#github.com/github/gitignore)

## 建议初始配置

```sh
git config --global color.ui true

# 使用 git unstage 取消暂存
git config --global alias.unstage 'reset HEAD'
eg: git unstage test.py   =>   git reset HEAD test.py

# git lg 显示更精简的信息
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```

### bash 中建议的别名设置

```sh
alias gb='git branch'
alias gd='git diff'
alias gst='git status'
alias gaa='git add --all'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias ggpush='git push origin "$(git_current_branch)"'
alias ggpull='git pull origin "$(git_current_branch)"'
alias glg='git lg' # 显示提交日志
alias grlg='git reflog' # 显示版本变更操作记录
alias ignore='vim .gitignore' # 编辑.gitignore 文件
cm(){ gaa; git commit -m "$*" } # 快速提交
gmerge_dev(){ git merge --no-ff -m "$*" develop }
```

