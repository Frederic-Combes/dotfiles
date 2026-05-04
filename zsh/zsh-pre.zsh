# NOTE: This script requires some environment variable to be set
# - _USER_DOTFILES: path to the user dotfiles


# NOTE: Must run before oh-my-zsh, matters for compinit (completion)
[[ -d ~/.zfunc ]] || mkdir -p ~/.zfunc
fpath=(~/.zfunc $fpath)

# NOTE: zsh & oh-my-zsh
source "$ZSH/oh-my-zsh.sh"
source "$_USER_DOTFILES/zsh/vi-mode.zsh"


###############################################################################
# NOTE: shell prompt ##########################################################

ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg_bold[blue]%}%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"

# python: let the zsh prompt own the venv segment; suppress the activate 
# script's default.
export VIRTUAL_ENV_DISABLE_PROMPT=1

python_venv() {
  [[ -n $VIRTUAL_ENV_PROMPT ]] && print -n "%{$fg[green]%}(${VIRTUAL_ENV_PROMPT})%{$reset_color%} "
}

PROMPT=$'$(python_venv)%{$fg_bold[cyan]%}%~%{$reset_color%} $(git_prompt_info) %{$fg[cyan]%}%D{}\
%{$fg[yellow]%}$(vi_mode_prompt_info)%{$reset_color%} %{$fg_bold[green]%}➜ %{$reset_color%}'

