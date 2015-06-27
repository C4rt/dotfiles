# .zshrc
# Maintainer: C4rt
# version 0.4

# Path to oh-my-zsh
export ZSH=/home/C4rt/.oh-my-zsh
export LC_ALL="fr_FR.utf8"

export TERM="xterm-256color"
ZSH_THEME="amuse"
DISABLE_AUTO_UPDATE="true"

plugins=(git autojump command-not-found compleat dirhistory screen web-search zsh-syntax-highlighting)

# Configuration

export PATH=":/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:/bin:/usr/bin/X11:/usr/X11R6/bin:/home/C4rt/bin:/home/C4rt/.rvm/bin:/usr/lib/oracle/12.1/client64/"

export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
export SQLPATH=/usr/lib/oracle/12.1/client64/lib/
export TNS_ADMIN=/usr/lib/oracle/12.1/client64/
export ORACLE_HOME=/usr/lib/oracle/12.1/client64/
export rvmsudo_secure_path=1
source $ZSH/oh-my-zsh.sh

export LANG=fr_fr.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR 

bindkey -v
# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-backwardrch-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward  
else
export EDITOR='mvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Use Ctrl-Z to switch back to Vim
# to pause Vim by pressing Ctrl-z, type command and press Ctr-z again to switch back to Vim.
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
     BUFFER="fg"
     zle accept-line
  else
     zle push-input
     zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source /etc/bash_completion.d/arping
source /etc/bash_completion.d/arpspoof
source /etc/bash_completion.d/curl
source /etc/bash_completion.d/dd
source /etc/bash_completion.d/hping2
source /etc/bash_completion.d/ipsec
source /etc/bash_completion.d/iptables
source /etc/bash_completion.d/iwconfig
source /etc/bash_completion.d/iwlist
source /etc/bash_completion.d/iwpriv
source /etc/bash_completion.d/minicom
source /etc/bash_completion.d/ncat
source /etc/bash_completion.d/ndiff
source /etc/bash_completion.d/ngrep
source /etc/bash_completion.d/nmap
source /etc/bash_completion.d/nping
source /etc/bash_completion.d/nslookup
source /etc/bash_completion.d/ntpdate
source /etc/bash_completion.d/openssl
source /etc/bash_completion.d/ping

# aliases for Tmux
alias tmux='tmux -2'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'
function ssh_tmux() { ssh -t "$1" tmux a || ssh -t "$1" tmux; }

# sudo completion solution
zstyle ':completion:*:sudo::' environ PATH="/sbin:/usr/sbin:$PATH" HOME="/root"
