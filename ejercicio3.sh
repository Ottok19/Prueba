#!/bin/bash

# El programa monitorea un proceso y almacena los datos de consumo de CPU y RAM en un archivo .log, a partir
# Del cual utilizando gnuplot se pueden graficar dichos consumos. 

# Se extrae el ID Del proceso asi como los datos de consumo de CPU y RAM

PID_Proceso=$(pgrep -x $1)
CPU_Proceso=$(ps -p $PID_Proceso -o pcpu=)
MEM_Proceso=$(ps -p $PID_Proceso -o pmem=)
date=$(date +"%T")

# Se crean varios condicionales para ver primero si el proceso existe, después para reinicar el archivo donde se
# Almacenan los datos, y para contabilizar los datos.

if [ $PID_Proceso -ne 0 2> /dev/null ]; then

	if [ -e "datos.log" ]; then
	       rm datos.log
	fi       
	
	echo "Si desea monitorear los consumos, presione la tecla a"
	read Tecla
	if [ $Tecla == "a" ]; then
		echo "Ingrese el numéro de medidas que desea tomar" 
		read Medidas
	fi
	contador=0
        while [ $Tecla == "a" -a $contador -lt $Medidas ]; do       
		echo $CPU_Proceso >> datos.log $MEM_Proceso >> datos.log $date >> datos.log
		contador=$(( $contador+1 ))
	done
else
	echo "El proceso no existe"

fi






