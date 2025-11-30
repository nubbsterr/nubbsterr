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

# old zsh prompt replaced w/ starship!
#NEWLINE=$'\n'
#PROMPT=' %F{blue}%B%~%b${NEWLINE} 󱞩%f '
#RPROMPT='%F{magenta}%T%f'

# Initialize zoxide so it functions lul
eval "$(zoxide init zsh)"

# starship prompt!
eval "$(starship init zsh)"

# Fzf bindings for zsh
source <(fzf --zsh)

# Autosuggestions and syntax highlighting!
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Allow helix to be ran as sudo (using sudoedit) without breaking stuff + bat to get syntax highlighting on manpages
export EDITOR='helix'
export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman --theme=ansi'"

alias ls='ls --color=auto'
alias cd='z'
alias grep='grep --color=auto'
alias h='helix'
alias q='exit'

alias ff='fastfetch'
alias {bat,cat}='bat --theme=ansi --style=numbers,changes'
alias wf='wf-recorder -f ~/videos/"$(date '+%Y-%m-%d %H:%M:%S').mp4" -r 60 -c h264_nvenc --audio'
alias pac='pacman -Slq | fzf --multi --preview "pacman -Si {1}" --preview-window down | xargs -ro sudo pacman -S'
alias pacup='sudo pacman -Syu'
alias pacrm='pacman -Qqe | fzf --multi --preview "pacman -Qi {1}" --preview-window down | xargs -ro sudo pacman -Rns'
alias pacrns='sudo pacman -Rns $(pacman -Qdtq)'
alias pacgrep='pacman -Qq | fzf --preview "pacman -Qi {1}" --preview-window down'
alias aur='paru -Slq | fzf --multi --preview "paru -Si {1}" | xargs -ro paru -S'
alias aurm='paru -Qq | fzf --multi --preview "paru -Qi {1}" | xargs -ro paru -Rns'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push origin main'
alias rcsync='rclone sync -P'
alias src='source ~/.zshrc'
alias zshrc='h ~/.zshrc'

# gcb = gcc build ig lol
gcb() {
    local filename="${1%.*}"
    gcc -Wextra -Wall "$1" -o "$filename" && "./$filename"
}

# change directory w/ yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# display jp quotes, very neat, src: https://github.com/hxpe-dev/kotofetch
kotofetch

date_last_up=$(tac /var/log/pacman.log | grep -m 1 'full system upgrade' | cut -d ' ' -f 1 | tr -d '[]' | cut -d 'T' -f 1)
echo "Last upgrade was on $(date -d $date_last_up +'%A, %B %d')!\n$(pacman -Qdtq | wc -l) unneeded packages; $(pacman -Qdtq)"

# For git configuration for secrets, do the following
# git-credential-manager configure
# git config --global credential.credentialStore cache
