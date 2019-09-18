#!/bin/bash
nbParam=$#
borneInf=$1
borneSup=$2
stockageTemp=0


#verif borne
if [ "$borneInf" -gt "$borneSup" ]
then
	((stockageTemp=$borneInf))
	((borneInf=$borneSup))
	((borneSup=$stockageTemp))
fi

echo "borne inf: $borneInf"
echo "borne sup: $borneSup"

((nbElement = $borneSup - $borneInf ))
#echo "nbElement=$nbElement"



for i in `seq  2 $borneSup`
do
	nombre[$i]={$i}
	premier[$i]={$i}
	echo "tab nombre=$nombre[$i]"
done



#if ! (( $i % $j ))

#ON CHERCHE SI LE NB EST PREMIER
index=2
compteur=0
for i in `seq $borneInf $borneSup`
do
	for j in `seq 0 $nbElement`
	do
		if (( $nombre[$j] == $index ))
		then
			echo "$nombre[$j] est premier"
			premier[$compteur]=$nombre[$j]
		fi

		if [ "($nombre[$j]%$i)" == "0" ]
		then
			nombre[$i]=0
		fi
	done
	((compteur=$compteur+1))
	((index=$index+1))
done
echo "$nombre"



