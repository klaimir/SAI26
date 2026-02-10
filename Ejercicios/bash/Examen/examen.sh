#!/bin/bash

# Controlar número parámetros está entre 1 y 4 
if [[ $# -eq 0 || $# -gt 4 ]]; then
	echo "Error número de parámetros:"
	echo "Debe estar entre 1 y 4"
	exit 1
fi

# Comprobar que algún directorio no lo es
for directorio in $*; do
	if [ ! -d "$directorio" ]; then
		echo "Error parametros"
		echo "El directorio $directorio no existe en este lugar"
		exit 1
	fi
done

# Función para procesar cada directorio
procesarDirectorio() {
        # Si no tiene ficheros no se procesa
	salidaLsDirectorio=$(ls $1)
	if [ -n "$salidaLsDirectorio" ]; then
        	echo "Procesando directorio: $1"
		echo "-----------------------------"
		# Sólo se procesan aquellos ficheros con alguna mayúscula (grep?)

		# Hay que coger de los ficheros que tienen mayúsculas
		salidaGrepFichero=$(ls $1 | grep '[A-Z]')
		for fichero in $salidaGrepFichero; do
			# Comprobar que son ficheros
			if [ -f $1/$fichero ]; then
				# Convertir a minúsculas
				ficheroMin=$(echo $fichero | tr 'A-Z' 'a-z')
				# Movemos realmente el fichero
				mv $1/$fichero $1/$ficheroMin
				# Mostramos mensaje
                        	echo "--- $fichero ha sido renombrado como $ficheroMin"
			fi
		done
	fi
}

# Procesar directorios (uso de funciones)
for directorio in $*; do
	procesarDirectorio $directorio
done
