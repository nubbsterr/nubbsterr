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
#PROMPT='%F{green}%B%~%b%f 󰘧 '

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

# solely because a current niri/steam issue prevents steam from launching cuz of my clipboard
# !! known issue w/ xwayland-satellite and has been fixed in release 0.8
alias wlc='wl-copy --clear'

alias ls='ls --color=auto'
alias cd='z'
alias newb='newsboat'
alias grep='grep --color=auto'
alias h='helix'
alias q='exit'
alias ff='fastfetch'
alias {bat,cat}='bat --theme=ansi --style=numbers,changes'
alias pacup='sudo pacman -Syu'
alias pacrns='sudo pacman -Rns $(pacman -Qdtq)'
alias pacgrep='pacman -Qq | fzf --preview "pacman -Qi {1}" --preview-window down'
alias aur='yay -Slq | fzf --multi --preview "yay -Si {1}" --preview-window down | xargs -ro yay -S'
alias aurm='yay -Qqe | fzf --multi --preview "yay -Qi {1}" --preview-window down | xargs -ro yay -Rns'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push origin main'
alias rcsync='rclone sync -P'
alias src='source ~/.zshrc'
alias zshrc='h ~/.zshrc'

# change directory w/ yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# put helix in the bg
function Resume {
  fg
  zle push-input
  BUFFER=""
  zle accept-line
}
zle -N Resume
bindkey "^Z" Resume

date_last_up=$(tac /var/log/pacman.log | grep -m 1 'full system upgrade' | cut -d ' ' -f 1 | tr -d '[]' | cut -d 'T' -f 1)
echo "Last upgrade was on $(date -d $date_last_up +'%A, %B %d')!\n$(pacman -Qdtq | wc -l) unneeded packages.\n"

# For git configuration for secrets, do the following
# git-credential-manager configure
# git config --global credential.credentialStore cache
