[[index]]
[[index_linux]]

# ASD
#ScriptBash
Base de datos:
- En este caso se usara la base de datos de una pagina que contiene informacion de maquinas. 

Paso a paso parte 1: verificacion de archivo.
1. Solicitud http.
```sh
# El siguiente comando es el metodo comun para recupera datos de un servidor.
curl -s -X GET https://htbmachines.github.io/ | batcat
# curl: Herramiente de transferencia de datos.
# -s: Simplificar informacion enviada.
# -X: Seleccion del tipo de metodo.
# GET: Metodo predeterminado para pedir datos.
```
1. Salida de la solicitud http.
```sh
# Estructura de una pagina web. La salida que obtuviste parece ser el contenido HTML de la página web ubicada en la URL https://htbmachines.github.io/.
<!doctype html><html lang="en"><head><meta charset="utf-8"/><meta name="viewport" content="width=device-width,initial-scale=1"/><meta name="description" content="HTB Machines"/><meta name="author" content="rroderickk"/><meta name="author" content="CheatModes4"/><meta name="twitter:site" content="@cheatmodes4"/><meta name="twitter:creator" content="@cheatmodes4"/><meta property="og:site_name" content="github.com/rroderickk"/><meta property="og:site_name" content="rroderickk.github.io"/><meta property="og:type" content="website"/><link rel="icon" type="image/x-icon" href="/public/82fe1035e8b102375254.jpg"><link rel="stylesheet" href="//cdn.jsdelivr.net/npm/hack-font@3/build/web/hack.css"><title>HTB Machines - Search Engine</title><script defer="defer" src="/bundle.js"></script></head><body><main id="root"></main></body></html>
# <meta> y <title>: Estos elementos proporcionan información sobre la página, como el conjunto de caracteres, la descripción, el autor y el título. En este caso, el título es "HTB Machines - Search Engine".
# <link>: Este elemento enlaza recursos externos, como la hoja de estilo y el ícono de la página.
# <script>: Aquí se carga un script llamado `bundle.js` desde la raíz del servidor (`/bundle.js`). Los scripts se utilizan para agregar funcionalidad dinámica a la página.
# <body>: Esta es la sección del cuerpo del HTML, donde se coloca el contenido visible de la página. En este caso, parece estar vacío (`<main id="root"></main>`), y el contenido real puede generarse dinámicamente mediante JavaScript.
```
1. Obtener el script completo y organizado.
```sh
# Obtencion:
curl -s -X GET https://htbmachines.github.io/bundle.js | js-beautify > maquinas
# Visualizacion:
bat -l js maquinas
```
2. Script sh.
```sh








```





## 2 PARAMETRO
1. **Inicialización de la variable `opcionO`:**
   - `opcionO=""`: En este caso, `opcionO` es una cadena de texto, y la inicializamos con una cadena vacía (`""`). No es necesario utilizar `declare -i` ya que `opcionO` no se utilizará como un número entero.

2. **Opción `-o` en el `getopts`:**
   - `o) opcionO=$OPTARG;;`: Aquí, estamos asignando el valor de la opción `-o` (que debería ser una distribución) a la variable `opcionO`. Utilizamos `$OPTARG` para obtener el argumento asociado con la opción `-o`. No necesitamos `declare -i` porque estamos tratando con texto y no con números enteros.

En resumen, `opcionO=""` inicializa la variable como una cadena vacía, y `o) opcionO=$OPTARG;;` asigna el valor del argumento de la opción `-o` a la variable `opcionO`. En este caso, asumimos que la distribución especificada será un valor de texto, no un número entero, por lo que no necesitamos declarar `opcionO` como un número entero.

## GREP VACIO
El comando `grep ''` selecciona todo lo disponible de un archivo, en otro caso `cat archivo | grep -wi "name" -A10 | grep ""` el ultimo grep selecciona toda la salida del primer grep haciendo que el ultimo grep sea como un opcion omitida.


## ERROR: 2 SUBparametros EN UNA VARIABLE

## COMANDO: ARCHIVO SIN ACENTOS
```sh
sed 's/á/a/g; s/é/e/g; s/í/i/g; s/ó/o/g; s/ú/u/g; s/ü/u/g; s/Á/A/g; s/É/E/g; s/Í/I/g; s/Ó/O/g; s/Ú/U/g; s/Ü/U/g' machines > machines_sin_acentos
```

## COMANDO AWK
- Busqueda por filas ignorando las mayusculas y minusculas.
```sh
cat machines | awk "BEGIN{IGNORECASE=1} /name: \"nombreDeMaquina\"/,/resuelta: /"
```

## IGNORAR CARACTER ESPECIL PARA UN STRING
- Con el slash `\` es posible  ignorar los caracteres especiales para convertirlos en cadenas de texto.
```sh
cat archivo | grep "apodo \'pato\'"
```

























