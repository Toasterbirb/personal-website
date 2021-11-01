#!/bin/sh
contentPath=./content
sitePath=./docs
stylesheet=$contentPath/style.css

function _insertHead()
{
	file=$1
	echo "Inserting <head> $file"
	sed -i '1s|^|<head>\n\t<link rel = "stylesheet" type="text/css" href="style.css">\n</head>\n|' $file
}

# Move stylesheet to the build directory
rsync -a $stylesheet $sitePath/style.css

for i in $contentPath/*
do
	case $i in
		*.md)
			filename=$(basename $i | sed 's/md/html/g')
			htmlpath=$sitePath/$filename

			# Generate html
			md2html $i > $htmlpath
			_insertHead "$htmlpath"

			# Replace markdown links to html links
			sed -i s/\.md/.html/g $htmlpath
			;;
	esac
done
