all: start guide finish

start:
	echo "Makefile has started its work."

guide:	updiplom.tex
	pdflatex updiplom.tex
	pdflatex updiplom.tex
	makeindex updiplom.idx -s index.ist
#	biber updiplom.aux
	pdflatex updiplom.tex
	pdflatex updiplom.tex

finish:
	echo "Makefile has finished its work."

clean:
	rm -f *.lo* *.aux *.ind *.idx *.ilg *.toc
