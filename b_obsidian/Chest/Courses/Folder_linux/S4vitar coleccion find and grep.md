[[index]]
[[index_linux]]


# FIND

#### **USUARIO Y GRUPO**
- El #UsuarioYGrupo dentro de #Find pueden ser combinados con los siguientes comandos.

Comandos de busqueda:
- Busca los archivos/directorios que contengan de grupo/usuario al usuario seleccionado y dirige los errores al tacho.
```bash
# Sin sub-carpetas: No buscara en subcarpetas.
find . -maxdepth 1 -type f -not -name "search*"

# Grupo
find / -group havel 

# Usuario
find / -user havel 

# Practica1: Archivos root que empiecen con 'python3.9' mas sus permisos.
find / -group root -type f -name python3.9* -ls 2>/dev/null | awk '{$1=$1}1'
```

Permisos:
- Busca los archivos/directorios que contengan de grupo/usuario al grupo/usuario seleccionad `PERO` que tenga el permiso de lectura , escritura o ejecucion.
```bash
# Lectura
find / -user havel -readable
# Alterno
find / -user havel -not -readable

# Escritura
find / -user havel -writable 
# Alterno
find / -user havel -not -writable 

# Ejecucion
find / -user havel -executable 
# Alterno
find / -user havel -not -executable 

# Practica: Busqueda por usuario/g, tipo y visualizarlo con permisos
find / -user havel -writable -type f 2>/dev/null | xargs ls -l
# Practica2: agregando fzf
find / -user havel -writable -type f 2>/dev/null | xargs ls -l | fzf
```


#### **PERMISOS**
- El #StickyBit, #Suidi y #Sgid son permisos de acceso.

Sticky biy*
```bash
find / -perm -1000

# Practica1: A/D con permisos +t 
find / -perm -1000 -ls 2>/dev/null | awk '{$1=$1}1'
```

Suid y sgid:
```bash
find / -perm -4000

# Practiva: El doble permiso es posible por medio de los paréntesis que se utilizan para agrupar las expresiones -perm -4000 y -perm -2000 y el operador lógico -o indica que se deben buscar archivos que tengan permisos SUID, SGID o 20002.
find / -type f \( -perm -4000 -o -perm -2000 \) 2>/dev/null | xargs ls -l
```

Permiso recursivo:
```bash
find / -perm /444
```


#### **ASTERISCO**
- El #Asterisco se utiliza como comodín para representar cualquier cantidad y combinación de caracteres en nombres de archivos o directorios durante una búsqueda.
- Busqueda por el nombre incompleto.
```bash
find / -name *kitt* -type d
```

#### **SIGNO DE PREGUNTA**
- El #SignoDePregunta ayuda a autocompletar la busqueda.
```bash
find / -name python??? -type f 

# Practica:
find / -group root -type f -name python??? -ls 2>/dev/null | awk '{$1=$1}1'
```


#### EXEC


#### **SIZE**
- El #Size busca a/d por su peso y otros parametros.
  En el comando `find`, la opción `-size` se utiliza para buscar archivos según su tamaño. Aquí tienes algunos ejemplos simples de cómo usar `-size`:
1. Buscar archivos más grandes que un tamaño específico.
```bash
find / -type f -size +1M
# Ejemplo con megabits
find / -type f -size 1G
```
1. Buscar archivos más pequeños que un tamaño específico.
```bash
find / -type f -size -100k
```
1. Buscar archivos de un tamaño específico.
```bash
find / -type f -size 500c
```



________________________________________________________________________


#### XARGS
- El #Xargs se utiliza para construir y ejecutar comandos a partir de la entrada estándar. A menudo se usa para tomar la salida de otro comando y pasarla como argumentos a otro comando.

Permisos:
```bash
# Practica2: Elimina todos los archivos que terminen en '.txt'
find / -name *.txt -type d | xargs rm
# Practica3: Permisos
find /
```


#### **AWK**
- El #Awk es ideal para trabajar con columnas de datos y realizar operaciones en base a patrones o campos específicos en líneas de texto. Puede realizar cálculos, filtrar datos, reorganizar la salida, entre otras tareas.

Eliminar espacion:
```bash
awk '{$1=$1}1'
awk '{print $2}'

# Practica1:
find / -group havel -type f -name *python* -ls 2>/dev/null | awk '{$1=$1}1'
# Practica2: Muestra la segunda columna del archivo de texto
find / -type f -name pato.txt 2>/dev/null | awk '{print $2}'
```

Seleccion:
1. Imprimir la segunda columna de un archivo CSV:
```bash
cat archivo.csv | awk -F ',' '{print $2}'
```
2. Seleccionar la linea:
```bash
cat archivo.csv | grep -n 'valor' | awk -F ',' '$1 == 28 {print $2}'
```
3. Seleccionar la ultima columna:
```bash
awk -F '/' '{print $NF}' archivo.txt
```


