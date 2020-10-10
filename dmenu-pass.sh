#!/bin/fish

set pass (dmenu -p "Enter Password" -P)

[ $pass = '' ] && exit 1 || echo $pass
