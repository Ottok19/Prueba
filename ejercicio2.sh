#!/bin/bash

# Este programa tiene la función de recibir un proceso y su respectivo comando de ejecución, y en caso de que
# El proceso se cierre, volverlo a ejecutar automaticamente.

# Se consigue el ID del proceso utilizando el comando pgrep

PID_Proceso=$(pgrep -x $1)

# Si el proceso ya existe, se le indica al usuario y se le indica su respectivo estado.
# Si el proceso no existe, se le indica al usuario si desea ejecuatrlo y cuando el proceso termina
# Se le indica al usuario si desea repetir su ejecución o no.

if [ $PID_Proceso -ne 0 2> /dev/null ]; then
	STAT=$(ps -p $PID_Proceso -o stat=)
	echo "El proceso ya existe, y su estado es $STAT"
else
	echo "El proceso no existe, si desea iniciarlo ingrese la tecla a"
	read Tecla
	while [ $Tecla == "a" ]; do
		$2 $1
		echo "El proceso termino, ingrese la tecla a para ejecutarlo de nuevo, o cualquier otra para salir"
		read Tecla	
	done
fi


	

