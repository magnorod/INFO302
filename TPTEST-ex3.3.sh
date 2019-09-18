#!/bin/bash

chaineCarac=$1
nbParam=$#

nbFichierTxt=$(ls *.txt| wc -l)

ls *.txt > nomfichiertxt.txt
#echo "nbParam=$nbParam"
compteur=1
#VERIF SAISIE
if [ "$nbParam" != "1" ]
then
	echo "erreur vous devez rentrer qu un seul et unique paramètre "
else
    #echo "nbFichierTxt=$nbFichierTxt"
	for i in `seq 1 $nbFichierTxt`
	do
		#on divise le fichier nomfichier.txt en plusieurs sous fichiers afin de récupérer
		#les données par la suite ligne par ligne

		var1=$(sed -n ${compteur}p nomfichiertxt.txt)
		nbOccurences=$(cat $var1 | grep $chaineCarac | wc -l )
		#echo "nbOccurences=$nbOccurences"

		if (( $nbOccurences >= 2 ))
		then
		   echo "$chaineCarac a été trouve $nbOccurences fois dans $var1 "
		fi

		((compteur=$compteur+1))
	done
fi
rm nomfichiertxt.txt
