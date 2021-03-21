#! /bin/bash

# Define el directorio principal que recibirá toda la estructura de direcotiros
dirPrincipal="directoriosEjercicio-1"

# Comprueba que se ha introducido un argumento
if $1
then
  echo "Error, debe introducir un argumento"
  echo "preferiblemente numérico."
  exit
fi

# Comprueba que existe el directorio sino lo crea y entra.
if [ -d $dirPrincipal ]
then
  # si existe borra su contenido y entra
  rm -fr $dirPrincipal
  mkdir $dirPrincipal
  cd $dirPrincipal
else
  # sino crealo y entra
  mkdir $dirPrincipal 
  cd $dirPrincipal
fi

# Primer for itera por cada línea (nombre) que encuentre en el fichero
for nombre in $(cat ../../recursos/nombres.txt)
do
  # Crea un directorio por cada nombre y entra en él
  mkdir $nombre && cd $nombre
  # Segundo for itera por el número de carpetas personales dado por el usuario
  for numero in `seq 1 $1`
  do
    # Crea el directorio personal con el número en donde se encuentra
    mkdir "directorioPerdonal-$numero"
  done
  # sale del directorio de usuario donde se encuentra para ir al sigueinte
  cd ..
  # Si si hay más nombres sigue con ellos sino termina 
done

# Una vez creada la estructura la muestra por pantalla
cd ..
tree "$dirPrincipal/"

