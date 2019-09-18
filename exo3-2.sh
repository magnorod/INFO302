#!/bin/bash
nbParam=$#
saisie=$1
puissance=0
resultat=0


#aide-debug
#echo "nbParam=$nbParam"
#echo "saisie= $saisie"

function Puissance2 {
	while [ "$resultat" -lt "$saisie" ]
	do
		let "resultat=2**puissance"
		#echo "2**$puissance cad $resultat  est < $saisie"
		let "puissance=puissance+1"
	done
	let "puissance=puissance-1"
	echo "2**$puissance cad $resultat  est >=  $saisie"
}

#appel de la fonction Puissance2
Puissance2

