#!/bin/bash
for i in $1*;
do
	if [ -d "$i/doc" ];
	then
		echo $i doc updated
		rm -fr $2/$i
		mkdir -p $2/$i
		cp -r $i/doc/* $2/$i
	fi
done
