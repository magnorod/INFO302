#!/bin/bash
nbParam=$#

#echo "nbParam=$nbParam"
tabPositif=()
echo ${tabPositif[*]}

nbElementTab=0
indiceTab=0

for i in `seq 0 $((nbParam -1))`
do
  if (($1 > 0))
  then
      #echo "$1 est un nombre positif"
      tabPositif[$indiceTab]=$1
      (( indiceTab= indiceTab+1))
      (( nbElementTab = nbElementTab +1))
  fi
  shift
done


#La boucle While bug lorsque l'on passe en param un nb <= 0
#i=0
#while (( $i <= nbParam -1  ))
#do
#  if (($1 > 0))
#  then
#      echo "$1 est un nombre positif"
#      tabPositif[$i]=$1
#      (( i = i+1))
#      (( nbElementTab = nbElementTab +1))
#  fi
#  shift
#done



echo ${tabPositif[*]}

produit=tabPositif[0]

for i in `seq 1 $((nbElementTab -1))`
do
      ((produit=produit*tabPositif[i]))
done
echo "$nbElementTab valeurs strictement positives et leur produit est $produit"
