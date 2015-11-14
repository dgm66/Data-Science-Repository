#!/bin/sh

# Author: dgm

# Avión con más motores
csvsort -d'^' -c nb_engines $1 | csvcut -c manufacturer,model | tail -1


