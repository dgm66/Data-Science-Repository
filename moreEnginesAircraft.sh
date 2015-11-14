#!/bin/sh

# Author: dgm

# The aircraft having more engines
csvsort -d'^' -c nb_engines $1 | csvcut -c manufacturer,model | tail -1


