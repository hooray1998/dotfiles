# 全局别名使用
# showpath
#
# --bind 'ctrl-a:select-all'
# --prompt='∼ ' --pointer='▶' --marker='✔'
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--cycle
--marker='✔'
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -L 2 -C {} | less)) || echo {} 2> /dev/null | head -50'
--preview-window=:wrap
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--bind '?:toggle-preview'
--bind 'ctrl-v:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-o:execute(echo {+} | xargs -o vim)'
"
alias -g Z='| fzf' # change Z to whatever you like
alias showpath='echo $PATH | tr ":" "\n" Z'

# fzf's command
# export FZF_DEFAULT_COMMAND="fd"
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git' --exclude 'node_modules'"
# CTRL-T's command
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# ALT-C's command
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"

_fzf_compgen_path() {
    fd . "$1"
}
_fzf_compgen_dir() {
    fd --type d . "$1"
}

# find-in-file - usage: fif <SEARCH_TERM>
fif() {
  if [ ! "$#" -gt 0 ]; then
    echo "Need a string to search for!";
    return 1;
  fi
  rg --files-with-matches --no-messages "$1" | fzf $FZF_PREVIEW_WINDOW --preview "rg --ignore-case --pretty --context 10 '$1' {}"
}



#——————————————————————————————————————————————————————————————————
# NOTE: for Docker
#——————————————————————————————————————————————————————————————————
# Select a docker container to start and attach to
function da() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}
# Select a running docker container to stop
function ds() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}
# Select a docker container to remove
function drm() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker rm "$cid"
}
