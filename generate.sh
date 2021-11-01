#!/bin/sh
contentPath=./content
sitePath=./docs
stylesheet=$contentPath/style.css

function _insertHead()
{
	file=$1
	echo "Inserting <head> $file"
	sed -i '1s|^|<head>\n<link rel = "stylesheet" type="text/css" href="style.css">\n</head>\n|' $file
}

function _insertHtml()
{
	# Requires head

	file=$1
	echo "Inserting <html> $file"
	sed -i '1s|^|<html>\n|' $file
	echo "</html>" >> $file
}

function _inserMeta()
{
	# Requires head
	
	file=$1
	echo "Inserting metadata $file"
	sed -i '/^<head>/a \
<meta property="og:type" content="website"> \
<meta property="og:site_name" content="toasterbirb.com"> \
<meta property="og:title" content="toasterbirb.com"> \
<meta property="og:description" content="Toasterbirbs internet corner"> \
<meta property="og:image" content="https://duckduckgo.com/i/3be2cf68.png">' $file
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
			_insertHtml "$htmlpath"
			_inserMeta "$htmlpath"

			# Replace markdown links to html links
			sed -i s/\.md/.html/g $htmlpath
			;;
	esac
done
