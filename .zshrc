zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

bindkey -e
bindkey '[C' forward-word
bindkey '[D' backward-word

source /usr/local/etc/bash_completion.d/git-prompt.sh
precmd () { __git_ps1 "%{$fg_bold[cyan]%}%~%{$reset_color%} " "%# " "(%s) " }
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1

# Use vim as the editor
export EDITOR=vi

# history
export HISTFILE=~/.histfile
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export TERM=screen-256color # for vim colors to work properly in tmux

PATH=$PATH:~/bin:/usr/local/sbin

# By default, ^S freezes terminal output and ^Q resumes it. Disable that so
# that those keys can be used for other things.
unsetopt flowcontrol

alias ez="vim ~/.zshrc"
alias sz="source ~/.zshrc"

alias ll="ls -alG"
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
alias g="git"
alias gb="git branch"
alias gs="git status -s"
alias gl="git log --oneline --graph --decorate --date=relative"
alias b="bundle exec"

function dc { dc-anywhere.sh $@ }

function mcd() { mkdir -p $1 && cd $1 } # from garybernhardt/dotfiles
function p() { cd $(find ~/projects -maxdepth 3 -type d | selecta) }

# eval "$(rbenv init -)"
source ~/.rvm/scripts/rvm
# source ~/.rvm/contrib/ps1_functions
# ps1_set
# PS1="\$(~/.rvm/bin/rvm-prompt) $PS1"
eval "$(direnv hook zsh)"
eval "$(docker-machine env default)"

export GOPATH=$HOME/golang
export PATH=$PATH:$GOPATH/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home
