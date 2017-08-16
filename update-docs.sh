#!/bin/bash
for i in $1*;
do
	if [ -d "$i/doc" ];
	then
		echo $i doc updated
		mkdir -p $2/$i
		cp $i/doc/* $2/$i
	fi
done