#### **GREP RECURSIVO** 
- El #GrepRecursivo buesca en todas las carpetas y archivos que elija.

1. **`\w`:** Representa cualquier carácter de palabra, incluyendo letras (mayúsculas y minúsculas), números y guiones bajos.
```bash
grep -r '\w' archivo.txt
```
2. **`\W`:** Representa cualquier carácter de simbolo.
```bash
grep -r '\W' archivo.txt
```
3. **`\d`:** Representa cualquier dígito (equivalente a `[0-9]`). Este comando buscará líneas que contengan al menos un dígito.
```bash
grep -r '\d' archivo.txt
```
3. **`\D`:** Representa cualquier carácter que no sea un dígito (equivalente a `[^0-9]`). Este comando buscará líneas que contengan al menos un carácter que no sea un dígito.
```bash
grep -r '\D' archivo.txt
```
4. **`\s`:** Representa cualquier carácter de espacio en blanco (espacios, tabulaciones, saltos de línea). Este comando buscará líneas que contengan al menos un carácter de espacio en blanco.
```bash
grep -r '\s' archivo.txt
```
1. **`\S`:** Representa cualquier carácter que no sea un espacio en blanco. Este comando buscará líneas que contengan al menos un carácter que no sea un espacio en blanco.
```bash
grep -r '\S' archivo.txt
```

Ignorar:
- Con el comando `-v` puedes resaltar o ignorar archivos o directorios y si se requiere hacerlo con mas de 1 unidad es posible con `-E`.
```sh
find . -type f | grep -vE "archivo|directorio" 
```


#### **GREP COMUN**
- El #Grep es el uso  comun con o sin `find`.

1. **`-w`:** Busca solo palabras completas, no subcadenas.
```bash
grep -w "palabra" archivo.txt
```
2. **`-i`:** Busca palabras ingnorando mayusculas y minusculas.
```bash
grep -i "palabra" archivo.txt
```
3. **`-r`:** Busca en la carpeta y sub-carpetas.
```bash
grep -r "palabra" archivo.txt
```
4. **`-l`:** Muestra los archivos que contienen la palabra clave.
```bash
grep -l 'palabra' archivo.txt 
```
5. **`-n`:** Muestra el número de línea junto con el resultado de la búsqueda.
```bash
grep -n "patrón" archivo.txt
```
6. **`-v`**: Permite ignorar archivos o directorios y si se requiere hacerlo con mas de 1 unidad es posible con `-E`.
```bash
find . -type f | grep -vE "archivo|directorio" 
```
7. **`-e`:** Permite especificar múltiples patrones de búsqueda.
```bash
grep -e "patrón1" -e "patrón2" archivo.txt
```
8. **`-c`:** Muestra solo el recuento de líneas que coinciden con el patrón.
```bash
grep -c "patrón" archivo.txt
```
9. **`-A, -B and -C`**: Seleciona y muestra las lineas superiores e inferiores como tambien ambas. 
```bash
grep "patron" archivo.txt -A/-B/-C
```


#### **SORT**
- El #Sort es un comando en sistemas Unix y Linux que se utiliza para ordenar líneas de texto en un archivo o datos provenientes de la entrada estándar. 


#### **UNIQ**
- El #Uniq es un comando que se utiliza para eliminar líneas adyacentes duplicadas en un archivo o datos provenientes de la entrada estándar.
Lineas duplicadas:
```bash
cat archivo.txt | sort | uniq -d
```
Conteo de lineas duplicadas:
```bash
cat archivo.txt | sort | uniq -c
```
Conteo de lineas no duplicadas:
```bash
cat archivo.txt | sort | uniq -u
```


#### **XXD**
- El #Xxd en linux se utiliza para crear una vista hexadecimal de los datos. 
1. Crear una vista hexadecimal de un archivo.
```bash
xdd archivo
```
1. Convertir una vista hexadecimal en su estado original. Este mimo debe de ser redirigido a un archivo diferente mediante _<>_. 
```bash
# Revertir
xdd -r archivo
# Redirigil
xdd -r archivo > archivo_vacio 
```


#### **CUT**
- El #Cut es especialmente útil cuando trabajas con archivos de texto delimitados por columnas, ya que te permite recortar y mostrar solo las partes específicas de cada línea.

Ejemplo:
1. Supongamos que tienes un archivo CSV (valores separados por comas) llamado `datos.csv` con el siguiente contenido:
```plaintext
Nombre,Apellido,Edad
Juan,Pérez,25
María,Gómez,30
Carlos,Ruiz,28
```
2. Para extraer solo la columna de "Apellido", puedes usar `cut` de la siguiente manera:
```bash
cut -d ',' -f2 datos.csv
```
- `-d','`: Especifica que el delimitador es la coma.
- `-f2`: Indica que quieres extraer el segundo campo.
3. La salida será:
```plaintext
Apellido
Pérez
Gómez
Ruiz
```


