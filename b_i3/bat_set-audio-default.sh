#!/bin/bash

# Esperar a que el auricular esté disponible
while ! pactl list short sinks | grep -q "bluez_output.41_42_FF_59_69_C6.1"; do
    sleep 1
done

# Establecer volumen
pactl set-sink-volume bluez_output.41_42_FF_59_69_C6.1 16%
