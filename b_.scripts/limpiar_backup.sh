#!/bin/bash

# Script: limpiar_backup.sh
# Limpia de forma segura el backup anterior de Kali Linux

BACKUP_DIR="/media/havel/kalibackup/backup_1"

echo "=== Limpiando backup anterior de Kali Linux ==="
echo "Directorio: $BACKUP_DIR"
echo "=============================================="

# Verificar que el punto de montaje esté disponible
if ! mount | grep -q "/media/havel/kalibackup"; then
    echo "❌ ERROR: El punto de montaje /media/havel/kalibackup no está montado"
    echo "Por favor, monta la partición primero con 'mont'"
    exit 1
fi

# Verificar que el directorio de backup exista
if [ ! -d "$BACKUP_DIR" ]; then
    echo "ℹ️  El directorio de backup no existe, creándolo..."
    sudo mkdir -p "$BACKUP_DIR"
    sudo chmod 755 "$BACKUP_DIR"
    echo "✅ Directorio creado: $BACKUP_DIR"
    exit 0
fi

# Mostrar contenido actual
echo "🔍 Contenido actual del backup:"
ls -la "$BACKUP_DIR"
echo ""

# Confirmación de seguridad
echo "⚠️  Esta acción eliminará:"
echo "   - Directorio rootfs/"
echo "   - Archivos backup_*, error_*, info_*"
echo ""
echo "¿Estás seguro de continuar? (s/N)"
read -r respuesta

if [[ ! "$respuesta" =~ ^[Ss]$ ]]; then
    echo "❌ Operación cancelada"
    exit 0
fi

echo "🔄 Iniciando limpieza..."

# Eliminar de forma segura y específica (con sudo)
echo "Eliminando directorio rootfs..."
sudo rm -rf "$BACKUP_DIR/rootfs/" 2>/dev/null

echo "Eliminando logs y archivos de backup anteriores..."
sudo rm -f "$BACKUP_DIR/backup_"* 2>/dev/null
sudo rm -f "$BACKUP_DIR/error_"* 2>/dev/null
sudo rm -f "$BACKUP_DIR/info_"* 2>/dev/null
sudo rm -f "$BACKUP_DIR/BACKUP_EXITOSO" 2>/dev/null
sudo rm -f "$BACKUP_DIR/backup_info.txt" 2>/dev/null

echo "Creando estructura para nuevo backup..."
sudo mkdir -p "$BACKUP_DIR/rootfs"
sudo chmod 755 "$BACKUP_DIR/rootfs"

echo "✅ Limpieza completada exitosamente"
echo "📁 Directorio listo para nuevo backup en: $BACKUP_DIR"

# Mostrar estado final
echo ""
echo "Estado actual del directorio:"
ls -la "$BACKUP_DIR"
