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

# Path of backup
path_backup=(
	"/home/havel/Backup"
)
#-------------------------------
# Directories
directories=(
	"Obsidian"
	"S4vitar"
)
paths_of_directories=(
	"/home/havel/Documentos/Cofre"
	"/home/havel/Data/Scripts/Python"
)
#-------------------------------
# Files
files=(
	".bashrc"
	"init.vim"
)
paths_of_files=(
	"/home/havel"
	"/home/havel/Data_nvim"
)

for file in "${files[@]}"; do
	if [ ! -f "${path_backup}/B_${file}" ]; then
		for path in "${paths_of_files[@]}"; do
			if cp "${path}/${file}" "${path_backup}/B_${file}" 2>/dev/null; then
				echo -e "\n${yelC}[?] Archivo${endC} ${graC}B_${file}${endC} ${yelC}inexistente.${endC}"
				echo -e "\n${greC}[+] Archivo${endC} ${graC}${file}${endC} ${greC}copiado.${endC}"
				break
			fi
		done

	elif [ -f "${path_backup}/B_${file}" ]; then
		for path in "${paths_of_files[@]}"; do
			if [ -f "${path}/${file}" ]; then
				var1="$(md5sum "${path}/${file}" | awk '{print $1}')"
				var2="$(md5sum "${path_backup}/B_${file}" | awk '{print $1}')"
				if [ "${var1}" != "${var2}" ]; then
					echo -e "\n${redC}[!] Archivo${endC} ${graC}${file}${endC} ${redC}modificado.${endC}"
					cat "${path}/${file}" >"${path_backup}/B_${file}" 2>/dev/null
					echo -e "\n${greC}[+] Archivo${endC} ${graC}B_${file}${endC} ${greC}actualizado.${endC}"
				else
					echo -e "\n${greC}[+] Archivo${endC} ${graC}${file}${endC} ${greC}sin cambios.${endC}"
				fi
				break
			fi
		done
	else
		echo -e "\n${redC}[!] ERROR.${endC}"
	fi
done

for directory in "${directories[@]}"; do
	if [ ! -d "${path_backup}/B_${directory}" ]; then
		for path in "${paths_of_directories[@]}"; do
			if cp -r "${path}/${directory}" "${path_backup}/B_${directory}" 2>/dev/null; then
				echo -e "\n${yelC}[?] Directorio${endC} ${graC}B_${directory}${endC} ${yelC}inexistente.${endC}"
				echo -e "\n${greC}[+] Directorio${endC} ${graC}${directory}${endC} ${greC}copiado.${endC}"
				break
			fi
		done

	elif [ -d "${path_backup}/B_${directory}" ]; then
		for path in "${paths_of_directories[@]}"; do
			if [ -d "${path}/${directory}" ]; then
				md5deep -r "${path}"/${directory} | awk '{print $1}' | sort >original
				md5deep -r "${path_backup}/B_${directory}" | awk '{print $1}' | sort >copia

				var1="$(cat original)"
				var2="$(cat copia)"

				if [ "${var1}" != "${var2}" ]; then
					echo -e "\n${redC}[!] Directorio${endC} ${graC}${directory}${endC} ${redC}modificado.${endC}"
					rm -r "${path_backup}/B_${directory}"
					cp -r "${path}/${directory}" "${path_backup}/B_${directory}" 2>/dev/null && rm original copia
					echo -e "\n${greC}[+] Directorio${endC} ${graC}B_${directory}${endC} ${greC}actualizado.${endC}"
				else
					echo -e "\n${greC}[+] Directorio${endC} ${graC}${directory}${endC} ${greC}sin cambios.${endC}" && rm original copia
				fi
				break
			fi
		done
	else
		echo -e "\n${redC}[!] ERROR.${endC}"
	fi
done
