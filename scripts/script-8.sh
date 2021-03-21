#! /bin/bash

# Obtiene la parte de la ip a escepción de los últimos dígitos
inicio=`ip a show wlo1 | grep 'inet ' | awk '{print $2}' | sed 's/\([/*^]\)/\ /' | awk '{split($1,p,"."); $1=p[1]"."p[2]"."p[3]"."; print $1}'`

# Empiezo por el 1 ya que el 0 y 255 es el boradcast y no respondería nadie
for i in {1..254}
do
  # Por cada ping que se ha recibido muestra por pantall un mensaje
  if [[ `ping -c 1 -w 1 $inicio$i | grep '1 received'` ]]
  then
    echo "$inicio$i - host encontrado."
  fi
done
