all: start updiplom finish

default: all

start:
	@echo UPstyles compilation is starting now...
	@sleep 2

finish:
	@echo UPstyles compilation finished...;

clean:
	@rm -v -f *.lo* *.aux *.ind *.idx *.ilg *.toc *.acn *.run.xml *-blx.bib *.ist *.glo  *.blg *.bbl  *.gls *.glg *.alg *.acr
	
# Updiplom component.  
updiplom:	updiplom.tex
	@pdflatex updiplom
	@pdflatex updiplom
	@makeindex updiplom.idx
	@makeglossaries updiplom
	@bibtex updiplom
	@pdflatex updiplom
	@pdflatex updiplom
