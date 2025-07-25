#!/bin/bash

# Script: restaurar_backup.sh
# Restaura un backup completo de Kali Linux
# DEBE EJECUTARSE DESDE UN LIVE USB O SISTEMA RESCATE

echo "=== Script de Restauración de Kali Linux ==="
echo "⚠️  ADVERTENCIA: Este proceso sobrescribirá tu sistema"
echo "=============================================="

# Verificar que estemos en un entorno de rescate
if [ "$(whoami)" != "root" ]; then
    echo "❌ Este script debe ejecutarse como root"
    echo "Usa: sudo $0"
    exit 1
fi

# Directorios importantes
BACKUP_SOURCE="/media/havel/kalibackup/backup_1/rootfs"
TARGET_ROOT="/mnt" # Asumimos que la partición raíz está montada aquí

echo "🔍 Verificando backup..."
if [ ! -d "$BACKUP_SOURCE" ]; then
    echo "❌ No se encuentra el backup en: $BACKUP_SOURCE"
    echo "Asegúrate de que el disco con el backup esté conectado y montado"
    exit 1
fi

echo "🔍 Verificando partición destino..."
if [ ! -d "$TARGET_ROOT" ] || [ -z "$(ls -A $TARGET_ROOT)" ]; then
    echo "⚠️  La partición destino no parece estar montada en $TARGET_ROOT"
    echo "Por favor monta tu partición raíz en /mnt antes de continuar"
    echo "Ejemplo: mount /dev/sdX1 /mnt"
    exit 1
fi

echo "📁 Backup encontrado en: $BACKUP_SOURCE"
echo "📁 Destino: $TARGET_ROOT"
echo ""
echo "Contenido del destino:"
ls -la "$TARGET_ROOT" | head -10
echo ""

echo "⚠️  ESTE PROCESO ES IRREVERSIBLE"
echo "Se restaurará TODO el sistema desde el backup"
echo ""
echo "¿Estás ABSOLUTAMENTE seguro de continuar? (ESCRIBE 'restaurar' para confirmar)"
read -r confirmacion

if [ "$confirmacion" != "restaurar" ]; then
    echo "❌ Restauración cancelada"
    exit 0
fi

echo "🔄 Iniciando restauración..."

# Crear directorios esenciales si no existen
mkdir -p "$TARGET_ROOT"/{dev,proc,sys,run,tmp}

# Restaurar el sistema (excluyendo directorios virtuales)
echo "Copiando archivos del sistema..."
rsync -aAXvH --progress \
    --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*"} \
    "$BACKUP_SOURCE"/ "$TARGET_ROOT"/

if [ $? -eq 0 ]; then
    echo "✅ Restauración completada exitosamente"
else
    echo "❌ Hubo errores durante la restauración"
    exit 1
fi

# Reconstruir initramfs (opcional pero recomendado)
echo "🔧 Actualizando initramfs..."
chroot "$TARGET_ROOT" update-initramfs -u

# Actualizar GRUB (opcional pero recomendado)
echo "🔧 Reinstalando GRUB..."
# NOTA: Reemplaza /dev/sdX con tu disco real
# chroot "$TARGET_ROOT" grub-install /dev/sdX
# chroot "$TARGET_ROOT" update-grub

echo "=============================================="
echo "✅ RESTAURACIÓN COMPLETADA"
echo ""
echo "Pasos finales recomendados:"
echo "1. Reinstalar GRUB si es necesario:"
echo "   mount --bind /dev $TARGET_ROOT/dev"
echo "   mount --bind /proc $TARGET_ROOT/proc"
echo "   mount --bind /sys $TARGET_ROOT/sys"
echo "   chroot $TARGET_ROOT"
echo "   grub-install /dev/sdX  # Reemplaza X con tu disco"
echo "   update-grub"
echo "   exit"
echo ""
echo "2. Reiniciar el sistema"
echo "=============================================="
