#!/bin/bash

greC="\e[0;32m\033[1m"
redC="\e[0;31m\033[1m"
bluC="\e[0;34m\033[1m"
yelC="\e[0;33m\033[1m"
purC="\e[0;35m\033[1m"
turC="\e[0;36m\033[1m"
graC="\e[0;37m\033[1m"
endC="\033[0m\e[0m"

function ctrl_c() {
  echo -e "\n${redC}[!] Saliendo...${endC}\n"
  exit 1
}

#Ctrol_c
trap ctrl_c INT

sleep 10
