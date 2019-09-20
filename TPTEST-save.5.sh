#!/bin/bash

nomFichier=$1
nbParam=$#
if [ -e "$nomFichier" ]
then
    #echo "le fichier $nomFichier existe"

    fichierBak=$(ls $nomFichier.bak 2>/dev/null)
    # 2>/dev/null  permet de ne pas afficher le message d'erreur à l'écran
    #echo "fichierBak = $fichierBak"

    if [  ! -e "$fichierBak" ]
    then
        cp $nomFichier $nomFichier.bak
        echo "le fichier $nomFichier.bak est la sauvegarde de $nomFichier"
        echo ""
    else
      #V5
        echo "le fichier $fichierBak existe déja"
        nbFichierBak=$(ls $nomFichier.*.bak | wc -l)
        ((nbFichierBak+=1)) #sinon on commence à nomfichier.0.bak d'oû le +1
        echo "création du fichier $nomFichier.$nbFichierBak.bak"
        mv $fichierBak $nomFichier.$nbFichierBak.bak
        fichierBak=$(ls $nomFichier.$nbFichierBak.bak 2>/dev/null)
        cp $nomFichier $nomFichier.bak #ne change pas

    fi

else
    echo "le fichier $nomFichier n'existe pas"
fi
ls -l
