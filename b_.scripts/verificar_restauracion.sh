#!/bin/bash
# verificar_restauracion.sh

echo "=== Verificando sistema restaurado ==="

echo "1. Verificando drivers NVIDIA..."
lspci -k | grep -A 3 -i nvidia
if [ $? -eq 0 ]; then
    echo "✅ Driver NVIDIA detectado"
else
    echo "⚠️  Driver NVIDIA no encontrado - puede necesitar reinstalación"
fi

echo ""
echo "2. Verificando conexión de red..."
ip link show | grep -E "(eth|wlan)"
if [ $? -eq 0 ]; then
    echo "✅ Interfaz de red detectada"
else
    echo "⚠️  No se detectó interfaz de red"
fi

echo ""
echo "3. Verificando módulos críticos..."
lsmod | grep nvidia >/dev/null && echo "✅ Módulo NVIDIA cargado" || echo "⚠️  Módulo NVIDIA no cargado"

echo ""
echo "4. Verificando conexión a internet..."
ping -c 1 google.com >/dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Conexión a internet OK"
else
    echo "⚠️  Sin conexión a internet"
fi

echo ""
echo "=== Fin de verificación ==="
