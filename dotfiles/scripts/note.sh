#!/bin/sh

# Prompt for the base directory relative to $HOME for searching notes
base_dir=$(echo "$(ls $HOME)" | fuzzel --dmenu -p "Directory: ") || exit 0
full_dir="$HOME/$base_dir"

# Ensure the directory exists
mkdir -p "$full_dir"

# List markdown files in the directory (non-recursive)
notes=$(ls "$full_dir"/*.md 2>/dev/null | xargs -n1 basename | sort)

# Add create option
options="New note
$notes"

# Select note or create
selected=$(echo "$options" | fuzzel --dmenu -p "Select note [New note]: ") || exit 0

if [[ "$selected" == "New note" ]]; then
    mkdir ~/Notes # if not already made
    full_new_dir="$HOME/Notes"

    note_name="$(date +'%Y-%m-%d')_note.md"
    full_path="$full_new_dir/$note_name"

    notify-send "New note created!"
    foot -e nvim "$full_path"
else
    notify-send "Editing note $selected!"
    foot -e nvim "$full_dir/$selected"
fi
