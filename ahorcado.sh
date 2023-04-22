#!/bin/bash

#Palabras creadas
palabras=("raton" "hormiga" "perro" "gato" "caballo" "elefante" "girafa" "tigre" "leon" "aguila")

# Elegir una palabra al azar
palabrarandom=$(( RANDOM % ${#palabras[@]} ))
palabra="${palabras[$palabrarandom]}"
largo=${#palabra}


adivinarpalabra=""
for (( i=0; i<$largo; i++ )); do
    adivinarpalabra+="_"
done

intentos_restantes=7
palabras_adivinadas=""

while [[ $adivinarpalabra != $palabra && $itentosrestantes -gt 0 ]]; do
    echo "Palabra a adivinar: $adivinarpalabra"
    echo "Letras ya intentadas: $palabras_adivinadas"
    echo "Intentos restantes: $itentosrestantes"
    read -p "Introduce una letra: " -n 1 -r
    echo

    if [[ $palabras_adivinadas == "$REPLY" ]]; then
        echo "Ya intentaste con esa letra, prueba otra."
        continue
    fi

    palabras_adivinadas+="$REPLY"

    if [[ $palabra == "$REPLY" ]]; then
        for (( i=0; i<$largo; i++ )); do
            if [[ ${palabra:$i:1} == $REPLY ]]; then
                adivinarpalabra="${adivinarpalabra:0:$i}$REPLY${adivinarpalabra:$((i+1))}"
            fi
        done
        echo "¡BIEN! vas por buen camino '$REPLY'."
    else
        itentosrestantes=$(( itentosrestantes - 1 ))
        echo "La letra '$REPLY' no está en la palabra, -1 vida."
    fi
    echo
done

if [[ $adivinarpalabra == $palabra ]]; then
    echo "¡WUUUUUUU! Adivinaste la palabra: $palabra"
else
    echo "chin :(, no adivinaste la palabra correcta era: $palabra"
fi
