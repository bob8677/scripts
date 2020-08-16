#!/bin/fish

bluetoothctl power on
set devices (bluetoothctl paired-devices)
set choice (echo "$devices" | sed 's/ Device /\n/g; s/Device //; s/:[A-Z0-9][A-Z0-9]/:/g; s/[A-Z0-9][A-Z0-9]::::: //g' | awk '{print NR, $0}' | dmenu | awk '{print $1}')

test "$choice" = "" && exit 0

bluetoothctl connect (echo "$devices" | sed 's/ Device /\n/; s/Device //g' | awk "FNR == $choice"' {print $1}') && echo -n '' | dmenu -p 'connected ' || echo -n '' | dmenu -p 'connection failed '
