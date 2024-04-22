[[index]]
[[index_linux]]

# ARCHIVO

#### DESCRIPCION
- Los #Archivos tienen diversos comandos aplicados en estos mismos.


#### COMANDOS
- #Truncate, #Base64, #Xclip, #Sponge, #Orden, #Batcat, #JsBeautify.

Archivos ocultos:
- Un contenedor de texto que puede ocultar a/d solo de manera visual.
```bash
touch .hidden
```

Eliminar el contenido de un texto:
- El comando de eliminacion del contenido de texto de un archivo .txt.
```bash
truncate -s 0 libro.txt
# -s: Selector de lineas a eliminar.
``` 

Archivos con espacios:
- Para crear un de texto que contenga espacios, puedes utilizar la siguiente sintaxis en la terminal y para acceder:
```bash
cat 'nombre del archivo con espacios'
```

Archivos con signos:
- Estos archivos pueden ser abiertos como un ejecutable.
```bash
cat ./-
```

Base64:
- Un archivo `base64` puede ser codificado por este mismo comando y descodificado:
```bash
	cat archivo | base64 -d
```

Diff: 
- Diferencia entre el archivo nuevo y viejo.
```bash
diff new_file old_file
```

Conteo de lineas:
```bash
cat file.txt | wc -l
```

File:
- El comando `file` en sistemas Unix y Linux se utiliza para determinar el tipo de archivo mediante la inspección de su contenido y otros atributos. Proporciona información sobre el formato y la naturaleza del archivo.
```bash
	file archivo.txt
```

Xclip:
- xclip -selection clipboard : copia y guarda en el portapapeles la linea selecionada.
```bash
less .bash_history | no_dup | fzf | xclip -selection clipboard
```

Sponge:
- El comando `sponge` es parte del paquete `moreutils` en sistemas basados en Linux y tiene la función de modificar archivos de texto a medida que se lee la entrada estándar (stdin). Es particularmente útil cuando se utiliza en combinación con redireccionamientos y tuberías.
- La función principal de `sponge` es absorber toda la entrada estándar y luego escribir esa entrada en un archivo especificado. Esto es útil en situaciones donde necesitas modificar un archivo y luego escribir los cambios nuevamente en el mismo archivo. Sin `sponge`, este tipo de operación podría ser más complicado debido a cómo funcionan los redireccionamientos y las tuberías en el shell.
Aquí hay un ejemplo práctico utilizando `sponge`:
```bash
echo "Hola, mundo" > archivo.txt
cat archivo.txt | sed 's/Hola/Hello/' | sponge archivo.txt
cat archivo.txt
# En este ejemplo, `sponge` absorbe la salida del comando `sed`, que reemplaza "Hola" por "Hello", y luego escribe los cambios de nuevo en el archivo `archivo.txt`. El uso de `sponge` en este caso ayuda a evitar problemas que podrían surgir si intentaras redirigir directamente la salida del `sed` al mismo archivo que estás leyendo.
```
- En resumen, `sponge` proporciona una forma conveniente de manejar situaciones donde necesitas modificar un archivo y luego escribir esos cambios en el mismo archivo.

Js-Beautify:
1. Script js de linea continua.
```sh
# 
curl -s -X GET https://htbmachines.github.io/bundle.js
# (()=>{var e,t,n={640:(e,t,n)=>{"use strict";var r=n(742),i={"text/plain":"Text","text/html":"Url",default:"Text"};e.exports=function(e,t){var n,a,o,s,l,u,c=!1;t||(t={}),n=t.debug||!1;try{if(o=r(),s=document.createRange(),l=document.getSelection(),(u=document.createElement("span")).textContent=e,u.style.all="unset",u.style.position="fixed",u.style.top=0,u.style.clip="rect(0, 0, 0, 0)",u.style.whiteSpace="pre",u.style.webkitUserSelect="text",u.style.MozUserSelect="text",u.style.msUserSelect="text",u.style.userSelect="text",u.addEventListener("copy",(function(r){if(
```
2. Re-organizar el script js.
```js
/*! For license information please see bundle.js.LICENSE.txt */
(() => {
    var e, t, n = {
            640: (e, t, n) => {
                "use strict";
                var r = n(742),
                    i = {
                        "text/plain": "Text",
                        "text/html": "Url",
                        default: "Text"
                    };
```


Batcat:
- El comando `batcat`/`bat` es la version mejorada de `cat` . 
Usos.
1. Visualizar scripts js.
```sh
cat archivo | bat -l js
```



#### ORDEN
- Comando de orden en archivos.
Orden por peso:
```
ls | xargs du -h | sort -h
```
Fzf:
- En caso de usar 'fzf' usar '--tac' para ordernarlo de menor a mayor.
```
ls | xargs du -h | sort -h |fzf --tac
```




# DIRECTORIO




# TERMINAL
#### DESCRIPCION
- La #terminal tiene comando disponibles 

Forzar:
- Mediante el comando `bash -c` y `()` es posible forzar a realizar un comando.
```bash
# Comando 1
bash -c "comando" "comando utilzado para forzar"

# Comando 2
(find -type f) 2>/dev/null 

# Ejemplo.
bash -c "echo '' > /dev/tcp/127.0.0.1/22" 2>/dev/null
```

Scroll en la terminal:
- Usando la combinacion de teclas 'ctrl+p' para arriba y 'ctrl+n' para abajo.


# DESCOMPRECION

#### DEFINICION
- El #Descomprimir es posible mediante diferentes metodos.

Descompresor universal:
- Comando `7z` para descomprimir.
```bash
	# Descomprimir
	7z x archivo_comprimido
	# Visualizar
	7z l archivo_comprimido
```

Dpkg:
```
# Instalador
sudo dpkg -i nombre-del-archivo.deb
sudo dpkg -i

# Error por falta de dependencias
sudo apt-get install -f
```

Tar.xz:
```
tar -xJvf nombre-del-archivo.tar.xz
tar -xJvf 
```