#### **TR**
- El #Tr en sistemas Unix y Linux se utiliza para realizar la traducción de caracteres en una secuencia de texto, incluyendo la posibilidad de cambiar o eliminar saltos de línea.

Salto de linea:
```bash
cat archivo | tr ' ' '\n' | head -n 4
```

Cifrado:
- El ROT13 (Rotate by 13 places) es un cifrado de sustitución simple que rota (desplaza) cada letra del alfabeto en 13 lugares. Es un cifrado de tipo Caesar, y se utiliza comúnmente como una forma de ocultar o "encriptar" texto de una manera simple.
- Existen paginas para hacer este proceso mas facil y rapido, se buscan con el nombre de "ROT12...".
```bash
# Descodificar y codificar
cat archivo | tr 'A-Za-z' 'N-ZA-Mn-za-m'
echo 'texto' | tr 'A-Za-z' 'N-ZA-Mn-za-m'
```


#### SED
- El #Sed (editor de secuencias) en sistemas Unix y Linux se utiliza para realizar transformaciones de texto en un flujo de entrada o un archivo. Es comúnmente utilizado para buscar, reemplazar, insertar o eliminar texto en un archivo o flujo de datos.

Cambio de palabra:
```bash
echo "palabra" | sed 's/palabra/letra/'
```
Cambio de palabras:
```bash
# Metodo 1 
echo "palabra y la palabra" | sed 's/palabra/letra/g'
# Metodo 2 
echo "palabrasas palabra" | sed 's/palabra/arbol/g' -> arbolsas arbol
# Metodo 3 
echo "palabrasas palabra" | sed 's/palabra.*/letra/g' -> letra letra
# Metodo 4
echo "macancosapo sapo" | sed 's/^sapo.*/letra/g' -> macancosapo letra
```
Cambio de palabras por un patron:
```bash
# Metodo 1
echo "palabra y la palabra" | sed 's/^palabra de carton con madera$/letra/g'
# Metodo 2 
echo "palabra y la palabra" | sed 's/^palabra.*madera$/letra/g'
```
Modificacion directa de archivo:
```bash
valor="$1"
sed -i "s/palabra.*/palabra_nueva $valor/" "$ruta"
```

Palabra unica y oracion:
- Para usar `sed` y cambiar una palabra específica asegurándote de que solo se modifiquen las instancias que comiencen y terminen con esa palabra exacta, sin afectar a las variantes que tengan caracteres adicionales antes o después, puedes hacer uso de las expresiones regulares, particularmente del uso de límites de palabra (`\b`), que indican el inicio o el final de una palabra.
- En tu caso, si deseas reemplazar la palabra "pato" por otra, digamos "gato", pero no quieres cambiar palabras como "patos_t", puedes usar el siguiente comando `sed`:
```bash
# Ejmplo: palabra
sed 's/\bpato\b/gato/g' archivo.txt
# Ejmplo: oracion
sed 's/\bpato asado a la parrilla\b/cerdo ahumando al horno/g' archivo.txt
```
1. `sed`: Invoca el editor de flujo.
2. `'s/\bpato\b/gato/g'`: Es la expresión que le dice a `sed` lo que vas a hacer.
3. `s`: Indica que vamos a sustituir.
4. `\b`: Es un límite de palabra, asegurando que "pato" esté aislado como una palabra completa.
5. `pato`: Es la palabra que queremos reemplazar.
6. `gato`: Es la palabra por la cual queremos reemplazar "pato".
7. `g`: Es un indicador global, lo que significa que todas las instancias en una línea serán reemplazadas.
8. `archivo.txt`: Es el nombre del archivo en el que deseas realizar el reemplazo.
- Este comando buscará en `archivo.txt` todas las instancias de "pato" que sean palabras completas y las reemplazará por "gato", dejando intactas variantes como "patos_t" debido al uso de `\b`, que asegura que solo se modifiquen las palabras exactas "pato".
- Si quieres hacer los cambios directamente en el archivo (editarlo en lugar), puedes usar la opción `-i` con `sed` en sistemas basados en GNU (como Linux):
```bash
sed -i 's/\bpato\b/gato/g' archivo.txt
```

## CADENA
- Cuando se quiera buscar una cadena de texto usando `grep` que contiene `""` lo recomendables es acompañar las comillas con el simbolo slash.
```sh
cat archivo | grep -wi "name: \'atom\'"
```

#### LINK
```bash
# Comando find
https://www.ionos.es/digitalguide/servidores/configuracion/comando-linux-find/

# Comando awk
https://www.shortcutfoo.com/app/dojos/awk/cheatsheet
extension://kgnghhfkloifoabeaobjkgagcecbnppg/pages/pdf_viewer.html?r=https://bl831.als.lbl.gov/~gmeigs/scripting_help/awk_cheat_sheet.pdf

# Comando sort
https://www.ibidemgroup.com/edu/tutorial-sort-linux-unix/
# Comando uniq
https://victorhckinthefreeworld.com/2021/10/21/el-comando-uniq-de-gnu/
```