#!/bin/fish

#colors

set col1 '\e[46m'
set fgcol1 '\e[36m'
set col2 '\e[43m'
set fgcol2 '\e[33m'
set text '\e[39m'

echo -ne $col1(date +%I:%M) $fgcol1$col2 $text$USER $col1$fgcol2$text $hostname'  '


