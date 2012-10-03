all: start guide finish

start:
	echo "Makefile has started its work."

guide:	updiplomex.tex
	pdflatex updiplomex
	pdflatex updiplomex
	makeindex updiplomex.idx -s index.ist
	makeglossaries updiplomex
	biber updiplomex
	pdflatex updiplomex
	pdflatex updiplomex

finish:
	echo "Makefile has finished its work."

clean:
	rm -f *.lo* *.aux *.ind *.idx *.ilg *.toc
