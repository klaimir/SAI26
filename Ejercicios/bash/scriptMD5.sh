#!/bin/bash

# Comprobamos que haya introducido dos argumentos exactos 
if [ $# -ne 2 ]; then
	echo "Uso: $0 archivo hash_md5"
	exit 1
fi

# Comprobamos que el primer argumento sea un archivo existente
if [ ! -f $1 ]; then
	echo "Error: El primer argumento no es un archivo"
	exit 1
fi

# valor hash MD5 previamente almacenado en una variable
hash_previo=$2

# Muestro el valor del hash MD5 para poder ponerlo
md5=$(md5sum $1)
echo "MD5: $md5"

# Calcular el valor hash MD5 del archivo ingresado
md5sum $1 | awk '{print $1}'
hash_archivo=$(md5sum $1 | awk '{print $1}')

# Comparar el valor hash del archivo con el valor del hash previo
if [ "$hash_archivo" = "$hash_previo" ]; then
	echo "Es el archivo original"
	exit 0
else
	echo "No es el archivo original"
	exit 2
fi
