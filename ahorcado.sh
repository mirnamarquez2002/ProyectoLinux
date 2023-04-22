#!/bin/bash

 '
     _____
    |   \|
    |    |
    |    |
         |
         |
 ________|____
 
 
    _____
    |   \|
    |    |
    0    | ERROR. Esa letra no es correcta
         |
         |
 ________|____
 
    
    _____
    |   \|
    |    |
    0    |
    |    | ERROR 2. Esa letra no es correcta
         |
 ________|____
 
 
    _____
    |   \|
    |    |
    0    |
   /|\    | ERROR 3. Ya tienes tres errores, ya tienes casi la mitad del cuerpo ¡¡CUIDADO!!
         |
 ________|____
 
 
    _____
    |   \|
    |    |
    0    |
   /|\   |
   /     | ERROR 4. Te queda una oprtunidad más, TÚ PUEDES VAMOS, salva a Panchito
 ________|____
 
 
    _____
    |   \|
    |    |
    0    |
   /|\   |
   / \   | ERROR 5. No te tocaba carnal, PERDISTE 
 ________|____
 '
 
 clear
 echo -n "¿QUE PALABRA VAMOS A ADIVINAR?: "
 read word
 echo
# echo "Pulsa enter para continuar..."
# read continuar
 clear
 letra="*"   
 
 fallos=5 
 
 letras=`echo $word | sed "s/[^${letra}]/*"/g` 
 
 sust=$letras
 
 while [ "$sust" != "$word" ]      
 
       do
 #        clear
 	  echo
          echo "LAS LETRAS SON $sust"
          echo
          sed -n "$fallos,$((fallos+7))p" $0
 	  echo 
 	  echo LETRAS INTRODUCIDAS HASTA AHORA: $a
 	  echo 	
 	  echo -n "INTRODUCE UNA LETRA: "
          read letra
 	  a=${a}$letra
 	  palabra=${letra}$palabra   
 			
          echo
          existe=`echo ${word} | grep ${letra}` 
 
               if [ "$existe" = "" ]
                  then
 	             echo "Esa letra no es correcta, la letra - ${letra} - no es parte de la palabra"
 		     error=$((error + 1))
                     if [ $error = 5 ]
                        then
 #	                   clear
 		 	   fallos=$(($fallos+9))
 			   sed -n "$fallos,$((fallos+7))p" $0
 			   echo "Has cometido $error errores, RIP"
                           echo
			   echo	
			   exit
                        else
                           if [ $error = 1 ]
                              then
                                 echo "Has cometido $error errores"
 			         fallos=$(($fallos+9))
                              else
 			         fallos=$(($fallos+9))		
                           fi
                     fi
 
 		  else
                     sust=`echo $word | sed "s/[^${palabra}]/*"/g` 
               fi
 
                  if [ "${sust}" = "${word}" ] 
                     then
                        echo "¡¡¡FELICIDADES!!! HAS DESCUBIERTO LA PALABRA SECRETA QUE ERA: ${word}."
                	echo
 			echo	
                  fi
 
       done
