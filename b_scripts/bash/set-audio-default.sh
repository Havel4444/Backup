#!/bin/bash

LOG_FILE="/tmp/audio-default.log"
DEVICE_BT="41:42:FF:59:69:C6"
SINK_BT="bluez_output.41_42_FF_59_69_C6.1"
SINK_HDMI="alsa_output.pci-0000_0b_00.1.hdmi-stereo"

echo "Iniciando gestión de audio predeterminado - $(date)" >"$LOG_FILE"

# Función para establecer el sumidero predeterminado
set_default_sink() {
    local sink=$1
    echo "Intentando establecer $sink como sumidero predeterminado..." >>"$LOG_FILE"
    if pactl list sinks | grep -q "$sink"; then
        pactl set-default-sink "$sink" 2>>"$LOG_FILE"
        if [ $? -eq 0 ]; then
            echo "Sumidero $sink establecido como predeterminado." >>"$LOG_FILE"
        else
            echo "Error al establecer $sink como predeterminado." >>"$LOG_FILE"
        fi
    else
        echo "Error: Sumidero $sink no encontrado." >>"$LOG_FILE"
    fi
}

# Verificar y gestionar la salida de audio
if [ "$1" == "bluetooth" ]; then
    echo "Estableciendo auriculares Bluetooth como predeterminados..." >>"$LOG_FILE"
    # Verificar si los auriculares están conectados
    if bluetoothctl info "$DEVICE_BT" | grep -q "Connected: yes"; then
        if pactl list sinks | grep -q "$SINK_BT"; then
            pactl set-card-profile "$SINK_BT" a2dp-sink-sbc_xq >>"$LOG_FILE" 2>&1
            if [ $? -eq 0 ]; then
                echo "Perfil A2DP (SBC-XQ) configurado." >>"$LOG_FILE"
            else
                echo "Error: Usando perfil A2DP estándar." >>"$LOG_FILE"
                pactl set-card-profile "$SINK_BT" a2dp-sink >>"$LOG_FILE" 2>&1
            fi
            set_default_sink "$SINK_BT"
        else
            echo "Error: Sumidero Bluetooth no encontrado. Asegúrate de que estén conectados." >>"$LOG_FILE"
        fi
    else
        echo "Error: Auriculares Bluetooth no están conectados." >>"$LOG_FILE"
    fi

elif [ "$1" == "hdmi" ]; then
    echo "Estableciendo salida HDMI (auriculares alámbricos) como predeterminada..." >>"$LOG_FILE"
    if pactl list sinks | grep -q "$SINK_HDMI"; then
        pactl set-card-profile "alsa_card.pci-0000_0b_00.1" output:hdmi-stereo >>"$LOG_FILE" 2>&1
        set_default_sink "$SINK_HDMI"
    else
        echo "Error: Sumidero HDMI no encontrado. Intentando activar..." >>"$LOG_FILE"
        pactl load-module module-alsa-sink device=hw:1,0 # Ajusta device si es necesario
        set_default_sink "$SINK_HDMI"
    fi

else
    echo "Uso: $0 {bluetooth|hdmi}" >>"$LOG_FILE"
    echo "Uso: $0 {bluetooth|hdmi}" >&2
    exit 1
fi

echo "Gestión de audio finalizada - $(date)" >>"$LOG_FILE"
