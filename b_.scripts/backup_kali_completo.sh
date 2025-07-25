#!/bin/bash

# Script: backup_kali_completo.sh
# Backup completo de Kali Linux con seguimiento de errores
# Autor: Tú
# Fecha: $(date)

FECHA=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="/media/havel/kalibackup/backup_1"
ROOT_BACKUP="$BACKUP_DIR/rootfs"
LOG_FILE="$BACKUP_DIR/backup_log_$FECHA.txt"
ERROR_LOG="$BACKUP_DIR/error_log_$FECHA.txt"

echo "=== Backup completo de Kali Linux - $FECHA ==="
echo "Destino: $ROOT_BACKUP"
echo "Log: $LOG_FILE"
echo "Errores: $ERROR_LOG"
echo "=============================================="

# Verificar que el punto de montaje exista y esté montado
if ! mount | grep -q "/media/havel/kalibackup"; then
    echo "❌ ERROR: El punto de montaje /media/havel/kalibackup no está montado"
    echo "Por favor, monta la partición primero con 'mont'"
    exit 1
fi

# Crear directorios necesarios
echo "Creando directorios..."
sudo mkdir -p "$ROOT_BACKUP"

# Crear información del backup
echo "Generando información del backup..."
cat >"$BACKUP_DIR/backup_info.txt" <<EOF
Backup completo de Kali Linux
============================
Fecha de inicio: $(date)
Kernel: $(uname -r)
Distribución: $(lsb_release -d | cut -f2)
Arquitectura: $(uname -m)
Usuario: $(whoami)
Hostname: $(hostname)
Partición destino: $(df -h /media/havel/kalibackup | tail -1)
Espacio disponible: $(df -h /media/havel/kalibackup | tail -1 | awk '{print $4}')
EOF

echo "Iniciando backup del sistema..." | tee -a "$LOG_FILE"
echo "Excluyendo: /dev, /proc, /sys, /tmp, /run, /mnt, /media, /lost+found" | tee -a "$LOG_FILE"

# Comando rsync con seguimiento detallado de errores
echo "🔄 Copiando archivos del sistema (esto puede tardar varios minutos)..." | tee -a "$LOG_FILE"

sudo rsync -aAXvH --progress \
    --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/*/.cache/*"} \
    / "$ROOT_BACKUP/" \
    2>"$ERROR_LOG" |
    tee -a "$LOG_FILE"

# Verificar si hubo errores
if [ -s "$ERROR_LOG" ]; then
    echo "⚠️  Se encontraron errores durante el backup:"
    echo "Errores guardados en: $ERROR_LOG"
    echo "=== Archivos con problemas ==="
    cat "$ERROR_LOG"
    echo "=============================="

    # Contar errores
    ERROR_COUNT=$(wc -l <"$ERROR_LOG")
    echo "Total de errores encontrados: $ERROR_COUNT"

    # Mostrar los archivos que tuvieron problemas (últimas líneas del log de errores)
    echo "Archivos que no se transfirieron correctamente:"
    tail -20 "$ERROR_LOG"
else
    echo "✅ Backup completado sin errores"
    # Crear archivo indicando éxito
    echo "Backup completado exitosamente el $(date)" >"$BACKUP_DIR/BACKUP_EXITOSO"
fi

# Mostrar estadísticas finales
echo "==============================================" | tee -a "$LOG_FILE"
echo "Resumen del backup:" | tee -a "$LOG_FILE"
echo "  - Fecha de finalización: $(date)" | tee -a "$LOG_FILE"
echo "  - Tamaño del backup: $(du -sh "$ROOT_BACKUP" 2>/dev/null | cut -f1)" | tee -a "$LOG_FILE"
echo "  - Espacio disponible: $(df -h /media/havel/kalibackup | tail -1 | awk '{print $4}')" | tee -a "$LOG_FILE"

echo "✅ Proceso de backup finalizado"
echo "📁 Backup guardado en: $ROOT_BACKUP"
echo "📝 Log detallado: $LOG_FILE"

if [ -s "$ERROR_LOG" ]; then
    echo "⚠️  Revisa los errores en: $ERROR_LOG"
else
    echo "🎉 ¡Backup completado exitosamente!"
fi
