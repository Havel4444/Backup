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

    read -p "Enter a value(1;2;3): " value

    function f_date(){
        echo -e "\nFecha:" 
        date
    }
    function f_user(){
        echo -e "\nUsuario:" 
        whoami
    }

    declare -i c_date=0
    declare -i c_user=0

    case $value in
        1) let c_date+=1;;
        2) let c_user+=1;;
        3) ;;
    esac

    if [[ "$value" =~ ^[1-3]+$ ]]; then
        if [ $c_date -eq 1 ]; then
            f_date
        elif [ $c_user -eq 1 ]; then
            f_user
        fi
    else
        echo "Valor incorrecto."
    fi 

}
function p6(){
    clear
    echo  " ## TIPO DE CALCULADORA ## "
    echo -e "\n1) Estadar."
    echo "2) Cientifica."
    echo -e "3) Salir.\n"
    read -p "Ingrese el valor(1, 2 o 3): " calculadora

    if [ $calculadora -eq 1 ]; then
        clear
        echo " ## CALCULADORA ESTANDAR ## "
        echo -e "\n1) Suma."
        echo  "2) Resta."
        echo  "3) Multiplicacion."
        echo  "4) Division."
        echo -e "5) Salir.\n"

        read -p "Ingrese el operador(1, 2, 3, 4 o 5): " operation

        if [[ "$operation" =~ ^[1-4]$ ]]; then

            read -p "Ingrese el primer numero: " num1
            read -p "Ingrese el segundo numero: " num2

            function f_sum(){
                if [[ "$1" =~ ^[1-9]+$ && "$2" =~ ^[1-9]+$ ]]; then
                    result=$(($1+$2))
                    echo -e "\nResultado: $result"
                else
                    echo -e "\nError suma: valor o valores no enteros."
                fi
            }
            function f_res(){
                if [[ "$1" =~ ^[1-9]+$ && "$2" =~ ^[1-9]+$ ]]; then
                    result=$(($1-$2))
                    echo -e "\nResultado: $result"
                else
                    echo -e "\nError resta: valor o valores no enteros."
                fi
            }
            function f_mul(){
                if [[ "$1" =~ ^[0-9]+$ && "$2" =~ ^[0-9]+$ ]]; then
                    result=$(($1*$2))
                    echo -e "\nResultado: $result"
                else
                    echo -e "\nError resta: valor o valores no enteros."
                fi
            }
            function f_div(){
                if [[ "$1" =~ ^[0-9]+$ && "$2" =~ ^[0-9]+$ ]]; then
                    if [[ $1 -eq 0 || $2 -eq 0 ]]; then
                        echo -e "\nError: no se puede dividir entre 0."
                        exit 1
                    fi
                    result=$(($1/$2))
                    echo -e "\nResultado: $result"
                else
                    echo -e "\nError resta: valor o valores no enteros."
                fi
            }

            case $operation in
                1) f_sum $num1 $num2;;
                2) f_res $num1 $num2;;
                3) f_mul $num1 $num2;;
                4) f_div $num1 $num2;;
            esac
        elif [ $operation -eq 5 ]; then
            exit 1
        else
            echo "Error: valor incorrecto."
        fi
    elif [ $calculadora -eq 2 ]; then
        clear
        echo "## CALCULADORA CIENTIFICA ## "
        echo -e "\n1) Suma."
        echo  "2) Resta."
        echo  "3) Multiplicacion."
        echo  "4) Division."
        echo -e "5) Salir.\n"

        read -p "Elige un valor(1, 2, 3, 4 o 5): " valor 
        read -p "Numero 1: " num1
        read -p "Numero 2: " num2

        if [[ "$valor" =~ ^[1-4]$ ]]; then
            function sum_f(){
                if [[ "$num1" =~ ^[0-9]+(\.[0-9]+)?$ && "$num2" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
                    resultado=$(echo "$num1 + $num2" | bc -l)
                    echo -e "\nRespuesta: $resultado"
                else
                    echo -e "Valor o valores incorrectos."
                fi
            }
            function res_f(){
                if ! [[   ]]

            }
            function mul_f(){
                echo -e "\nRespuesta: "

            }
            function div_f(){
                echo -e "\nRespuesta: "

            }
        
            case $valor in
                1) sum_f $num1 $num2;;
                2) res_f $num1 $num2;;
                3) mul_f $num1 $num2;;
                4) div_f $num1 $num2;;
            esac

        elif [ $valor -eq 5 ]; then
            exit 1
        else
            echo -e "\nError: valor incorrecto."
        fi

    elif [ $calculadora -eq 3 ]; then
        exit 1
    else
        echo -e "\nError: valor incorrecto."
    fi
}
