#!/bin/bash

# Activar depuración
# set -x

# Lista de nombres de clase de navegadores (ajusta según WM_CLASS real)
browsers=("Google-chrome" "firefox-esr")

for browser in "${browsers[@]}"; do
    # Buscar todas las ventanas del navegador
    window_ids=$(xdotool search --class "$browser")

    if [ -z "$window_ids" ]; then
        echo "No se encontraron ventanas para $browser"
        continue
    fi

    for wid in $window_ids; do
        echo "Procesando ventana $wid de $browser"
        xdotool getwindowname "$wid" # Muestra el título para depuración
        # Enviar la tecla Ctrl+space (o prueba space/k)
        xdotool key --window "$wid" Ctrl+space
        sleep 0.1 # Pequeño retraso para evitar conflictos
    done
done
