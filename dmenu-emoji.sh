#!/bin/sh

# The famous "get a menu of emojis to copy" script.

# Get user selection via dmenu from emoji file.
chosen=$(cut -d ';' -f1 ~/.config/dmenu-emojis/list | dmenu -l 30 | sed "s/ .*//")

# Exit if none chosen.
[ -z "$chosen" ] && exit

# If you run this command with an argument, it will automatically insert the
# character. Otherwise, show a message that the emoji has been copied.
if [ -n "$1" ]; then
	primary=$(xclip -o -selection primary)
	clipboard=$(xclip -o -selection clipboard)
	echo -n $chosen | xclip -i -selection primary
	echo -n $chosen | xclip -i -selection clipboard
	xdotool key --clearmodifiers Shift+Insert sleep 0.05
	echo -n $primary | xclip -i -selection primary
	echo -n $clipboard | xclip -i -selection clipboard
else
	echo "$chosen" | tr -d '\n' | xclip -selection clipboard
	notify-send "'$chosen' copied to clipboard." &
fi
