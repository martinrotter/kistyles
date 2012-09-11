all: start guide finish

start:
	echo "Makefile has started its work."

guide:	updiplomex.tex
	pdflatex updiplomex.tex
	pdflatex updiplomex.tex
	makeindex updiplomex.idx -s index.ist
#	biber updiplom.aux
	pdflatex updiplomex.tex
	pdflatex updiplomex.tex

finish:
	echo "Makefile has finished its work."

clean:
	rm -f *.lo* *.aux *.ind *.idx *.ilg *.toc
