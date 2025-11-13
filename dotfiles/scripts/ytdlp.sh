URL="$1"
[ -z "$URL" ] && { echo "Usage: ytdlp.sh <playlist-url>"; exit 1; }

yt-dlp \
  -x \
  --progress \
  --embed-thumbnail \
  --audio-format mp3 \
  --audio-quality 2 \
  --parse-metadata "playlist_index:%(track_number)s" \
  --parse-metadata "title:%(track)s" \
  --parse-metadata "artist:%(uploader)s" \
  --parse-metadata "playlist_title:%(album)s" \
  --add-metadata \
  --output "~/music/%(album)s/%(playlist_index|)02d - %(title)s.%(ext)s" \
  --ignore-errors \
  "$URL"
