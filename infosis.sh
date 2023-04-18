#!/bin/bash

echo "Información de la PC y kernel de ${username}:"
echo ""

echo "Distribución y versión:"
echo "-----------------------"
cat /etc/os-release | grep -e "^NAME=" -e "^VERSION="
echo ""

echo "Información de la CPU:"
echo "----------------------"
lscpu | grep -e "Nombre del modelo:" -e "Arquitectura:" -e "CPU(s):" -e "CPU MHz máx.:"
echo ""

echo "Memoria RAM:"
echo "-------------------------------"
lspci | grep -i --color 'RAM memory:'
free -h
echo ""

