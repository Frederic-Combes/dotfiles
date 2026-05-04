# worktrunk: nicer git worktree wrapper
eval "$(command wt config shell init zsh)"

alias gg='wt switch'
alias gd='wt remove'
alias gca='git commit --amend --no-edit'
alias grm='git rebase -i origin/main'
alias gpf='git push --force-with-lease --force-if-includes'
alias gfp='git fetch --prune'
alias gs='git status'
alias grc='git rebase --continue'
alias gau='git add -u'

gcm() {
    git commit -m "$*"
}

gl() {
    git --no-pager log --oneline -n "${1:-20}"
}
