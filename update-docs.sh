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

echo "<html><head></head>" > $2/index.html
for i in $(find $2 -maxdepth 1 -type d | grep -v "^.git$");
do
  echo "<a href=\"$i\">$i</a>" >> $2/index.html
done
echo "</html>" >> $2/index.html

cd $2
git add --all
git commit -m "refresh doc $(date)"
git push origin master

