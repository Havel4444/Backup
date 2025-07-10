#!/bin/bash

# Enviar texto
function p1() {
    cat >> hello.txt
}
# Ver texto.
function p2() { 
    cat << myText 
    hola mundo
myText
}






