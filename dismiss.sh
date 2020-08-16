#!/bin/fish
set win (xdotool selectwindow) || exit 0
xdotool windowunmap $win
echo (xdotool getwindowname $win)' '$win >> ~/.windowlist
