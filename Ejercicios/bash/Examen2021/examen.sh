#!/bin/bash

# Hacemos el menú
function mostrarMenu() {
	echo "MENÚ"
	echo "1 - Generar login de usuarios"
	echo "2 - Comprobación de red"
	echo "0 - Salir"
}

# Procesamos acción generarLogin
function generarLogin() {
	fichero=$(cat fichero.txt)
	fichLogin="loginServ.txt"
	touch $fichLogin
	for fila in $fichero; do
		apellido1=$(echo $fila | cut -d: -f1 | cut -c1-3)
		apellido2=$(echo $fila | cut -d: -f2 | cut -c1-3)
		nombre=$(echo $fila | cut -d: -f3 | cut -c1)
		numDNI=$(echo $fila | cut -d: -f4 | cut -c6-8)
	        login=$(echo "$nombre$apellido1$apellido2$numDNI" | tr 'A-Z' 'a-z')
		echo $login >> $fichLogin
	done
}

# Procesamos acción comprobarRed
function comprobarRed() {
        read -p "Introduzca una ip:" ip
	read -p "Introduzca un número:" num
	primerOcteto=$(echo $ip | cut -d. -f1)
	segundoOcteto=$(echo $ip | cut -d. -f2)
	tercerOcteto=$(echo $ip | cut -d. -f3)
	cuartoOcteto=$(echo $ip | cut -d. -f4)
	limite=$((cuartoOcteto+num))
	for((c=cuartoOcteto; c<limite; c++)); do
		ipPing="$primerOcteto.$segundoOcteto.$tercerOcteto.$c"
		resultadoPing=$(ping -c1 $ipPing | grep "1 received")
		if [ -n "$resultadoPing" ]; then
			echo "$ipPing está activa"
		else
			echo "$ipPing no está activa"
		fi
	done
}

# Procesamos acción de menú
function procesarAccion() {
	case $1 in
		1) generarLogin ;;
		2) comprobarRed ;;
		0) return 0 ;;
		*) echo "Ha introducido una opción incorrecta"
		sleep 2
		clear;;
	esac
}

# Leemos opción de menú
opcion=""
while [ "$opcion" != "0" ]; do
	mostrarMenu
	read -p "Elija su opción:" opcion
	procesarAccion $opcion
done


