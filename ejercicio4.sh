#!/bin/bash

# Este script inicia un monitor sobre el directorio pruebas, y los cambios realizados los escribe en un
# Archivo de texto

inotifywait -m -e modify /home/otto/pruebas >> texto.txt &







