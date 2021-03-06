## Environment variable configuration
#
# LANG
#
export LANG=en_US.UTF-8

## Default shell configuration
#
# set prompt
#
autoload colors
colors
case ${UID} in
# root
0)
  PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
# for comment out
1)
  PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
  PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
# default
*)
  setopt prompt_subst
  # change PROMPT by machines
  case `hostname` in
    yoganidra.bdc.net)
      PROMPT='%{${fg[yellow]}%}${HOST%%.*}%{$reset_color%}${WINDOW:+"[$WINDOW]"}%{$fg[cyan]%}%#%?%{$reset_color%} '
      RPROMPT='%{${fg[green]}%}[%~]%{$reset_color%}'
      ;;
    takafumi-bdc1)
      PROMPT='%{${fg[red]}%}${HOST%%.*}%{$reset_color%}${WINDOW:+"[$WINDOW]"}%{$fg[cyan]%}%#%?%{$reset_color%} '
      RPROMPT='%{[33m%}[%~]%{[m%}'
      ;;
    takafumi-bdc2)
      PROMPT='%{${fg[cyan]}%}${HOST%%.*}%{$reset_color%}${WINDOW:+"[$WINDOW]"}%{$fg[red]%}%#%?%{$reset_color%} '
      RPROMPT='%{[33m%}[%~]%{[m%}'
      ;;
    takafumi-c00)
      PROMPT='%U%{${fg[red]}%}${HOST%%.*}%{$reset_color%}%u(j=%j|?=%?${WINDOW:+"|w=$WINDOW"}) %~
%# '
      # VCS in RPROMPT
      autoload -Uz vcs_info
      zstyle ':vcs_info:*' formats '(%s)-[%b]'
      zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
      precmd () {
	  psvar=()
	  LANG=en_US.UTF-8 vcs_info
	  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
      }
      RPROMPT="%1(v|%F{green}%1v%f|)"
      ;;
    takafumi-*)
      PROMPT='%{${fg[green]}%}${HOST%%.*}%{$reset_color%}${WINDOW:+"[$WINDOW]"}%{${bg[cyan]}%}%{$fg[black]%}%#%?%{$reset_color%} '
      RPROMPT='%{[33m%}[%~]%{[m%}'
      ;;
    c*.bdc.net)
      PROMPT='%{${bg[cyan]}%}%{${fg[black]}%}${HOST%%.*}-${PBS_JOBID%%.*}%{$reset_color%}${WINDOW:+"[$WINDOW]"}%{$fg[cyan]%}%#%?%{$reset_color%} '
      RPROMPT='%{${fg[green]}%}[%~]%{$reset_color%}'
      ;;
    pcneurophys*)
      PROMPT='%U%{${fg[cyan]}%}${HOST%%.*}%{$reset_color%}%u[j=%{${fg[yellow]}%}%j%{$reset_color%}|?=%{${fg[yellow]}%}%?%{$reset_color%}${WINDOW:+"|w=%{${fg[yellow]}%}$WINDOW%{$reset_color%}"}] %~
%# '
      ;;
    *)
      PROMPT='%{${fg[white]}%}${HOST%%.*}%{$reset_color%}${WINDOW:+"[$WINDOW]"}%{$fg[cyan]%}%#%?%{$reset_color%} '
      RPROMPT='%{[33m%}[%~]%{[m%}'
      ;;
  esac
  #PROMPT2='%{${fg[red]}%}${HOST%%.*}%{$reset_color%}${WINDOW:+"[$WINDOW]"}%{$fg[cyan]%}_%{$reset_color%} '
  #RPROMPT='%{$fg[white]%}%~%{$fg[cyan]%}:%{$fg[white]%}%!%{$reset_color%}'
  ;;
esac

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep

## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes
# to end of it)
#
bindkey -e

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

## Completion configuration
#
autoload -U compinit
compinit

# ignore case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

autoload zed

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"

## terminal configuration
#
unset LSCOLORS
case "${TERM}" in
xterm)
  export TERM=xterm-color
  ;;
kterm)
  export TERM=kterm-color
  # set BackSpace control character
  stty erase
  ;;
cons25)
  unset LANG
  export LSCOLORS=ExFxCxdxBxegedabagacad
  export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm*)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  export LSCOLORS=exfxcxdxbxegedabagacad
  export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
esac

## load user .zshrc configuration file
#
#[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

case `hostname` in
    "takafumi-bdc")
	HISTFILE=~/.zsh_history
	;;
    "yoganidra.bdc.net")
	HISTFILE=~/.zsh_history
	;;
    "ecovm")
	HISTFILE=~/.zsh_history
	;;
    *)
	HISTFILE=~/.zsh_history_others
	;;
esac

alias ln-s='ln -s'
alias emacs-nw='emacs -nw'
alias head-n1='head -n1'
alias tail-n1='tail -n1'
alias cut-f1-10='cut -f1-10 -d" "'
alias quota-s='quota -s'
alias less-R='less -R'

log-do(){
    "$@"
    echo "do: " "$@"
    echo "$@" >>CMD
}

log2CMD(){
    echo "$@"
    echo "$@" >>CMD
}

log2howm () {
    ext=`basename $1 | grep -o '\.[^\.]*$' | sed -e 's/\.//g'` 
    if [ -z "$ext" ]
    then
        ext='log' 
    fi
    log=$HOME/howm/`date +%Y/%m/%F-%H%M%S`.${ext} 
    cp -iv $1 $log
}

[ -f ~/.priv_config/rc-path.sh ] && source ~/.priv_config/rc-path.sh
[ -f ~/dotfiles/myfuncs.sh ] && source ~/dotfiles/myfuncs.sh

export EDITOR=emacsclient
