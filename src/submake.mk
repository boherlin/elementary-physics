PDF = ../../pdf
COMMON = ../common

.PHONY: all edit pdf read clean test sage tidy

all pdf : ${PDF}/${FILENAME}.pdf

${PDF}/${FILENAME}.pdf : ${FILENAME}.tex *.png ${COMMON}/last-comment.tex ${COMMON}/elementary-physics.cls ${COMMON}/elementary-physics.bib
	pdflatex ${FILENAME}.tex
	sage ${FILENAME}.sagetex.sage
	bibtex ${FILENAME}.aux
	pdflatex ${FILENAME}.tex
	pdflatex ${FILENAME}.tex
	mv -f ${FILENAME}.pdf ${PDF}

edit :
	gedit ${FILENAME}.tex &

read : pdf
	evince ${PDF}/${FILENAME}.pdf &

tidy :
	rm -f ${FILENAME}.aux
	rm -f ${FILENAME}.bbl
	rm -f ${FILENAME}.blg
	rm -f ${FILENAME}.log
	rm -f ${FILENAME}.out
	rm -f ${FILENAME}.pdf
	rm -f ${FILENAME}.run.xml
	rm -f ${FILENAME}.synctex.gz
	rm -f ${FILENAME}.toc
	rm -f ${FILENAME}-blx.bib
	rm -f ${FILENAME}.sagetex.*
	rm -f sage-plots-for-${FILENAME}.tex/*
	if [ -d sage-plots-for-${FILENAME}.tex ]; then rmdir sage-plots-for-${FILENAME}.tex; fi
	rm -f *.tex~

clean : tidy
	rm -f ${PDF}/${FILENAME}.pdf

sage :
	pdflatex ${FILENAME}.tex
	sage ${FILENAME}.sagetex.sage
	pdflatex ${FILENAME}.tex
	mv -f ${FILENAME}.pdf ${PDF}
	evince ${PDF}/${FILENAME}.pdf &

test :
	pdflatex ${FILENAME}.tex
	mv -f ${FILENAME}.pdf ${PDF}
	evince ${PDF}/${FILENAME}.pdf &


