#!/bin/sh
contentPath=./content
sitePath=./docs
stylesheet=$contentPath/style.css

function _setupSourceMeta()
{
	for i in $contentPath/*
	do
		case $i in
			*.md)
				file="$i"

				grep -q ';navlink' $file && navtitle=$(awk '/^;navlink/' $file | cut -d'=' -f2) && navlinks="<li><a href='$(basename "$file")'>$navtitle</a></li>${navlinks}"
		;;
		esac
	done
}

function _cleanSourceMeta()
{
	file=$1
	awk '/<p>;/' $file | sed -i 's/<p>//g; s/<\/p>//g' $file
}

function _insertHeadAndBody()
{
	file=$1
	echo "Inserting <head> and <body> $file"

	title="$(awk '/^;title/' $file | cut -d'=' -f2)"
	echo "Title: $title"

	sed -i "1s|^|<head>\n<link rel = 'stylesheet' type='text/css' href='style.css'>\n<title>\n$title\n</title>\n</head>\n<body>\n|" $file
	echo "</body>" >> $file
}

function _insertNavigation()
{
	file=$1
	echo "Inserting navigation links $file"
	sed -i "/^<body>/a <nav> \
		<ul> \
			$navlinks \
		</ul>\
	</nav>" $file
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
	sed -i "/^<head>/a \
<link rel=\"shortcut icon\" type=\"image/jpg\" href=\"./pics/jumala.png\"> \
<meta property=\"og:type\" content=\"website\"> \
<meta property=\"og:site_name\" content=\"toasterbirb.com\"> \
<meta property=\"og:title\" content=\"toasterbirb.com\"> \
<meta property=\"og:description\" content=\"Toasterbirb's internet corner\"> \
<meta property=\"og:image\" content=\"./pics/jumala.png\">" $file
}

function _removeSourceMeta()
{
	# This should be executed last. It will remove all informational metadata from the top of the file
	echo "Removing source file metadata"
	file=$1
	sed -i '/^<p>;/d; /^;/d' $file
}

function _copyDotfiles()
{
	# Copy over some selected dotfiles to docs directory
	echo "Copying dotfiles"
	mkdir -p $sitePath/dotfiles
	cp -v ~/.config/alacritty/alacritty.yml $sitePath/dotfiles/
	cp -v ~/.config/lf/lfrc $sitePath/dotfiles/
	cp -v ~/.config/lf/lp.sh $sitePath/dotfiles/
	cp -v ~/.config/lf/lfcd.sh $sitePath/dotfiles/
}

# Move stylesheet to the build directory and clean old html files
rsync -a $stylesheet $sitePath/style.css
rsync -a --delete-after $contentPath/pics $sitePath/
rm $sitePath/*.html

_setupSourceMeta

for i in $contentPath/*
do
	case $i in
		*.md)
			filename=$(basename $i | sed 's/md/html/g')
			htmlpath=$sitePath/$filename

			# Generate html
			md2html $i > $htmlpath
			
			_cleanSourceMeta "$htmlpath"
			_insertHeadAndBody "$htmlpath"
			_insertHtml "$htmlpath"
			_inserMeta "$htmlpath"
			_insertNavigation "$htmlpath"
			_removeSourceMeta "$htmlpath"


			# Replace markdown links to html links
			sed -i s/\.md/.html/g $htmlpath
			printf "\n"
			;;
	esac
done

case $1 in
	-d)
		# Update dotfiles
		_copyDotfiles
		;;
esac
