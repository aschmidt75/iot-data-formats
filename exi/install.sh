#!/bin/bash

# This script will download and install library and source code
# of exificient, (C) 2007-2015 Siemens AG
# see https://sourceforge.net/projects/exificient/files/exificient/0.9.4/
# see http://exificient.sourceforge.net/
#

V="0.9.4"
URL=https://sourceforge.net/projects/exificient/files/exificient/"$V"/exificient-"$V"-bundle.zip/download

wget -O bundle.zip "$URL"
if [[ -f bundle.zip ]]; then
	unzip bundle.zip
	rm bundle.zip
fi

URL=https://sourceforge.net/projects/exificient/files/exificient/"$V"/exificient-"$V"-src.zip/download

wget -O src.zip "$URL"
if [[ -f src.zip ]]; then
	unzip src.zip
	rm src.zip

	# build gui
	CP=$(find ./bundle/lib/*.jar | xargs | tr ' ' ':')
	javac -d . -cp "$CP" src/src/gui/java/com/siemens/ct/exi/gui/EXIficientGUI.java

fi

