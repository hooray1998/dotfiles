# git reset
> Undo commits or unstage changes, by resetting the current git HEAD to the specified state
> If a path is passed, it works as "unstage"; if a commit hash or branch is passed, it works as "uncommit"
> More information: <https://git-scm.com/docs/git-reset>
- **Unstage everything:**
git reset
- **Unstage specific file(s):**
git reset `path/to/file(s)`
- **Unstage portions of a file:**
git reset -p `path/to/file`
- **Undo the last commit, keeping its changes (and any further uncommitted changes) in the filesystem:**
git reset HEAD~
- **Undo the last two commits, adding their changes to the index, i.e. staged for commit:**
git reset --soft HEAD~2
- **Discard any uncommitted changes, staged or not (for only unstaged changes, use git checkout):**
git reset --hard
- **Reset the repository to a given commit, discarding committed, staged and uncommitted changes since then:**
git reset --hard `commit`

版本回退
git reset --soft HEAD^
HEAD^的意思是上一个版本，也可以写成HEAD~1
如果你进行了2次commit，想都撤回，可以使用HEAD~2

--mixed
意思是：不删除工作空间改动代码，撤销commit，并且撤销git add操作
这个为默认参数,git reset --mixed HEAD^ 和 git reset HEAD^ 效果是一样的。
--soft  
不删除工作空间改动代码，撤销commit，不撤销git add
--hard
删除工作空间改动代码，撤销commit，撤销git add
