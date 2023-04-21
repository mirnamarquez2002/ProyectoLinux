#!/bin/bash

 echo "====================================================="
    echo "| |              JUEGO DE AHORCADO                | |"
    echo "| |          Elige una opcion del 1 al 4          | |"
    echo "| |              TIENES 5 INTENTOS                | |"
    echo "====================================================="

pa=$((( $RANDOM%4 ) + 1 ))
case $pa in
1)op="Otorrinolaringologo"
echo "Doctor que se encarga de las enfermedades del oído"
;;
2)op="Calidoscopio"
echo "Instrumento óptico donde puedes ver figuras en su interior"
;;
3)op="Paralepipedo"
echo "Poliedro de 6 caras"
;;
4)op="Mejor jugador de futbol"
echo "Messi"
;;
esac
k="${op:0:1}"
x=${#op}

for n in $(seq 2 1 $x)
do
    k=$k" _"
done
echo ""
echo "$k"
intentos=5

while [ "$xd" != "$op" ] && [ "$intentos" != "0" ]
do
echo "Te quedan $intentos intentos"
let intentos--
echo "$k"
read -r xd
done
if [ "$intentos" = "0" ]
then
	echo -e "Perdiste :("
else
	echo -e "¡¡¡¡GANASTE WUUUUUUU!!! :)"
fi
