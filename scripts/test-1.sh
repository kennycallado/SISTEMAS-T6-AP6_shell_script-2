#! /bin/bash

maxlineas=`cat nombres.txt | wc -l`
linea=1

while [ $linea -le $maxlineas ]
do
  i=`cat nombres.txt | head -$linea | tail -1`
  linea=$(($linea + 1))
  echo "$i"
done


for i in $(cat nombres.txt)
do
  echo "$i"
done
