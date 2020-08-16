#!/bin/fish

source /home/kyle/.cache/wal/colors-fish.sh


iwctl station wlan0 scan
set nets (iwctl station wlan0 get-networks)

echo $nets
