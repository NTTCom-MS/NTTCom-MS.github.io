#!/bin/bash

if [ ! -d "$2/.git" ];
then
	echo "not a git repo"
	exit 1
fi

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

cd $2
git add --all
git commit -m "refresh doc $(date)"
git push origin master

