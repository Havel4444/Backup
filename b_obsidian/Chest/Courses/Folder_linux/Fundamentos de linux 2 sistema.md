[[index]]
[[index_linux]]

## EDICION, CREACION Y ELIMINACION

**ELIMIAR EL CONTENIDO .TXT:**
	El comando #truncate elimina el contenia texto de un archivo .txt.
```
truncate -s 0 libro.txt
``` 
1. -s: Elijir el tamaño.
2. 0: Tamaño a eliminar.




# DESCOMPRECION

Comandos para instalar y #descomprimir. 
**.deb:**
```
# Instalador
sudo dpkg -i nombre-del-archivo.deb
sudo dpkg -i

# Error por falta de dependencias
sudo apt-get install -f
```

**tar.xz:**
```
tar -xJvf nombre-del-archivo.tar.xz
tar -xJvf 
```

**7z:**
```
# Instalador
sudo apt-get install p7zip-full

# Descompresor
7z x archivo.7z
7z x 
```

