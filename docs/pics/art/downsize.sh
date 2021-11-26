#!/bin/sh
files=$(ls ./high-res)

for i in $files
do
	echo "Scaling down: $i"
	convert ./high-res/$i -resize 640x480 ./thumbnails/$i
done
