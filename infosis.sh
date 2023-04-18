#!/bin/bash

echo "Información de la PC y kernel de ${username}:"
echo ""

echo "Distribución y versión:"
echo "-----------------------"
cat /etc/os-release | grep -e "^NAME=" -e "^VERSION="
echo ""

echo "Información de la CPU:"
echo "----------------------"
cat /proc/cpuinfo | grep -m 1 "model name"
echo "Arquitectura:"
cat /proc/version | grep -i --color 'x86_64'

echo "Memoria RAM:"
echo "-------------------------------"
lspci | grep -i --color 'RAM memory:'
cat /proc/meminfo | grep -i --color 'Memtotal:'
echo ""

