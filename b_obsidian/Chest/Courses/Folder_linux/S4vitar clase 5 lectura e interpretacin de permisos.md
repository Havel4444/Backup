[[index]]
[[index_linux]]

## LECTURA Y PERMISOS

**CATEGORIA:**
	Cada carpeta o archivo en un directorio ira acompañado de una primera letra que lo identifica.
1. -: archivo.
2. d: carpeta.
3. l: acceso directo.


**PERMISOS:**
	Cada archivo o carpeta tiene 3 grupos de individuos de los cuales son propietario, grupo y otros.
	Los permisos para cada grupo se dividen en:
1. r: lectura.
2. w: escritura.
3. x: ejecucion.

Todos los archivos o carpetas pueden ser creados por un individuo diferente, por ejemplo:
```
# archivo y carpeta creados en modo root
drwxr-xr-x root root ...
-rw-r--r-- root root ...
# archivo y carpeta creados en modo normal
drwxr-xr-x havel havel ...
-rw-r--r-- havel havel ...
```











