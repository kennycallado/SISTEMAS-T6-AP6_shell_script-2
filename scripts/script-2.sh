#! /bin/bash

# Declaración de variables de la aplicación
maxlineas=`cat ../recursos/precipitaciones.txt | wc -l` # total de línea del fichero
suma=0      # Acumulador litros
cantidad=0  # Obtiene valor de la línea
linea=1     # línea en la que empezamos 

# Iteramos por el fichero con un while 
while [ $linea -le $maxlineas ]
do
  # Obtenemos valores de la línea
  i=`cat ../recursos/precipitaciones.txt | head -$linea | tail -1`
  # Recogemos la cantidad de litros de esta línea
  cantidad=`echo "$i" | awk '{print $2}'`
  # Acumulamos los litros
  suma=`expr $suma + $cantidad`

  # Incrementamos la línea
  linea=$(($linea + 1))
done

# No conocía el parámetro scale que se pasa a bc
result=`echo "scale=2; $suma / $maxlineas" | bc`

# Mostramos por pantalla los resultados
echo "total suma: $suma"
echo "total líneas: $maxlineas"

echo "La media de litros es: $result"

