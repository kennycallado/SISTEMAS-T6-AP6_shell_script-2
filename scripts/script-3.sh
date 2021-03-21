#! /bin/bash

# Declaración de variables de la aplicación
dias=(      # Array que contiene los días de la semana
  "Lunes"
  "Martes"
  "Miercoles"
  "Jueves"
  "Viernes"
  "Sábado"
  "Domingo"
)
maxlineas=`cat ../recursos/precipitaciones.txt | wc -l` # total de línea del fichero
linea=1   # línea en la que empezamos
arraySize=${#dias[@]} # ${#dias[@]} -> determina el tamaño del array
                      # muetra 7 por lo que hay que restar 1

# Iteramos por el fichero con un while 
while [ $linea -le $maxlineas ]
do
  # Obtenemos valores de la línea
  i=`cat ../recursos/precipitaciones.txt | head -$linea | tail -1`
  # Recogemos la cantidad de litros de esta línea
  cantidad=`echo "$i" | awk '{print $2}'`
  nDia=`echo "$i" | awk '{print $1}'`

  # Si no hay litros se muestra el día
  if [[ $cantidad -eq 0 ]]
  then
    # Si el día es mayor que el tamaño (lenght) del array
    if [[ $nDia -gt $arraySize ]]
    then
      # Recoge los días que excede del array
      nDia=`expr $nDia - ${#dias[@]}`
    fi
    # restamos uno ya que array empieza en 0
    nDia=`expr $nDia - 1`

    # Muestra por pantalla el día de la semana
    echo "${dias[${nDia}]}"
  fi
  # Incrementamos la línea
  linea=$(($linea + 1))
done

