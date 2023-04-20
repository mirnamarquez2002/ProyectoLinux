#!/bin/bash
# ==-==-==-==-> Solamente son colores
R='\033[1;31m' # Rojo
G='\033[1;32m' # Verde
Y='\033[1;33m' # Amarillo
B='\033[1;34m' # Azul
M='\033[1;35m' # Mangenta
W='\033[0m' # Blanco
Glig='\e[1;32m' # Verde claro
#Pide los parametros

printf "${Glig}Ingrese la ruta absoluta del archivo${W}:"

read -r directorio

printf "${Glig}Ingrese el nombre del archivo con su extensión${W}:"

read -r archivo

cd $directorio


# Realiza la búsqueda del archivo en el directorio especificado
resultado=$(find -type f -name "$archivo")

if [ -n "$resultado" ]; then
    printf "Archivo encontrado: $R $resultado ${W} en ${M} $directorio ${W}\n"
else
    printf "Archivo ${R}'$archivo'${W} no encontrado en el directorio ${M}'$directorio'${W}\n"
fi

