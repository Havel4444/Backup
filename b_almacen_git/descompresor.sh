#!/bin/bash

# Colours
greC="\e[0;32m\033[1m"
endC="\033[0m\e[0m"
redC="\e[0;31m\033[1m"
bluC="\e[0;34m\033[1m"
yelC="\e[0;33m\033[1m"
purC="\e[0;35m\033[1m"
turC="\e[0;36m\033[1m"
graC="\e[0;37m\033[1m"

file_a=$1

while [ $file_a ]; do
    7z x $file_a &>/dev/null
    file_b="$(7z l $file_a | grep -wi name -A2 | tail -n1 | awk '{print $NF}')"
    echo -e "${turC}[+] Archivo comprimido $file_a.${endC}"
    echo -e "${greC}[+] Archivo descomprimido $file_b.${endC}"

    ty="$(file $file_b)"
    if [[ "$ty" == *ASCII* ]]; then
        echo -e "\n${yelC}[?] Archivo ASCII: $file_b.${endC}"
        echo -e "${greC}[+] Contraseña:${endC}"
        cat $file_b | awk '{print $NF}'
        exit
    fi

    file_a=$file_b
done
