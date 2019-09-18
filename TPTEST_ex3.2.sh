#!/bin/bash

nomFichier=$1
chaineCarac=$2

if [ -s "$nomFichier" ]
then
	cat $nomFichier | grep "$chaineCarac" | wc -l
else
	#le fichier n 'existe pas ou est vide
	echo "erreur, le fichier $1 n'existe pas ou est vide !" >&2
fi




