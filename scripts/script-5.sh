#! /bin/bash

# Declaración de variables
maxlineas=`cat ../recursos/listado.txt | wc -l` # n línea
iterador=1 # Iterador para el bucle

temp1=0 # Variable temporal 1
temp2=0 # Variable temproal 2

usuLinux=0 # Número de usuarios línux
usuWindo=0 # Número de usuarios Windows
proLinux=0 # Número de procesos linux
proWindo=0 # Número de procesos Windows

# Iteramos por el fichero con un while 
while [ $iterador -le $maxlineas ]
do
  # Obtenemos valores de la línea
  linea=`cat ../recursos/listado.txt | head -$iterador | tail -1`

  # Guarda en una variable temporal el OS del usuario
  temp1=`echo "$linea" | awk '{print $2}'`

  if [ $temp1 == "Linux" ]
  then
    # Incrementa en uno el número de usuarios de linux
    usuLinux=`expr $usuLinux + 1`

    # Guarda en una variable temporal el número de procesos del usuario
    temp2=`echo "$linea" | awk '{print $3}'`

    # Guarda el número de procesos donde corresponde
    proLinux=`expr $proLinux + $temp2`
  else
    # Incrementa en uno el número de usuarios de windows
    usuWindo=`expr $usuWindo + 1`

    # Guarda en una variable temporal el número de procesos del usuario
    temp2=`echo "$linea" | awk '{print $3}'`

    # Guarda el número de procesos donde corresponde
    proWindo=`expr $proWindo + $temp2`
  fi
  # Incrementamos la línea
  iterador=$(($iterador + 1))
done

echo "Usuarios linux:   $usuLinux -> $usuWindo"
echo "Usuarios Windows: $proLinux -> $proWindo"


