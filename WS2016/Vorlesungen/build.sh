#!/bin/sh
#
# Script to prepare final PDFs for presentation and print.
#
# Usage sh build.sh <lectureNumberAsString>

tmpfilename="tmplecturefile" # don't have any files called like this!

echo "\documentclass[onlymath,handout]{beamer}\n" > $tmpfilename.tex
tail -n +3 lecture-$1.tex >> $tmpfilename.tex
pdflatex $tmpfilename.tex
pdflatex $tmpfilename.tex
pdfnup --nup 2x2 --outfile lecture-$01-print.pdf $tmpfilename.pdf

echo "\documentclass[onlymath]{beamer}\n" > $tmpfilename.tex
tail -n +3 lecture-$1.tex >> $tmpfilename.tex
pdflatex $tmpfilename.tex
pdflatex $tmpfilename.tex
mv $tmpfilename.pdf lecture-$1-overlay.pdf

rm $tmpfilename.*

echo "\n\n*** Finished creating files 'lecture-$1-overlay.pdf' and 'lecture-$01-print.pdf' ***\n"
