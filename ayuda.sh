#!/bin/bash
rojo="\033[31m"
verde="\033[32m"
azul="\033[34m"
reset_color="\033[0m"

echo -e "${rojo}Los comandos disponibles son:"
echo -e "${azul}ayuda${reset_color}: Proporciona información acerca de los comandos disponibles" 
echo -e "${azul}infosis${reset_color}: Proporciona información del sistema" 
echo -e "${azul}infodia${reset_color}: Proporciona la fecha y hora actuales"
echo -e "${azul}busca${reset_color}: Busca un archivo en un directorio específico"
echo -e "${azul}jugar${reset_color}: Ejecuta el juego del sistema"
echo -e "${azul}creditos${reset_color}: Muestra los créditos del programa"
echo -e "${azul}MP3${reset_color}: Abrirá un reproductor de mp3"
