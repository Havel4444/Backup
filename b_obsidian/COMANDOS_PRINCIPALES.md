[[index]]
[[key_bash]]

# COMANDOS II


## EXTRAS

**Documentacion:**
- Motrar la libreria del comando.
```bash
man ls
```
**Ubicacion:**
- Volver a la ultima ubicacion.
```bash
cd -
```


---------------------------------BUSQUEDA---------------------------------

LS and DU:
1. Ordenar todo por peso legible + forma acendente.
2. Ordenar todo por peso legible + forma acendente + forma recursiva.
3. Mostrar el peso del directorio sin y con sub-directorios.
4. Ordenar por fecha + forma acendente.

FIND:
1. Busqueda de archivos/directorios sin y con mayusculas.
2. Mostrar hace cuantos dias o por dia exacto se modifico el archivo/directorio.
3. Busqueda por peso.
4. Modificacion del resultado(cat) de busqueda de la manera incorrecta y las correctas.
5. Busqueda por permisos.
	1. Para todos los usuarios con los permisos exactos en el comando.
	2. Para el usuario main y tambien los que no.
		1. Legible.
		2. Modificable.
		3. Ejecutable.
6. Busqueda por usuario y grupo.
7. Conteo de archivos.


 GREP:
	 No recursivo:
		1. Ignorar mayusculas y mostrar lineas.
		2. Mostrar las lineas superiores, inferiores o ambas.
		3. Busqueda por palabra y linea completa.
		4. Mostrar las lineas que no coinciden.
		5. Muetra el numero de veces que se repite la palabra.
	Recursivo:
		6. Ignorar mayusculas y mostrar lineas.
		7. Mostrar los archivos que no tienen y tienen el patron.
		8. Busqueda por palabra y linea completa.
		9. Mostrar las lineas que no coinciden.
		10. Muetra el numero de veces que se repite la palabra.

---------------------------------ORDENAMIENTO---------------------------------

CUT:
1. Extraccion por columna.
2. Extraccion por caracter.
3. Excepcion:
	1. No mostrar uno o varios caracteres.
	2. No mostrar una o varias columnas.

AWK:
1. Dividir por columnas.

SORT:
1. Ordenas de forma acendente.
2. Ordenas de forma acendente o decendente y pasarlo a otro archivo.

UNIQ:
1. Mostrar las lineas unificadas.
2. Mostrar las lineas que unicas.
3. Mostrar las lineas duplicadas sin y con  grupo.
4. Mostrar la cantidad de veces que se repite cada linea.
5. Mostrar ignorando mayusculas y minusculas.

HEAD:
1. Mostrar los primeros caracteres.
2. Unir y mostrar 2 archivos sin o con encabezados.

TAIL:
1. Mostrar los ultimos caracteres.
2. Mostrar desde N linea hasta la ultima.
3. Entrar en modo vision.

WC:
1. Mostrar las lineas, palabras y caracteres.
2. Mostrar las lineas.
3. Mostrar las palabras.
4. Mostrar los caracteres.

---------------------------------MODIFICACION---------------------------------

MKDIR:
1. Crear padre sin o con hijos.

SED:
1. Cambiar palabra.
2. Cambiar palabra por un palabra en la linea.
3. Eliminar una linea por su numeracion.
4. Eliminar todas las lineas que contengan cierta palabra.
5. Mostrar una o varias lineas.

TR:
1. Cambiar mayusculas por minusculas y vicesersa.
2. Cambiar caracter/s por caracter/s.
3. Eliminar caracteres.
4. Eliminar saltos de linea
5. Eliminar espacios innecesarios.
6. Reamplazar caracter por algo, ejemplo: salto de linea.


---------------------------------PERMISOS---------------------------------




## BUSQUEDA

**ls:**
- Mostrar el peso del archivo + ordenamiento.
```bash
ls -lsh

// Orden por peso.
ls -lh -S
// Orden por peso al revez.
ls -lh -Sr
```

- Mostrar por fecha de creacion.
```bash
ls -lt

// Alarevez
ls -ltr
```

- Busqueda recursiva: Muestra detalladamente los sub-directorios.
```bash
ls -lR
```

**du:**
- Mostrar el peso del directorio __sin__ subdirectorios + ordenamiento. 
```bash
du -sh ~/Vídeos
du -sh *

// Orden por peso.
du -sh * | sort -h

// Orden por peso al revez.
du -sh * | sort -hr
```
- Mostrar el peso del directorio __con__ subdirectorios + ordenamiento.
```bash
du -h ~/Vídeos
du -h *

// Orden por peso.
du -h * | sort -h

// Orden por peso al revez.
du -h * | sort -hr
```

**find:**
- Busca archivos y directorios __ignorando__ o __con__ mayusculas.
```bash
find . -type d -iname "archivo.txt"
find . -type f -name "ARCHIVO.txt"
```

- Busqueda por fecha de modificacion por inicio de dia o de hace 24 horas.
```bash
// hoy/etc a partir de las 00:00.
find . -daystart -mtime 0
find . -daystart -mtime -2
// Hace 24/etc horas
find . -mtime 0
find . -mtime -2
```

- Busqueda por peso.
```bash
// Mayor que
find . -size +1G
// Mayor que
find . -size +100M
// Mayor que
find . -size +50k
```

