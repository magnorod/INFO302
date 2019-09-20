#!/bin/bash
#V6

mkdir conserver
cp *.txt.bak conserver
#Car tous mes fichiers sont des .txt donc la première sauvegarde
#sera toujours sous la forme nomfichier.txt.bak ( ce qui permet de les différencier des sauvegardes annexes)
rm *.bak
cp conserver/*.txt.bak .
rm -fr conserver
