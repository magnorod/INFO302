#!/bin/bash

#v1 à v4
nomFichier=$1
nbParam=$#
if [ -e "$nomFichier" ]
then
    echo "le fichier $nomFichier existe"

    fichierBak=$(ls $nomFichier.bak 2>/dev/null)
    # 2>/dev/null  permet de ne pas afficher le message d'erreur à l'écran
    #echo "fichierBak = $fichierBak"

    if [ -e "$fichierBak" ]
    then
      echo "le fichier $fichierBak existe déja"
      mv $fichierBak $nomFichier.1.bak
      cp $nomFichier $nomFichier.bak
    else
     cp $nomFichier $nomFichier.bak
     echo "création du fichier $nomFichier.bak"
   fi
else
    echo "le fichier $nomFichier n'existe pas"
fi
