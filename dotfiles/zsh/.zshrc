autoload -Uz compinit; compinit                           # Autocompletion!
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case-insensitive completion

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS     # Ignore duplicate commands in history
setopt HIST_IGNORE_SPACE    # Ignore commands starting with a space
setopt SHARE_HISTORY        # Share history across sessions

setopt PROMPT_SUBST         # Prompt expansion
PROMPT='[%n@%m %1~]$ '     # [user@host]$ 

# Autosuggestions and syntax highlighting!
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias {vim,vi,v}='nvim'
alias pac='sudo pacman -S'
alias pacup='sudo pacman -Syu'
alias pacrm='sudo pacman -Rns'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push origin main'

export EDITOR='nvim'

fastfetch

last_upgrade=$(tac /var/log/pacman.log | grep -m 1 "starting full system upgrade" | cut -d' ' -f1 | tr -d '[]')
if [ -n "$last_upgrade" ]; then
  t1=$(date +%s -d "$last_upgrade")
  t2=$(date +%s)
  days=$(( (t2 - t1) / 86400 ))
  echo "It's been $days days since last pacman -Syu!"
else
  echo "No full system upgrade found in logs"
fi   

# Git configuration for secrets
# git-credential-manager configure
# git config --global credential.credentialStore cache
