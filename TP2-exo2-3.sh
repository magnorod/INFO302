#!/bin/bash
nbParam=$#
nomFic=$1

#debug
echo "nbParam= $nbParam"
echo "nomFic= $nomFic"



#verif param2

if [ "$2" == '' ]
then
        echo "cette commande prend au minimum 2 paramètres"
fi




#verif nomFic

if [[ "$nomFic" =~ ^.*\.html$ ]]
then
	echo "nom du fichier incorrect, le nom doit etre sous forme 'nom' et pas 'nom.html'"
	echo "arret du script"
	exit
fi



#CREATION DE LA PAGE HTML DE BASE

echo "
<!doctype html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>$nomFic</title>
</head>
<body>
<ul>" > $nomFic.html


#AJOUT DE LA LISTE
nbliste=0
let "nbliste=(nbParam)-1"
echo "nbliste=$nbliste"
compteur=1

while [ "$compteur" -le "$nbliste" ]
do
	echo "<li>$2</li>" >> $nomFic.html
	shift
	let "compteur=compteur+1"
done

echo "</ul>" >> $nomFic.html
echo "</body>" >> $nomFic.html
echo "</html>" >> $nomFic.html

cat $nomFic.html
