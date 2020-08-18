#!/bin/fish
[ (du ~/.windowlist | awk '{print $1;}') = 0 ] && exit 0
set WINDOWNAME (cat ~/.windowlist | dmenu -l 10 || exit 0) 
grep -v "$WINDOWNAME" < ~/.windowlist > ~/.windowlisttmp; mv ~/.windowlisttmp ~/.windowlist
xdotool windowmap (echo $WINDOWNAME | awk 'NF{print $NF}')
