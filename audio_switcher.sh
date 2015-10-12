#!/bin/bash

headPhones="alsa_output.usb-Turtle_Beach_Turtle_Beach_PX3__PC_-00-PX3PC.analog-stereo"
speakers="alsa_output.pci-0000_00_14.2.analog-stereo"

current=$(pactl list short sinks | grep "RUNNING" | cut -f2)

if [ $current = $headPhones ]; then
  target=$speakers
else 
  target=$headPhones
fi

# set default output device
pactl set-default-sink $target

# move all output streams to new device
pactl list short sink-inputs | while read stream; do
  id=$(echo $stream | cut '-d ' -f1)
  pactl move-sink-input "$id" "$target"
done

exit 0
