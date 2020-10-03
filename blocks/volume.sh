#!/bin/sh

volstat=$(pamixer --get-mute --get-volume)

if "${volstat% *}" ; then
    echo "婢 ${volstat#* }%"
else
    echo "墳 ${volstat#* }%"
fi
