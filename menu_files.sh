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

function f_execut() {
	bash /home/havel/Backup/files.sh
}
function f_commit() {
	path="$(dirname "$0")"
	cd $path
	a_commit=$1

	git add .
	git commit -m "${a_commit}"
	git push -u origin main
}
function f_remove() {
	path="$(dirname "$0")"
	cd $path
	rm -r B* && ls
}
function f_automatic() {
	path="$(dirname "$0")"
	cd $path

	bash /home/havel/Backup/files.sh

	fecha="$(date +'%D %T')"
	git add .
	git commit -m "Automatico: ${fecha}"
	git push -u origin main
}

function f_help_panel() {
	echo -e "\n${yelC}[+] Comandos:${endC}\n"
	echo -e "\t -e Ejecutar files.sh."
	echo -e "\t -c Aplicar commit en files.sh."
	echo -e "\t -r Remover los archivos de files.sh."
	echo -e "\t -h Panel de ayuda."

}

declare -i commit=0
declare -i automatic=0
declare -i execut=0
declare -i remove=0

while getopts "c:reha" arg; do
	case $arg in
	c)
		a_commit="$OPTARG"
		let commit+=1
		;;
	e)
		let execut+=1
		;;
	r)
		let remove+=1
		;;
	a)
		let automatic+=1
		;;
	h) ;;
	esac
done

if [ "$commit" -eq 1 ]; then
	f_commit "$a_commit"
elif [ "$automatic" -eq 1 ]; then
	f_automatic
elif [ "$execut" -eq 1 ]; then
	f_execut
elif [ "$remove" -eq 1 ]; then
	f_remove
else
	f_help_panel
fi
