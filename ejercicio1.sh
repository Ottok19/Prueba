#!/bin/bash

# Este programa tiene la función de recibir el ID de un proceso y brindarle al usuario información de dicho proceso

# Primero se le solicita al usuario que ingrese el ID del proceso cuya información desea conocer.
# Después se comprueba si ese proceso existe o no, y de existir se brinda la información.

echo "Hola, por favor ingrese el ID del proceso del cual desea conocer la información"

read IDProceso

# Para comprobar si el proceso existe, se busca si existe un directorio con el ID brindado en /proc
# Se crean variables para las distintas informaciones, obteniendolas con el comando ps mediante
# El número de ID del proceso.


if [ -d "/proc/$IDProceso" ]; then
	
	Nombre_Proceso=$(ps -p $IDProceso -o comm=)
	PPID_Proceso=$(ps -p $IDProceso -o ppid=)
	User_Proceso=$(ps -p $IDProceso -o user=)
	CPU_Proceso=$(ps -p $IDProceso -o pcpu=)
	MEM_Proceso=$(ps -p $IDProceso -o pmem=)
	STAT_Proceso=$(ps -p $IDProceso -o stat=)
	PATH_Proceso=$(ps -p $IDProceso -o cmd=)
	echo "-----------------------------------------------------"
	echo "La información del proceso $IDProceso es la siguiente"
	echo "Nombre del proceso: $Nombre_Proceso"
	echo "ID del proceso:     $IDProceso"
	echo "PPID del proceso:   $PPID_Proceso"
	echo "Usuario propietario del proceso: $User_Proceso"
	echo "Consumo de CPU: $CPU_Proceso"
	echo "Consumo de memoria: $MEM_Proceso"
	echo "Estado del proceso: $STAT_Proceso"
	echo "Path del proceso: $PATH_Proceso"
else
	echo "No existe el proceso $IDProceso"
fi

