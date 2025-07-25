#!/bin/bash
# Script: documentar_drivers.sh
# Documenta todos los drivers del sistema actual

FECHA=$(date +"%Y%m%d_%H%M%S")
DIRECTORIO="$HOME/documentacion_drivers_$FECHA" # Usar $HOME en lugar de ~

echo "=== Documentando drivers del sistema ==="
echo "Fecha: $(date)"
echo "Kernel: $(uname -r)"
echo "Directorio de salida: $DIRECTORIO"
echo "========================================"

# Crear directorio de documentación
mkdir -p "$DIRECTORIO"

echo "1. Documentando módulos del kernel..."
lsmod >"$DIRECTORIO/modulos_cargados.txt"
echo "✅ Módulos guardados"

echo "2. Documentando hardware (lshw)..."
sudo lshw >"$DIRECTORIO/hardware_completo.txt"
lshw -short >"$DIRECTORIO/hardware_resumen.txt"
echo "✅ Hardware documentado"

echo "3. Documentando dispositivos PCI..."
lspci >"$DIRECTORIO/dispositivos_pci_basicos.txt"
lspci -v >"$DIRECTORIO/dispositivos_pci_detallados.txt"
lspci -k >"$DIRECTORIO/dispositivos_pci_con_drivers.txt"
echo "✅ PCI documentados"

echo "4. Documentando dispositivos USB..."
lsusb >"$DIRECTORIO/dispositivos_usb_basicos.txt"
lsusb -v >"$DIRECTORIO/dispositivos_usb_detallados.txt"
lsusb -t >"$DIRECTORIO/dispositivos_usb_arbol.txt"
echo "✅ USB documentados"

echo "5. Documentando información del kernel..."
uname -a >"$DIRECTORIO/info_kernel.txt"
cat /proc/version >>"$DIRECTORIO/info_kernel.txt"
echo "✅ Kernel documentado"

echo "6. Documentando drivers específicos..."
# Drivers de gráficos
echo "=== DRIVERS DE GRÁFICOS ===" >"$DIRECTORIO/drivers_especificos.txt"
lspci -k | grep -A 3 -i vga >>"$DIRECTORIO/drivers_especificos.txt"
echo "" >>"$DIRECTORIO/drivers_especificos.txt"

# Drivers de red
echo "=== DRIVERS DE RED ===" >>"$DIRECTORIO/drivers_especificos.txt"
lspci -k | grep -A 3 -i ethernet >>"$DIRECTORIO/drivers_especificos.txt"
lspci -k | grep -A 3 -i network >>"$DIRECTORIO/drivers_especificos.txt"
echo "" >>"$DIRECTORIO/drivers_especificos.txt"

# Drivers de audio
echo "=== DRIVERS DE AUDIO ===" >>"$DIRECTORIO/drivers_especificos.txt"
lspci -k | grep -A 3 -i audio >>"$DIRECTORIO/drivers_especificos.txt"

echo "✅ Drivers específicos documentados"

echo "7. Documentando paquetes de drivers..."
# Paquetes relacionados con drivers
dpkg -l | grep -i nvidia >"$DIRECTORIO/paquetes_nvidia.txt" 2>/dev/null
dpkg -l | grep -i amd >"$DIRECTORIO/paquetes_amd.txt" 2>/dev/null
dpkg -l | grep -i intel >"$DIRECTORIO/paquetes_intel.txt" 2>/dev/null
echo "✅ Paquetes documentados"

echo ""
echo "========================================"
echo "✅ Documentación completa guardada en:"
echo "$DIRECTORIO"
echo ""
echo "Archivos generados:"
ls -la "$DIRECTORIO"
echo "========================================"
