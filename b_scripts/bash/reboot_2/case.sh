#!/bin/bash

# Opciones de menu simple
function p1(){
    read -p "Escoge una opcion: " num

    case $num in
        1) echo -e "\ngraficos";;
        2) echo -e "\ncomandos";;
        *) echo -e "\nvalor incorrecto";;
    esac
}

# Ejercicio: Menu v2.
function p2(){
    echo -e "\n1) Ver fecha actual."
    echo "2) Mostrar el directorio."
    echo "3) Nombre del usuario actual."
    echo -e "4) Salir.\n"

    read -p "Introdusca un valor del 1 al 4: " option

    declare -i c_fecha=0
    declare -i c_directorio=0
    declare -i c_nombre=0

    case $option in
        1) ((c_fecha+=1));;
        2) ((c_directorio+=1));;
        3) ((c_nombre+=1));;
        4) ;;
    esac

    function f_fecha(){
        echo -e "\nfecha: \n$(date)"
    }
    function f_directorio(){
        echo -e "\nEscritorio: \n$(ls)"
    }
    function f_nombre(){
        echo -e "\nUsuario: \n$(whoami)"
    }

    if [ $c_fecha -eq 1 ]; then
        f_fecha
    elif [ $c_directorio -eq 1 ]; then
        f_directorio
    elif [ $c_nombre -eq 1 ]; then
        f_nombre
    fi
}

# Dia de la semana.
function p3(){
    read -p "Introdusca un numero(1-7): " dia
    #echo "Introdusca un numero(1-7): "

        case $dia in
        1) echo -e "\nLunes";;
        2) echo -e "\nMartes";;
        3) echo -e "\nMiercoles";;
        4) echo -e "\nJueves";;
        5) echo -e "\nViernes";;
        6) echo -e "\nSabado";;
        7) echo -e "\nDomingo";;
        8) ;;
        esac
}

#Calculadora simple
function p4(){
    # Colours
    greC="\e[0;32m\033[1m"
    endC="\033[0m\e[0m"
    redC="\e[0;31m\033[1m"
    bluC="\e[0;34m\033[1m"
    yelC="\e[0;33m\033[1m"
    purC="\e[0;35m\033[1m"
    turC="\e[0;36m\033[1m"
    graC="\e[0;37m\033[1m"

    echo -e "\n---CALCULO---\n"
    read -p "Numero 1 = " num1
    read -p "Numero 2 = " num2
    read -p "Operacion(+, -, x, /) = " operation

    myList=("+" "-" "x" "/")

    function suma(){
        result=$(($1 + $2))
        echo -e "\n${greC}Resultado: $result.${endC}"
    }
    function resta(){
        result=$(($1 - $2))
        echo -e "\n${greC}Resultado: $result.${endC}"
    }
    function multiplicacion(){
        result=$(($1 * $2))
        echo -e "\n${greC}Resultado: $result.${endC}"
    }
    function division(){
        if [ $2 -eq 0 ]; then
            echo -e "\n${redC}Error: no se puede dividir entre 0.${endC}"
            exit 1
        fi
        result=$(($1 / $2))
        echo -e "\n${greC}Resultado: $result.${endC}"
    }
    function calculo() {
        case $operation in
            "+") suma $num1 $num2;;
            "-") resta $num1 $num2;;
            "x") multiplicacion $num1 $num2;;
            "/") division $num1 $num2;;
        esac
    }

    if [[ " ${myList[@]} " == *" $operation"* ]]; then
        calculo
    else
        echo -e "\n${redC}Error: valor operatorio invalido.${endC}"
    fi
}

## Case ##
# Menu con opciones numericas:
# if si el valor es un numero entero dentro un rango.
function p5(){
    echo -e "\n1) Date."
    echo  "2) User."
    echo -e "3) Exit."

    read -p "Enter a value(1;2;3)" value

    declare -i c_date=0
    declare -i c_user=0

    case value in
        1) let $c_date+=1;;
        2) let $c_user+=1;;
        3) ;;
    esac

    if 

        if [ $c_date -eq 1 ]; then
            f_date
        elif [ $c_user -eq 1 ]; then
            f_user
        fi

}
# if si el valor es un numero entero decimal en rango.
