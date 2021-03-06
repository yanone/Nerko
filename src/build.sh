#!/bin/sh

rm ../fonts/ttf/*.ttf

set -e

echo "Generating Static fonts"
mkdir -p ../fonts/ttf
fontmake -u NerkoOne-Regular.ufo -o ttf --output-dir ../fonts/ttf/

echo "Post processing"
ttfs=$(ls ../fonts/ttf/*.ttf)
for ttf in $ttfs
do
	gftools fix-dsig -f $ttf;
	gftools fix-nonhinting $ttf "$ttf.fix";
	mv "$ttf.fix" $ttf;
done
rm ../fonts/ttf/*backup*.ttf
