.PHONY : all theisis cls doc pv clean cleanall

SRC = main.tex
CLS = ustcthesis.cls ustcthesis.bst \
      ustcthesis-bachelor.def ustcthesis-doctor.def ustcthesis-statement.def
AUX = *.aux *.bbl *.blg *.fdb_latexmk *.fls *.glo *.gls *.idx *.ilg *.ind \
      *.lof *.log *.lot *.out *.toc
PDF = *.pdf

all : thesis doc

thesis : main.pdf

cls : ustcthesis.cls

doc: ustcthesis.pdf

pv : $(SRC) $(CLS)
	latexmk -xelatex -shell-escape -use-make -pv $<

main.pdf : $(SRC) $(CLS)
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
	latexmk -c main.tex
	-rm -f $(AUX) chapters/*.aux

cleanall : clean
	-rm -f $(CLS) $(PDF)
