export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="awesomepanda"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 13

DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(git)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

export VISUAL=$EDITOR

alias vim="nvim"

unsetopt auto_menu

PID=$(pgrep ssh-agent)
if [ -z $PID ]; then
	ssh-agent | grep -vE ^echo > $HOME/.ssh/env
	. $HOME/.ssh/env
  echo "Running ssh-add"
	ssh-add
else
  if [ -f $HOME/.ssh/env ]; then
    . $HOME/.ssh/env
  fi
fi
