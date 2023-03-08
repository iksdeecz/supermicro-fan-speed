#!/bin/bash

# Get the current hour in 24-hour format
current_hour=$(date +%H)

# Run the appropriate command based on the current time
if (( current_hour >= 18 || current_hour < 9 )); then
    ipmi-raw 00 30 70 66 01 00 20
    ipmi-raw 00 30 70 66 01 01 20
else
    ipmi-raw 00 30 70 66 01 00 47
    ipmi-raw 00 30 70 66 01 01 47
fi
