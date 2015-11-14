#!/bin/sh

# Author: dgm

# Avión con más motores
csvsort -d'^' -c nb_engines optd_aircraft.csv | csvcut -c manufacturer,model | tail -1


