# assumes ~/texmf points to ../texmf, for example:
# ln -s ../texmf ~/texmf
#

PDF = ../../pdf
TEXMF = ../texmf
LAST_COMMENT = ${TEXMF}/tex/latex/last-comment.tex
CLASS = ${TEXMF}/tex/latex/local/elementary-physics.cls
BIB = ${TEXMF}/bibtex/bib/local/elementary-physics.bib

LATEX = lualatex # pdflatex

.PHONY: all edit pdf read clean test tidy

all pdf : ${PDF}/${FILENAME}.pdf

${PDF}/${FILENAME}.pdf : ${FILENAME}.tex *.png ${LAST_COMMENT} ${CLASS} ${BIB}
	${LATEX} ${FILENAME}.tex
	bibtex ${FILENAME}.aux
	${LATEX} ${FILENAME}.tex
	${LATEX} ${FILENAME}.tex
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
	rm -f *.tex~

clean : tidy
	rm -f ${PDF}/${FILENAME}.pdf

test :
	${LATEX} ${FILENAME}.tex
	mv -f ${FILENAME}.pdf ${PDF}
	evince ${PDF}/${FILENAME}.pdf &


