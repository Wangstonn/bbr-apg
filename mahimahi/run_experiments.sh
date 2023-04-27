#!/bin/bash

set -x # Enable logging of executed commands.
set -e # Stop if any error occurs.

# This script simple runs a handful of experiments.
./initialize_congestion_control.sh

# Generate all the needed data.
##./run_figure8_experiment.sh $@
./557_run_experiment1.sh $@
./557_run_experiment2.sh $@
./557_run_experiment3.sh $@
#./run_experiment4.sh $@
./557_run_experiment5.sh $@
##./557_run_experiment6.sh $@
./557_run_experiment7.sh $@
## Plot the results.
##./bbr_plot.py
