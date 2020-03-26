alias glg='git lg'
alias grlg='git reflog'
alias grst='git reset --hard '
alias ignore='vim .gitignore'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gaa='git add --all'
alias gst='git status'
alias gb='git branch|cat '
alias gd=$CONFIG/niceBinary/diff.sh
# ===========================================================
# Git常用命令: git gaa cm ggpush ggpull

cm(){
    git add --all; git commit -m "$*"
}
gmerge_dev(){
    git merge --no-ff -m "$*" develop
}
