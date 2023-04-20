#! /bin/bash

iniciarjuego()
{
    echo "====================================================="
    echo "| |              JUEGO DE GATO PADRE              | |"
    echo "| |                      :)                       | |"
    echo "| |                 (2 jugadores)                 | |"
    echo "====================================================="
    echo ""
    echo "Preparando el juego...."
    echo ""
    jugadorgato=1
    tablero=(- - - - - - - - -)
    ganador=1
    echo "*****************************************************"
    echo "| |                                               | |"
    echo "| |          ¡¡¡INICIA EL JUEGO!!!                | |"
    echo "| |                                               | |"
    echo "*****************************************************"
}

imprimirtablero()
{
    echo "Rows\Columns   0   1   2 "
    echo ""
    echo "             -------------"
    echo "    0        | ${tablero[0]} | ${tablero[1]} | ${tablero[2]} |"
    echo "             -------------"
    echo "    1        | ${tablero[3]} | ${tablero[4]} | ${tablero[5]} |"
    echo "             -------------"
    echo "    2        | ${tablero[6]} | ${tablero[7]} | ${tablero[8]} |"
    echo "             -------------"   
}

setInput()
{
   lugares=$(( $1 * 3 + $2 ))
   if [ ${tablero[$lugares]} == "-" ]
   then 
      tablero[$lugares]=$3
      jugadorgato=$((jugadorgato%2+1))
   else
      echo -e "\n--CUIDADO-- ESTE LUGAR YA ESTÁ OCUPADO"
      echo -e "Intenta otra vez!!!!"
   fi
}

checarganador()
{
   simbolos 0 1 2
   simbolos 3 4 5
   simbolos 6 7 8
   simbolos 0 4 8
   simbolos 2 4 6
   simbolos 0 3 6
   simbolos 1 4 7
   simbolos 2 5 8
}

simbolos()
{
   if [ ${tablero[$1]} != "-" ]&&[ ${tablero[$1]} == ${tablero[$2]} ]&&[ ${tablero[$2]} == ${tablero[$3]} ]
   then 
	ganador=0
   fi
}

iniciarjuego
while true
do
	echo ""
	if [ $jugadorgato == 1 ]
  	  then 
  	     symbol=X
  	  else
  	     symbol=O
  	  fi
  	  
	  echo "Jugador $jugadorgato es tu turno: ($symbol)"
          echo ""
	       imprimirtablero
          echo ""
	  echo "#####################################################"
          echo "||                                                 ||"
          echo "||                Inserta la letra :               ||"
          echo "||            A. para jugar(fila) (columna)        ||"
          echo "||            B. Reset                             ||"
          echo "||                                                 ||"
          echo "#####################################################"
          echo ""
   
          while true
          do
            read -r inputCommand a b
            if [ $inputCommand == "jugar" ]
            then 
 		setInput $a $b $symbol
                break
            elif [ $inputCommand == "reset" ]
            then 
                iniciarjuego
                break
            else
	        echo ""
                echo "Comando no disponible, intenta otra vez"
	    fi
          done
   
	  checarganador
	  
          if [ $ganador != 1 ]
	  then
	      jugadorgato=$((jugadorgato%2+1))
	      imprimirtablero
	      echo "=====================================================" 
	      echo "| |                                               | |"
              echo "| |           FIN DE LA PARTIDA               | |"
              echo "| |    jugador $jugadorgato ($symbol) gana     | |"
	      echo "| |                                               | |"
	      echo "====================================================="
	      echo ""
              echo "Escribe la palabra \"reset\" para reinciar el juego" 
     	      read -r inputCommand n
	      while true 
	      do
           	 if [ $inputCommand == "reset" ]
		 then 
                    iniciarjuego
		    break
		 fi   
	      done
	 fi	
done
