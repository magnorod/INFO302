#!/bin/bash
# Ce script permet de créer quelques fichiers postscripts pour répondre à l'exercice 8

for i in `seq 1 10`;
do
        echo "Voila le fichier numero $i" > fichier$i.ps
done
