#!/bin/bash

# Guarda el ID de la ventana actualmente enfocada
focused=$(xdotool getwindowfocus)

# Ejecuta Warp
nohup warp-terminal >/dev/null 2>&1 &

# Espera a que Warp aparezca
sleep 1.5

# Enfoca la nueva Warp (la más reciente)
xdotool search --class "WarpTerminal" | tail -1 | xargs xdotool windowfocus
