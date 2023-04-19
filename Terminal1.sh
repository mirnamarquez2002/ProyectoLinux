#!/bin/bash

echo "Bienvenido al proyecto de Mirna y Hugo."

printf "      HOLA BIENVENID@ A NUESTRA TERMINAL   \n"
printf "                MIRNA & HUGO               \n"
printf "                    _.._                   \n"
printf "                 .-'    `-.                \n"
printf "                .          .               \n"
printf "                . ,_    _, .              \n"
printf "                : \."  "./ :               \n"
printf "               ,'.'"=..=''.'.              \n"
printf "              ; / \      / \ ;             \n"   
printf "           .' ;   '.__.'   ; '.           \n"
printf "\t      .-' .'              '. '-.         \n"
printf "\t    .'   ;                  ;   '.       \n"
printf "\t   /    /                    \    \      \n"
printf "\t  ;    ;                      ;    ;     \n"
printf "\t  ;   `-._                  _.-'   ;     \n"
printf "\t  ;      ""--.        .--""      ;       \n"
printf "\t   '.    _    ;      ;    _    .'        \n"
printf "\t   {""..' '._.-.    .-._.' '..""}        \n"
printf "\t    \           ;  ;           /         \n"
printf "\t     :         :    :         :          \n"
printf "\t     :         :.__.:         :          \n"
printf "\t      \       /"-..-"\       /           \n"
printf "\n\t       '-.__.'        '.__.-'          \n"

printf "\n  Para salir escribe la palabra "salir   \n"


while true; do
    read -p "Por favor, ingrese su nombre de usuario: " username
    read -sp "Ingrese su contraseña: " password
    # Verifica si el usuario y la contraseña son válidos en el sistema operativo anfitrión
    if id -u "${username}" >/dev/null 2>&1 && echo "${password}" | su - "${username}" -c 'exit' 2>/dev/null; then
        echo "Acceso concedido. Bienvenido ${username}"
        su - "${username}" # Cambiar al usuario ingresado
        break
    else
        echo "Acceso denegado. Por favor, intente de nuevo."
    fi
done


    # Salir si el usuario escribe "salir"
    if [[ "$command" == "salir" ]]; then


printf "                   ADIÓS                   \n"
printf "                MIRNA & HUGO               \n"
printf "\t                  _.._                   \n"
printf "\t               .-'    `-.                \n"
printf "\t              :          ;               \n"
printf "\t              ; ,_    _, ;               \n"
printf "\t              : \{"  "}/ :               \n"
printf "\t             ,'.'"=..=''.'.              \n"
printf "\t            ; / \      / \ ;             \n"   
printf "\t          .' ;   '.__.'   ; '.           \n"
printf "\t      .-' .'              '. '-.         \n"
printf "\t    .'   ;                  ;   '.       \n"
printf "\t   /    /                    \    \      \n"
printf "\t  ;    ;                      ;    ;     \n"
printf "\t  ;   `-._                  _.-'   ;     \n"
printf "\t  ;      ""--.        .--""      ;       \n"
printf "\t   '.    _    ;      ;    _    .'        \n"
printf "\t   {""..' '._.-.    .-._.' '..""}        \n"
printf "\t    \           ;  ;           /         \n"
printf "\t     :         :    :         :          \n"
printf "\t     :         :.__.:         :          \n"
printf "\t      \       /"-..-"\       /           \n"
printf "\n\t       '-.__.'        '.__.-'          \n"

        exit 0
    fi

    # Ejecutar el comando ingresado
    output=$(eval "$command" 2>&1)

    # Mostrar la salida del comando
    echo "$output"

    if [[ "$command" == "juego" ]]; then
        sh juegogato.sh
    fi
done
else
	printf "\n\n Usuario incorrecto\n\n"
fi