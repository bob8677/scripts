#!/bin/bash

picom & 
wal -R -n &
$HOME/.fehbg
/home/kyle/packages/dwmblocks/dwmblocks &
xset r rate 300 50 &
/home/kyle/scripts/startdunst &
xss-lock -- multilockscreen -l blur & disown
