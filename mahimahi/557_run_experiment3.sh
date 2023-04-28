#!/bin/bash

# This script simple runs an experiment to analyze
# performance BBR vs CUBIC under an emulated Verizon cell link.

set -x # Enable logging of executed commands.
set -e # Stop if any error occurs.
mkdir -p data

#LOSS_RATES="0.001 0.01 0.1 1 2 5 10 15 20 25 30 40 50"
LOSS_RATES="0.1"
#BW_MBPS="12"
#CONGESTION_CONTROL="cubic bbr"
CONGESTION_CONTROL="cubic bbr557 bbr"
#CONGESTION_CONTROL="gargbage"
LOG_FILE=data/experiment3.csv

# Clear any existing data.
rm -f $LOG_FILE

# Run experiment.
echo "Running Experiment 3: Step Down."
for cc in $CONGESTION_CONTROL; do
  for loss_rate in $LOSS_RATES; do
    echo "Executing trial with cc=$cc Loss rate: $loss_rate ..."
    ./bbr_experiment.py --cc=$cc --loss=$loss_rate --traceup traces/down_step.up --tracedown traces/down_step.down --output_file=$LOG_FILE $@ --experiment experiment3
  done
done
