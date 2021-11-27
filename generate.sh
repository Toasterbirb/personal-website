#!/bin/bash
url="https://toasterbirb.com"
contentPath=./content
sitePath=./docs
stylesheet=$contentPath/style.css

function _setupSourceMeta()
{
	for i in $(find $contentPath -print)
	do
		case $i in
			*.md)
				file="$i"

				grep -q ';navlink' $file && navtitle=$(awk '/^;navlink/' $file | cut -d'=' -f2) && navlinks="<li><a href='$url/$(basename "$file")'>$navtitle</a></li>${navlinks}"
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
	fileName=$(basename $file)
	relativeCSSPath=$(sed "s|./docs/guides/$fileName|../style.css|; s|./docs/$fileName|./style.css|" <<< $file)

	echo "Inserting <head> and <body> $file"
	echo "Relative CSS path: $relativeCSSPath"

	title="$(awk '/^;title/' $file | cut -d'=' -f2)"
	echo "Title: $title"

	sed -i "1s|^|<head>\n<link rel = 'stylesheet' type='text/css' href='$relativeCSSPath'>\n<title>\n$title\n</title>\n</head>\n<body>\n|" $file
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
<meta property=\"og:site_name\" content=\"Toasterbirb's website\"> \
<meta property=\"og:title\" content=\"$title\"> \
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

function _replaceCustomTags()
{
	file=$1
	sed -i "s/<break>/<br><br>/g" $file

	awk -F "=" '/^;header/ { print $2 }' $file | xargs -i sed -i "s/;header={}/<a name=\"{}\"><\/a>/" $file

}

function _insertContactMeBlockToGuides()
{
	file=$1
	sed -i "s|</body>|<br><br><hr><h3>In case you have any questions, my inbox is open! <a href='$url/contact.html'>Send me a message</a><h3></body>|" $file
}

# Move stylesheet to the build directory and clean old html files
rsync -a $stylesheet $sitePath/style.css
rsync -a --delete-after $contentPath/pics $sitePath/
find $sitePath -iname "*.html" -print | xargs rm -v
[ -d $sitePath/guides ] || mkdir -p $sitePath/guides

_setupSourceMeta

for i in $(find $contentPath -print)
do
	case $i in
		*.md)
			filename=$(basename $i | sed 's/md/html/g')
			case $i in
				*/guides/*) htmlpath=$sitePath/guides/$filename ;;
				*) htmlpath=$sitePath/$filename ;;
			esac
			echo $htmlpath

			# Generate html
			md2html $i > $htmlpath
			
			_cleanSourceMeta "$htmlpath"
			_insertHeadAndBody "$htmlpath"
			_insertHtml "$htmlpath"
			_inserMeta "$htmlpath"
			_insertNavigation "$htmlpath"
			_replaceCustomTags "$htmlpath"
			_removeSourceMeta "$htmlpath"

			case $i in
				*/guides/*) _insertContactMeBlockToGuides "$htmlpath" ;;
			esac

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
