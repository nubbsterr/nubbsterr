# display kernel, last day since syu, and unneeded pkgs
date_last_up=$(tac /var/log/pacman.log | grep -m 1 'full system upgrade' | cut -d ' ' -f 1 | tr -d '[]' | cut -d 'T' -f 1)
notify-send "System Info" " $(uname -r)\nLast upgrade was on $(date -d $date_last_up +'%A, %B %d')!\nYou have $(pacman -Qdtq | wc -l) unneeded packages; $(pacman -Qdtq)"
