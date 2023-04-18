#!/bin/bash
rojo="\033[31m"
verde="\033[32m"
azul="\033[34m"
amarillo="\033[33m"
sincolor="\033[0m"

echo -e "${rojo}Información de la PC y kernel de ${username}:"
echo ""

echo -e "${rojo}Distribución y versión:${sincolor}"
echo "-----------------------"
cat /etc/os-release | grep -e "^NAME=" -e "^VERSION="

echo -e "${rojo}Información de la CPU:${sincolor}"
echo "----------------------"
cat /proc/cpuinfo | grep -m 1 "model name"
echo -e "${rojo}Arquitectura del sistema:${sincolor} $(uname -m)"

echo -e "${rojo}Memoria RAM:${sincolor}"
echo "-------------------------------"
lspci | grep -i --color 'RAM memory:'
echo -e "${amarillo}Memoria total:${sincolor} $(cat /proc/meminfo | grep -i "Memtotal:" | grep '[1-9].*' -o)"
echo -e "${azul}Memoria Libre:${sincolor} $(cat /proc/meminfo | grep -i "Memfree:" | grep '[1-9].*' -o)"
