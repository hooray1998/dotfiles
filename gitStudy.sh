####=====================================================
#	常用别名
####=====================================================
gaa # 添加
cm # 添加并提交
ggpush # 推送到github
ggpull # 拉取分支,在推送之前
alias glg='git lg' # 显示提交日志
alias grlg='git reflog' # 显示版本变更操作记录
alias grst='git reset --hard ' # 版本回退
alias ignore='vim .gitignore' # 编辑.gitignore文件
gmerge_dev  # no-ff模式 合并develop分支
####=====================================================

git init
git log				 # catch commit log
	 --pretty=oneline
git status
git diff
	  filename
git reflog ? # record every command


git checkout -- *
git checkout -- <filename> # 丢弃工作区的修改,变回到暂存区或无暂存区的情况下最近的一次提交对应的文件
git reset --hard HEAD # 重置到最新的一次提交, 丢弃未提交的所有内容.
git reset --hard HEAD^
git reset --hard HEAD^^
git reset --hard versionNumber

# 如果当前工作区的修改未提交,版本回退之后仍然在那,不会重置和删除.


git checkout -- filename # turn to be the version of in "git add" or in "git commit"

git remote add origin https: # github.com/hooray1998/linuxConfig.git
git push -u origin master

git push origin master  #  push git from to github


git clone git@github.com:hooray1998/QtCoding.git
git clone git@github.com:GoldenPlan666/loveyue.git


-----------start branch
git branch 
git branch <name>     # make this branch
git checkout <name>  # change to this branch
git checkout -b <name>  #  make and change to this branch

git merge <name>  # merge <name>branch to current branch
git branch -d <name>   # del this branch
git log --graph   # watch    the graph of merge

git merge  --no-ff -m "说出你想说的话"  develop    #  merge by no-fast-forward    --> benefit to watch when we merge a branch.
