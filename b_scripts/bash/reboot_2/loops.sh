#!/bin/bash

# Bucle: while. Mientras que $number sea menor a 5 seguir.
function p1(){
    number=0
    while [ $number -lt 5 ]; do 
        echo "Numero actual: $number"
        let number+=1 # ((number++))
    done
}

# Bucle: untile. Hasta $number sea mayor a 5 parar.
function p2(){
    number=0
    until [ $number -gt 5 ]; do 
        echo "Numero actual: $number"
        let number+=1 # ((number++))
    done
}

# Bucle: for.
function p3(){
    myList=("Amarillo" "Verde" "Marron")

    for item in "${myList[@]}"; do
        echo "Color: $item"
    done
}
# Bucle: for. Contar desde 10 a 100 de 10 en 10. 
function p4(){
    for item in {10..100..10}; do
        echo "N: $item"
    done
}
function p5(){
    for (( i=1; i < 10+1; i++ )); do 
        echo "N: $i"
    done
}
