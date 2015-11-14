#!/bin/sh

# Author: dgm

# Arguments:
#       - file_name: the file with aircrafts' data
#       - n_engines: number of engines

# Result: List the aircrafts with the given number of engines

if [ -z $1 ] ; then
    echo "usage: planesWithEngines [file_name] [n_engines] "
else
    if [ -a $1 ] ; then
        csvsort -d'^' -c manufacturer,model $1 | awk -F, '$7=="'$2'" || $7=="nb_engines"' | csvcut -c manufacturer,model | tail -n +2
    else
        echo "file not found"
    fi
fi