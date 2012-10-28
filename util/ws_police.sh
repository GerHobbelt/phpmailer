#! /bin/bash
#
# whitespace police: expand all tabs and strip trailing WS
# in all scripts, HTML, CSS, JS, PHP, C and C++ sources.
#

wsclean -e -x -U -v $( find ./ -type f -iname '*.txt' -o -iname '*.htm*' -o -iname '*.[ch]' -o -iname '*.[ch]pp' -o -iname '*.sh' -o -iname '*.php' -o -iname '*.js' -o -iname '*.css' )

