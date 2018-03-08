# assumes ~/texmf points to ../texmf, for example:
# ln -s ../texmf ~/texmf
#
# depends on sagemath, for example:
# sudo apt-add-repository -y ppa:aims/sagemath
# sudo apt-get update
# sudo apt-get install sagemath-upstream-binary
# sudo cp -R /usr/lib/sagemath/local/share/texmf/tex /usr/local/share/texmf
# sudo texhash /usr/local/share/texmf

PDF = ../../pdf
TEXMF = ../texmf
LAST_COMMENT = ${TEXMF}/tex/latex/last-comment.tex
CLASS = ${TEXMF}/tex/latex/local/elementary-physics.cls
BIB = ${TEXMF}/bibtex/bib/local/elementary-physics.bib

.PHONY: all edit pdf read clean test sage tidy

all pdf : ${PDF}/${FILENAME}.pdf

${PDF}/${FILENAME}.pdf : ${FILENAME}.tex *.png ${LAST_COMMENT} ${CLASS} ${BIB}
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


