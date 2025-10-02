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
PROMPT='[%n@%m %F{blue}%B%~%b%f] %F{green}❯%f '

# Autosuggestions and syntax highlighting!
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias {vim,vi,v}='nvim'
alias {bat,cat}='bat --theme=ansi --style=numbers,changes'
alias pac='sudo pacman -S'
alias pacup='sudo pacman -Syu'
alias pacrm='sudo pacman -Rns'
alias pacclean='sudo pacman -Rns $(pacman -Qdtq)'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push origin main'
alias reloadwal='wal -i'

# Allow nvim to be ran as sudo without breaking stuff + bat to get syntax highlighting on manpages
export EDITOR='nvim'
export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman --theme=ansi'"

fastfetch

time_since_up=$(tac /var/log/pacman.log | grep -m 1 'full system upgrade' | cut -d' ' -f 1 | tr -d '[]' | date +%s)
if [ -n "$time_since_up" ]; then
    current_time=$(date +%s)
    days=$(( (current_time - time_since_up) / 86400))
    echo "It's been $days days since last system update!\n"
else
    echo "No full system update found in pacman transaction logs!!!!!\n"
fi   

# Git configuration for secrets
# git-credential-manager configure
# git config --global credential.credentialStore cache
