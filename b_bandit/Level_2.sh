#!/bin/bash

## M0: Metodo 1
function p0() {
    cat 'archivo separado por espacios'
}
## M1: Metodo 2
function p1() {
    cat archivo\ separado\ por\ espacios
}
## M2: Muestrame todo los que inicie con estos caracteres.
function p2() {
    cat ar*
}
## M3: Muestrame todos los contenidos de los archivos de esta ruta.
function p3() {
    cat /home/user/*
    cat $(pwd)/*
    cat *
}
