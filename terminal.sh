#!/bin/bash

# ==-==-==-==-> Solamente son colores
R='\033[1;31m' # Rojo
G='\033[1;32m' # Verde
Y='\033[1;33m' # Amarillo
B='\033[1;34m' # Azul
M='\033[1;35m' # Mangenta
W='\033[0m' # Blanco
Glig='\e[1;32m' # Verde claro

#Para no salirse

ignore_signal() {
    printf "Se ha detectado la señal $1. No se permite salir. Usa el comando 'salir' para cerrar la terminal.\n"
}

# Configurar la función ctrl + c/z
trap 'ignore_signal SIGINT' SIGINT
trap 'ignore_signal SIGTSTP' SIGTSTP

# Sistema de acceso para los usuarios
# ==-==-==-==-==-==-==-==-==-==-==-==-
clear

printf "\t  _____              _           _   ___ ___ ___ ___ ___ \n"
printf "\t |_   _|__ _ _ _ __ (_)_ _  __ _| | | _ \ _ \ __| _ ) __|\n"
printf "\t   | |/ -_) '_| '  \| | ' \/ _' | | |  _/   / _|| _ \ _| \n"
printf "\t   |_|\___|_| |_|_|_|_|_||_\__,_|_| |_| |_|_\___|___/___|\n"
printf "\n\t\t\tI n i c i o   d e   s e s i ó n\n"

# ==-==-==-==-> Solicitud de datos (interacion con el usuario)
# solicitar el nombre de usuario y la contraseña


while true; do
	printf "$G\n\t\t\t\tUsuario: $W"
    read -p "" username
    read -sp "Ingrese su contraseña: " password
    # Verifica si el usuario y la contraseña son válidos en el sistema operativo anfitrión
    if id -u "${username}" >/dev/null 2>&1 && echo "${password}" | su - "${username}" -c 'exit' 2>/dev/null; then
        echo -e "${B}Acceso concedido. Bienvenido ${username}${W}"
        break
    else
        printf "\n\n$R Usuario o contraseña incorrectos. Intente nuevamente.$W\n\n"
    fi
done

while true; do
    # Leer la entrada del usuario
    printf "${M}${username}${W}:${G}$(pwd)${W} # "; read command
    case $command in
    salir)
    exec ./salir.sh
    break
    ;;
    ayuda)
    ./ayuda.sh
    ;;
    infosis)
    ./infosis.sh
    ;;
    infodia)
    ./infodia.sh
    ;;
    MP3)
    ./MP3.sh
    ;;
    buscar)
    ./buscar.sh
    ;;
    creditos)
    ./creditos.sh
    ;;
    gato)
    ./gato.sh
    ;;
    ahorcado)
    ./ahorcado.sh
    ;;
    *)
    if command "$command" >/dev/null 2>&1; then
                "$command"
       else 
    printf "El comando $R$command$W no existe. Utiliza ayuda para verificar los comandos disponibles.\n"
    fi
    ;;
    esac
done 
