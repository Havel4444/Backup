#!/bin/bash

# Script para montar la partición de backups de Kali Linux
# Autor: Tú
# Fecha: $(date)

# Variables
PARTICION="/dev/sda2"
PUNTO_MONTAJE="/media/havel/kalibackup"

# Crear el directorio de montaje si no existe
if [ ! -d "$PUNTO_MONTAJE" ]; then
    echo "Creando directorio de montaje: $PUNTO_MONTAJE"
    sudo mkdir -p "$PUNTO_MONTAJE"
fi

# Verificar si la partición ya está montada
if mount | grep -q "$PUNTO_MONTAJE"; then
    echo "⚠️  La partición ya está montada en $PUNTO_MONTAJE"
    exit 1
fi

# Montar la partición
echo "Montando $PARTICION en $PUNTO_MONTAJE..."
sudo mount "$PARTICION" "$PUNTO_MONTAJE"

# Verificar si el montaje fue exitoso
if [ $? -eq 0 ]; then
    echo "✅ Partición montada exitosamente en $PUNTO_MONTAJE"
    echo "Puedes acceder a ella con: cd $PUNTO_MONTAJE"
else
    echo "❌ Error al montar la partición"
    exit 1
fi
