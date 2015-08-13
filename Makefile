.PHONY : all theisis cls doc pv clean

SOURCES = main.tex
CLS = ustcthesis.cls ustcthesis-bachelor.def ustcthesis-doctor.def ustcthesis-statement.def
AUX = *.aux *.bbl *.fls *.glo *.gls *.idx *.ilg *.ind *.log
PDF = *.pdf


all : thesis doc

thesis : main.pdf

cls : ustcthesis.cls

doc: ustcthesis.pdf

pv : $(SOURCES) $(CLS)
	latexmk -xelatex -shell-escape -use-make -pv $<

main.pdf : $(SOURCES) $(CLS)
	latexmk -xelatex -shell-escape -use-make $<

ustcthesis.cls: ustcthesis.ins ustcthesis.dtx
	latex ustcthesis.ins

ustcthesis.pdf : ustcthesis.dtx
	xelatex ustcthesis.dtx
	makeindex -s gind.ist -o ustcthesis.ind ustcthesis.idx
	makeindex -s gglo.ist -o ustcthesis.gls ustcthesis.glo
	xelatex ustcthesis.dtx
	xelatex ustcthesis.dtx

clean :
	latexmk -C main.tex
	-rm -f $(AUX) chapters/${AUX} $(PDF)
