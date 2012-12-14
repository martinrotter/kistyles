all: start guide finish

start:
	echo "Makefile has started its work."

guide:	upsimple.tex
	pdflatex upsimple
	pdflatex upsimple
	makeindex upsimple.idx -s index.ist
	makeglossaries upsimple
	bibtex upsimple
	pdflatex upsimple
	pdflatex upsimple

finish:
	echo "Makefile has finished its work."

clean:
	rm -f *.lo* *.aux *.ind *.idx *.ilg *.toc
