#!/bin/bash

picom & 
wal -R -n &
$HOME/.fehbg
xset r rate 300 50 &
/home/kyle/scripts/startdunst &
xss-lock -- lock.sh & disown
/home/kyle/packages/dwmblocks/dwmblocks &
