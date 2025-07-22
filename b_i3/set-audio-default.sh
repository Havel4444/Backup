#!/bin/bash

# Esperar a que el auricular esté disponible
while ! pactl list short sinks | grep -q "bluez_output.41_42_FF_59_69_C6.1"; do
    sleep 1
done

# Establecer perfil de audio a A2DP
pactl set-card-profile bluez_card.41_42_FF_59_69_C6 a2dp-sink

# Establecer volumen
pactl set-sink-volume bluez_output.41_42_FF_59_69_C6.1 16%
