#!/bin/bash

# --- CONFIGURACIÓN ---
DEVICE_MAC="41:42:FF:59:69:C6"
DEVICE_NAME="ERAZER XT60PRO"
LOG_DIR="/home/havel/logs" # Cambia tu_usuario
INITIAL_WAIT_SECONDS=70    # ESPERA INICIAL (más de 1 minuto)
# --- FIN CONFIGURACIÓN ---

mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/bluetooth-connect-xfce-$(date +%F-%H%M%S).log"

exec >"$LOG_FILE" 2>&1

echo "-----------------------------------------------------"
echo "Iniciando script de conexión Bluetooth para $DEVICE_NAME ($DEVICE_MAC) vía XFCE Autostart"
echo "Fecha y Hora: $(date)"
echo "-----------------------------------------------------"

echo "[INFO] Espera inicial de $INITIAL_WAIT_SECONDS segundos para que el sistema se estabilice..."
sleep "$INITIAL_WAIT_SECONDS"
echo "[INFO] Espera inicial completada."

# 0. Desbloquear Bluetooth (si es necesario)
echo "[INFO] Desbloqueando Bluetooth con rfkill..."
rfkill unblock bluetooth
sleep 1

# 1. Recargar módulo btusb (basado en tus pasos manuales)
echo "[INFO] Recargando módulo btusb..."
# Necesitas configurar sudo para no pedir contraseña para modprobe si lo mantienes
if sudo modprobe -r btusb && sudo modprobe btusb; then
    echo "[SUCCESS] Módulo btusb recargado."
    sleep 5
else
    echo "[ERROR] Falló la recarga del módulo btusb. Esto podría causar problemas."
    # Considera si este paso es realmente necesario. Si el Bluetooth funciona sin él
    # después de un reinicio normal, podrías comentarlo o eliminarlo.
fi

# 2. Asegurar que el controlador Bluetooth esté encendido
MAX_POWER_ON_ATTEMPTS=3
POWER_ON_SUCCESS=false
echo "[INFO] Asegurando que el controlador Bluetooth (hci0) esté encendido..."
for ((attempt = 1; attempt <= MAX_POWER_ON_ATTEMPTS; attempt++)); do
    echo "[INFO] Intento de encendido del controlador: $attempt/$MAX_POWER_ON_ATTEMPTS"
    if bluetoothctl power on; then
        echo "[SUCCESS] Controlador Bluetooth encendido."
        POWER_ON_SUCCESS=true
        break
    else
        echo "[WARNING] Fallo al encender el controlador Bluetooth en el intento $attempt. Esperando 2 segundos..."
        sleep 2
    fi
done

if [ "$POWER_ON_SUCCESS" = false ]; then
    echo "[ERROR] No se pudo encender el controlador Bluetooth después de $MAX_POWER_ON_ATTEMPTS intentos. Saliendo."
    # No tiene sentido continuar si el controlador no está encendido
    exit 1
fi

# 3. Verificar si el dispositivo ya está conectado
echo "[INFO] Verificando estado inicial de $DEVICE_NAME..."
if bluetoothctl info "$DEVICE_MAC" | grep -q "Connected: yes"; then
    echo "[SUCCESS] $DEVICE_NAME ya está conectado."
else
    echo "[INFO] $DEVICE_NAME no está conectado. Intentando conectar..."
    # Bucle de conexión más corto ahora, ya que hemos esperado inicialmente
    MAX_CONNECT_ATTEMPTS=12 # Intentar durante 2 minutos (12 intentos * 10s)
    CONNECTED=false
    for ((i = 1; i <= MAX_CONNECT_ATTEMPTS; i++)); do
        echo "[INFO] Intento de conexión $i/$MAX_CONNECT_ATTEMPTS a $DEVICE_NAME ($DEVICE_MAC)..."
        if bluetoothctl connect "$DEVICE_MAC"; then
            sleep 3
            if bluetoothctl info "$DEVICE_MAC" | grep -q "Connected: yes"; then
                echo "[SUCCESS] Conexión exitosa a $DEVICE_NAME ($DEVICE_MAC)."
                CONNECTED=true
                break
            else
                echo "[WARNING] 'bluetoothctl connect' pareció tener éxito, pero el dispositivo no muestra 'Connected: yes'."
                echo "[INFO] Intentando desconectar $DEVICE_MAC por si está en un estado inconsistente."
                bluetoothctl disconnect "$DEVICE_MAC"
                sleep 1
            fi
        else
            echo "[WARNING] Fallo al conectar en el intento $i (bluetoothctl connect falló)."
        fi

        if [ "$i" -lt "$MAX_CONNECT_ATTEMPTS" ]; then
            echo "[INFO] Esperando 10 segundos antes del siguiente intento de conexión..."
            sleep 10
        fi
    done

    if [ "$CONNECTED" = false ]; then
        echo "[ERROR] No se pudo conectar a $DEVICE_NAME ($DEVICE_MAC) después de $MAX_CONNECT_ATTEMPTS intentos."
    fi
fi

# 4. Configurar el perfil A2DP si está conectado
echo "[INFO] Verificando conexión para configurar perfil de audio..."
sleep 5
if bluetoothctl info "$DEVICE_MAC" | grep -q "Connected: yes"; then
    echo "[INFO] $DEVICE_NAME está conectado. Intentando configurar perfil A2DP (SBC-XQ)..."
    CARD_NAME_IN_PACTL="bluez_card.$(echo $DEVICE_MAC | tr ':' '_')"
    CARD_IDENTIFIER=$(pactl list cards short | grep "$CARD_NAME_IN_PACTL" | awk '{print $2}')

    if [ -n "$CARD_IDENTIFIER" ]; then
        echo "[INFO] Tarjeta de audio Bluetooth encontrada en pactl: $CARD_IDENTIFIER"
        PROFILE_SBC_XQ="a2dp-sink-sbc_xq"
        PROFILE_A2DP_SINK="a2dp-sink"

        echo "[INFO] Intentando configurar perfil: $PROFILE_SBC_XQ"
        if pactl set-card-profile "$CARD_IDENTIFIER" "$PROFILE_SBC_XQ"; then
            echo "[SUCCESS] Perfil $PROFILE_SBC_XQ configurado correctamente."
        else
            echo "[WARNING] Fallo al configurar perfil $PROFILE_SBC_XQ. Intentando perfil A2DP estándar ($PROFILE_A2DP_SINK)..."
            if pactl set-card-profile "$CARD_IDENTIFIER" "$PROFILE_A2DP_SINK"; then
                echo "[SUCCESS] Perfil $PROFILE_A2DP_SINK configurado."
            else
                echo "[ERROR] No se pudo configurar ningún perfil A2DP para $CARD_IDENTIFIER."
            fi
        fi
    else
        echo "[ERROR] No se encontró la tarjeta de audio $CARD_NAME_IN_PACTL en la salida de 'pactl list cards short'. No se puede configurar el perfil."
        echo "[DEBUG] Salida de 'pactl list cards short':"
        pactl list cards short
    fi
else
    echo "[INFO] $DEVICE_NAME no está conectado. Omitiendo configuración de perfil A2DP."
fi

echo "-----------------------------------------------------"
echo "Script de conexión Bluetooth (XFCE) finalizado."
echo "Fecha y Hora: $(date)"
echo "Revisar log completo en: $LOG_FILE"
echo "-----------------------------------------------------"

exit 0
