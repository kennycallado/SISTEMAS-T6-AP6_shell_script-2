#! /bin/bash

# Declaración de variables
countPares=0
countImpar=0
listaPar=()
listaImp=()

for linea in `cat ../recursos/numeros.txt`
do
  # Si el resto de la división entre 2 es 0 el número es par
  if (( $linea % 2 == 0))
  then
    # Agrega el número a la lista que corresponde
    listapar+=($linea)
    # Incrementa el contador que corresponde
    countPares=`expr $countPares + 1`
  else
    listaImp+=($linea)
    countImpar=`expr $countImpar + 1`
  fi
done

# Muestra por pantalla la información obtenida
echo "Lista de número pares"
echo ${listapar[@]}
echo ""
echo "Lista de número impares"
echo ${listaImp[@]}

echo "--------------------------"

printf "\t\tTotales\n"
printf "Numeros pares: \t\t$countPares\n"
printf "Numeros impares: \t$countPares\n"