- Ejecutar un comando sobre el resultado __sin__ caracteres especiales.
```bash
find . -type f -name "archivo.txt" | xargs cat 
```
- Ejecutar un comando sobre el resultado __con__ caracteres especiales.
```bash
find . -type f -name "archivo.txt" -print0 | xargs -0 cat 
find . -type f -name "archivo.txt" -exec cat {} \;
```

- Busqueda por permisos.
```bash
find . -perm 777
```
- Busqueda por usuario, grupo y otros.
```bash
find . -user havel
find . -group havel
```

**grep:**
```bash
find . -name "archivo.txt" exec grep "pato" {} \;

grep -i	Ignora mayúsculas/minúsculas.
grep -v	Muestra las líneas que no coinciden.
grep -r o -R	Busca recursivamente en directorios.
grep -n	Muestra el número de línea.
grep -l	Muestra solo el nombre del archivo que contiene el patrón.
grep -L	Muestra archivos que NO contienen el patrón.
grep -c	Muestra el número de coincidencias por archivo.
grep -w	Coincidencia exacta de palabra completa.
grep -x	Coincidencia exacta de línea completa.
grep -A N	Muestra N líneas después de la coincidencia.
grep -B N	Muestra N líneas antes de la coincidencia.
grep -C N	Muestra N líneas antes y después de la coincidencia.
grep -E	Usa expresiones regulares extendidas (como egrep).
grep -F	Trata el patrón como texto literal, sin interpretar regex.
```


## ORDENAMIENTO

**cut:**
- Extrae columnas o campos delimitados.
```bash
// Extraer la columna 1 con un delimitador.
cut -d ',' -f 1 archivo.txt
// Extraer solo caracteres: puede ser 1 o del numero 1 al 5.
cut -c 1-5 archivo.txt
// Excepcion por columna y caracter.
cut -d ',' --complement -f 1 archivo.txt
cut --complement -c 1 archivo.txt
```
**awk:**
- Procesa texto por patrones, imprime columnas, hace calculos.
```bash
awk -F',' '{print $1}' archivo.txt
```

**sort:**
- Ordena lineas de texto alfabeticamente o numericamente.
```bash
// Orden inverso.
sort -r archivo.txt
// Copiar el archivo ordenado a otro.
sort archivo.txt -o salida.txt
```
**uniq:**
- Elimina lineas duplicadas consecutivas.
```bash
// Quita solo los clones.
uniq archivo.txt
// Quita todas las lineas iguales.
uniq -u archivo.txt
// Muestra las lineas que se repiten por grupo y por separado.
uniq -d archivo.txt
uniq -D archivo.txt
// Muestra la cantidad de veces que se repite cada linea.
uniq -c archivo.txt
// Ignorar las mayusculas y minusculas.
uniq -i archivo.txt
```

**head:**
- Muestra las primeras lineas de un archivo.
```bash
// Muestra los primeros 10 caracteres.
head -c 10 archivo.txt
// Muestra todo menos las ultimas 3 lineas.
head -n -3 archivo.txt
// Muestra el contenido de 2 archivos sin encabezado
head -q archivo.txt archivo_2.txt
// Muestra el contenido de 2 archivos con encabezado
head archivo.txt archivo_2.txt
```
**tail:**
- Muestra las ultimas lineas.
```bash
// Muestra los ultimos 10 caracteres.
tail -c 10 archivo.txt
// Muestra las lineas desde la 4 al final.
tail -n +4
// Muestra en vivo los cambios del archivo.
tail -f archivo.txt
```

**wc:**
- Cuenta lineas, palabras, caracteres.
```bash
// Comando base: lineas, palabras y bytes
wc archivo.txt
// Contar las lineas.
wc -l 
// Contar las palabras.
wc -w
// Contar los caracteres.
wc -m
```

## EDICION

**mkdir:**
- Padres __con__ y __sin__ hijos.
```bash
// Solo padres
mkdir -p father1 father2

// Padres e hijos
mkdir -p father/hijo1/hijo2
```

**sed:**
- Editor de flujo: reemplaza, elimina, transforma texto.
```bash
// Cambiar una palabra en todas las lineas.
sed -i 's/arbol/roble/g' archivo.txt 
// Reemplazar una palabra solo en lineas que contengan cierta palabra. 
sed -i '/comando/s/buce/bucle/g' archivo.txt
// Eliminar una linea
sed '2d' archivo.txt
// Eliminar todas las lineas que contengan una palabra especifica.
sed -i '/chile/d' archivo.txt
// Mostrar una linea especifica y el rango de una a otra. 
sed -n '2p' archivo.txt
sed -n '2,4p' archivo.txt
```

**tr:**
- Reemplaza o elimina caracteres.
```bash
// Cambiar minusculas por mayusculas y viceversa.
echo "hola mundo" | tr 'a-z' 'A-Z'
// Cambiar palabra por palabra.
echo "hola mundo" | tr 'abc' 'xyz'
// Eliminar caracteres.
echo "hola mundo" | tr -d 'abc'
// Eliminar los saltos de linea luego de cada palabra.
echo "hola mundo" | tr -d '\n'
// Eliminar espacion innecesarios.
echo "hola  mundo" | tr -s ' '
// Reemplazar espacios por saltos de linea.
echo "hola mundo" | tr ' ' '\n'
```
## USUARIO Y PERMISOS


## ASD

