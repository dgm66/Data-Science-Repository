#!/bin/sh

# Author: dgm

# Arguments:
#       - file_name: the file with aircrafts' data
#       - n_engines: number of engines

# Result: List the aircrafts with the given number of engines

csvgrep -d'^' -c nb_engines -m $2 $1 | csvcut -c manufacturer,model | tail -n +2 | sort