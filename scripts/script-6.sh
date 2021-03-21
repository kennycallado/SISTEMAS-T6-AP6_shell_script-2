#! /bin/bash

# Declaración de variables
answer="n"  # Respuesta al read. Por defecto no
random=0    # Variable recoge número aleatorio si es necesario
contFi=0    # Cuanta los ficheros eliminados

# Comprueba que se ha introducido un argumento
if [ -z $1 ]
then
  echo "Error, debe introducir nombre directorio"
  echo "pude introducir un nombre aunque no exista"
  echo "se puede crear virtualmente."
  exit
fi


# Comprueba si existe el directorio que ha introducido
if [ ! -d $1 ]
then
  # Si no existe, pregunta si quiere crearlo virtualmente
  echo "El directorio no existe"
  echo "--------------"
  echo "¿Quiere crear un directorio virtual que se borrará al final del ejercicio?"
  read -p "s/n: " answer
fi

if [ $answer == 's' ]
then
  # Genera un número de ficheros aleatorio
  random=$(($RANDOM%20))
  # Crea el directorio
  mkdir $1
  # Crea el número aleatorio de ficheros
  for i in `seq 1 $random`
  do
    touch $1/fichero-$i.txt
  done
fi

# Vuelve a comprobar que el direcotiro existe
if [ -d $1 ]
then
  # Entra en el directorio
  cd $1
  # Recorre todos los ficheros del directorio
  for i in `ls -1`
  do
    # Si la extensión del archivo es txt
    if [ "txt" == "${i##*.}" ]
    then
      contFi=`expr $contFi + 1`
      # Borra el archivo
      echo "Se borra fichero: $i"
      rm $i
    fi
  done
  # Vuelve al directorio padre
  cd ..
fi

# Si la respuesta fué 'sí', borra el directorio
if [ $answer == 's' ]
then
  rm -fr $1
fi

# Muenstra mensaje final
echo "Se han eliminado: $contFi"
