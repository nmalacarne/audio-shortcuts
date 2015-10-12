#!/bin/bash

current=$(pactl list short sinks | grep "RUNNING" | cut -f2)

pactl set-sink-volume "$current" -10%

exit 0
