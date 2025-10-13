autoload -Uz compinit; compinit                           # Autocompletion!
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case-insensitive completion

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS     # Ignore duplicate commands in history
setopt HIST_IGNORE_SPACE    # Ignore commands starting with a space
setopt SHARE_HISTORY        # Share history across sessions
setopt CORRECT              # Correct syntax errors with commands

setopt PROMPT_SUBST         # Prompt expansion
PROMPT='❯ '
RPROMPT='%F{green}%B%~%b%f'

# Initialize zoxide so it functions lul
eval "$(zoxide init zsh)"

# Fzf bindings for zsh
source <(fzf --zsh)

# Autosuggestions and syntax highlighting!
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Allow nvim to be ran as sudo without breaking stuff + bat to get syntax highlighting on manpages
export EDITOR='nvim'
export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman --theme=ansi'"

alias ls='ls --color=auto'
alias cd='z'
alias grep='grep --color=auto'
alias {vim,vi,v}='nvim'
alias {bat,cat}='bat --theme=ansi --style=numbers,changes'
alias pac='pacman -Slq | fzf --multi --preview "pacman -Si {1}" | xargs -ro sudo pacman -S'
alias pacup='sudo pacman -Syu'
alias pacrm='pacman -Qq | fzf --multi --preview "pacman -Qi {1}" | xargs -ro sudo pacman -Rns'
alias pacrns='sudo pacman -Rns $(pacman -Qdtq)'
alias pacgrep='pacman -Qq | fzf --preview "pacman -Qi {1}"'
alias aur='paru -Slq | fzf --multi --preview "paru -Si {1}" | xargs -ro paru -S'
alias aurm='paru -Qq | fzf --multi --preview "paru -Qi {1}" | xargs -ro paru -Rns'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push origin main'
alias rcsync='rclone sync -P'
alias src='source ~/.zshrc'
alias zshrc='v ~/.zshrc'
alias manf='man -k . | sort | fzf | awk "{print \$1}" | xargs man'
alias hyprpicker='hyprpicker -a'

# gcb = gcc build ig lol
gcb() {
    local filename="${1%.*}"
    gcc -Wextra -Wall -Werror "$1" -o "$filename" && "./$filename"
}

# cuz uptime and sleep is important ye
if [[ "$(date +%H)" > 22 ]]; then
    echo " $(uptime -p) - Go to sleep soon!"
else
    echo " $(uptime -p)"
fi
echo "󰣇 $(uname -r)"

# Show last day pacman -Syu ran; update every 2 days
date_last_up=$(tac /var/log/pacman.log | grep -m 1 'full system upgrade' | cut -d ' ' -f 1 | tr -d '[]' | cut -d 'T' -f 1)
day=$(date -d $date_last_up +"%A, %B %d")
if [ -n "$date_last_up" ]; then
    echo ""
    echo "Last upgrade was on $(date -d $date_last_up +'%A, %B %d')!"
else
    echo "No full system update found in pacman transaction logs!!!!!"
fi   

echo "You have $(pacman -Qdtq | wc -l) unneeded packages.\n"

# For git configuration for secrets, do the following
# git-credential-manager configure
# git config --global credential.credentialStore cache
