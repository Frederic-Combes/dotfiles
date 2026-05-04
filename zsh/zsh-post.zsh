# NOTE: This script requires some environment variable to be set
# - _USER_DOTFILES: path to the user dotfiles
# - _DEFAULT_NODE_VERSION: eg v24.10.0
#
# NOTE: This script requires some programs to be on the $PATH
# - uv, uvx
# - direnv
# - git, wt (worktrunk)
# - nvm

###############################################################################
# NOTE: git & co ##############################################################

eval "$(command wt config shell init zsh)"

alias gg='wt switch'
alias gd='wt remove'
alias gca='git commit --amend --no-edit'
alias grm='git rebase -i origin/main'
alias gpf='git push --force-with-lease'
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
###############################################################################
# NOTE: direnv ################################################################

eval "$(direnv hook zsh)"
export DIRENV_LOG_FORMAT=

###############################################################################
# NOTE: neovim ################################################################

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

###############################################################################
# NOTE: uv ####################################################################
 
if [[ ! -f ~/.zfunc/_uv ]]; then uv generate-shell-completion zsh > ~/.zfunc/_uv; fi
if [[ ! -f ~/.zfunc/_uvx ]]; then uvx --generate-shell-completion zsh > ~/.zfunc/_uvx; fi


###############################################################################
# NOTE: js/ts #################################################################

export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/.nvm/versions/node/$_DEFAULT_NODE_VERSION/bin:$PATH"

# Lazy load of nvm completions on first use
nvm() {
  unset -f nvm node npm npx
  # Load nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
  # Load nvm completions
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  
}
 
