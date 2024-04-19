" Habilitar resaltado de sintaxis
syntax on

" Establecer el tamaño de la tabulación
set tabstop=4

" Habilitar la detección de tipo de archivo
filetype on

" Mostrar la regla en la parte inferior
set ruler

" Comando para copiar al portapapeles
command Cp :'<,'>w !xclip -selection clipboard

" Habilitar la visualización de caracteres especiales
set list

" Mostrar números de línea
set nu

" Mostrar números relativos
set relativenumber

" Deshabilitar la regla
set noruler

" Deshabilitar la visualización de caracteres especiales
set nolist

" Establecer el portapapeles como unnamedplus (para copiar al portapapeles)
set clipboard=unnamedplus

" Establecer el esquema de colores
colorscheme industry

" Establece el ancho de los tabuladores (tabstops) en 4 espacios
set tabstop=4

" Establece la cantidad de espacios para la sangría (indentación)
set shiftwidth=4

" Convierte los tabuladores en espacios
set expandtab
