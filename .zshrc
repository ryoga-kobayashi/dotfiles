# language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


# history
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000
export SACEHIST=100000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# alias
alias brew="env PATH=${PATH/\/Users\/${USER}\/\.pyenv\/shims:?/} brew"
alias ls='ls -G'
alias la='ls -Gla'
alias r='R'
alias ipython='ipython --pylab'

# promt
function toon {
  echo -n ""
}

get_git_dirty() {
  git diff --quiet || echo '*'
}

autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}*'   # display this when there are unstaged changes
zstyle ':vcs_info:*' stagedstr '%F{yellow}+'  # display this when there are staged changes
zstyle ':vcs_info:*' actionformats \
    '%F{5}%F{5}[%F{2}%b%F{3}|%F{1}%a%c%u%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}%F{5}[%F{2}%b%c%u%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git cvs svn

theme_precmd () {
    vcs_info
}

autoload -Uz colors
colors

setopt prompt_subst
PROMPT='%{$fg[red]%}$(toon)%{$reset_color%} %~/ %{$reset_color%}${vcs_info_msg_0_}%{$reset_color%}'

autoload -U add-zsh-hook
add-zsh-hook precmd theme_precmd
