#!/bin/bash

# un dossier TP2 contient l'ensemble de mes fichiers .txt dont je veux connaitre la taille
# ce script fonctionne uniquement pour les fichiers nommés de la manière suivante:
#fichier$numero.txt

nbFichier=$(ls TP2 | wc -l)

echo "nbFichier=$nbFichier"
echo "Size     Real   Lost    Files"

sommeTailleFichier=0
sommeTailleSize=0
i=$nbFichier
while (($i >= 1))
do
    tailleReal=$(du TP2/fichier$i.txt | cut -c1-2) #une taille octecs
    ((tailleFichier=tailleReal*1024))

    tailleSize=$(ls -l TP2 | grep fichier$i | cut -c25-30)
    #la commande cut permet de récupérer uniquement la taille
    # attention il faut adapater le cut à la longueur du pseudo utilisateur etc..
    #sinon la commande ci-dessus renverra autre chose que la taille

    ((difference=$tailleFichier-$tailleSize))

    nomfichier=$(ls TP2 | grep fichier$i.txt)

    ((sommeTailleFichier+=$tailleFichier))
    ((sommeTailleSize+=$tailleSize))

    echo "$tailleSize   $tailleFichier    $difference   $nomfichier"
    ((i-=1))
done
((difference=$sommeTailleFichier-$sommeTailleSize))
echo "$sommeTailleSize   $sommeTailleFichier   $difference   TOTAL"
