#!/bin/sh

bookmark_dir="$HOME/.config/bookmarks"

bookmark_files="$bookmark_dir/$(ls $bookmark_dir)"

choice=$(grep "$(cat $bookmark_files | sed 's/ [^[:space:]]*$//' | dmenu -i)" < $bookmark_files | sed 's/.* //')

xdg-open $choice & disown
