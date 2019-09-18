#!/bin/bash

echo "arobase = $@"
echo "dollar 1= $1"
echo "dollar 2= $2"
param=$#
echo "param= $param"
i=0
somme=0
while [ "$i" -lt  "$param" ];
do
	let "somme=somme+$1"
	shift
	let "i=i+1"
	echo "somme_while = $somme"
done
echo "la somme finale est $somme "
