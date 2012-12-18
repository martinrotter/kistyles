all: start guide finish

start:
	echo "Makefile has started its work."

guide:	updiplom.tex
	pdflatex updiplom
	pdflatex updiplom
	makeindex updiplom.idx -s index.ist
	makeglossaries updiplom
	bibtex updiplom
	pdflatex updiplom
	pdflatex updiplom

finish:
	echo "Makefile has finished its work."

clean:
	rm -f *.lo* *.aux *.ind *.idx *.ilg *.toc
