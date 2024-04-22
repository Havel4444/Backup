[[index]]
[[index_linux]]

## REDIRECCION

**SALIDA:**
```
# Enviar la salida stdout a un archivo.
ls 1> datos.txt

# Enviar la salida stderr a un archivo.
ls 2> errores.txt
```

**ENTRADA:**
	Ejecuta el comando _ls_ en modo entra en 'archivo.txt' para visualiar un lista de directorios y archivos en la terminal. Esto solo se aplica si exite vinculacion una vinculacion con el camando y el contenido del archivo.
```
ls < archivo.txt
```




## DESCRIPTOR DE ARCHIVO

Un #descriptor-de-archivo es un número que identifica de forma exclusiva un archivo abierto dentro de un programa informático.

**CREACION Y ASIGNACION:**
	Usando el comando #exec es posible crear un descriptor de archivo de #identificador-numerico '3' y con permisos de lectura(<) y escritura(>).
```
exec 3<> file
```

**ESCRITURA:**
	Para poder escribir en un identificador numerico que en este caso es '3' primero se le tiene que agregar lo siguiente.
```
pwd >&3
```

**COPIA:**
	El contienido del descriptor de archivos con idetificador numerico '3' puede ser copiado en un identificadores numericos '4'.
```
exec 4>&3
```

**CIERRE:**
```
# Cerrar directamente
exec 3>&-

# Cerrar en medio de una copia
exec 4>&3-
```









### EXAMPLES AND MORE



### CONCLUSION


