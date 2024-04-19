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

path_backup=(
	"/home/havel/Backup"
)
paths=(
	"/home/havel"
	"/home/havel/Data_nvim"
)
files=(
	".bashrc"
	"init.vim"
)

for file in "${files[@]}"; do
	if [ ! -f "$path_backup/B_$file" ]; then
		for path in "${paths[@]}"; do
			if cp "$path/$file" "$path_backup/B_$file" 2>/dev/null; then
				echo -e "\n${yelC}[?] Archivo $file inexistente.${endC}"
				sleep 2
				echo -e "\n${greC}[+] Archivo $file copiado.${endC}"
				break
			fi
		done

	elif [ -f "$path_backup/B_$file" ]; then
		for path in "${paths[@]}"; do
			if [ -f "$path/$file" ]; then
				var1="$(md5sum "$path/$file" | awk '{print $1}')"
				var2="$(md5sum "$path_backup/B_$file" | awk '{print $1}')"
				if [ "$var1" != "$var2" ]; then
					echo -e "\n${redC}[!] Archivo $file modificado.${endC}"
					cat "$path/$file" >"$path_backup/B_$file" 2>/dev/null
					sleep 2
					echo -e "\n${greC}[+] Archivo $file actualizado.${endC}"
				else
					echo -e "\n${greC}[+] Archivo $file sin cambios.${endC}"
				fi
				break
			fi
		done
	else
		echo -e "\n${redC}[!] ERROR.${endC}"
	fi

done
