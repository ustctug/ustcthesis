.PHONY : all theisis cls doc pv clean cleanall

MAIN = main
SRC = $(MAIN).tex $(wildcard chapters/*.tex) $(wildcard bib/*.bib)
CLS = ustcthesis.cls ustcextra.sty
BST = ustcthesis.bst
AUX = *.aux *.bbl *.blg *.fdb_latexmk *.fls *.glo *.gls *.hd *.idx *.ilg *.ind \
      *.lof *.log *.lot *.out *.toc chapters/*.aux
PDF = $(MAIN).pdf ustcthesis.pdf

all : thesis doc

thesis : $(MAIN).pdf

cls : ustcthesis.cls ustcextra.sty

doc: ustcthesis.pdf

pv : $(SRC) $(CLS) $(BST)
	latexmk -xelatex -shell-escape -use-make -pv $(MAIN).tex

$(MAIN).pdf : $(SRC) $(CLS) $(BST)
	latexmk -xelatex -shell-escape -use-make $(MAIN).tex

$(CLS): ustcthesis.dtx
	xetex ustcthesis.dtx

ustcthesis.pdf : ustcthesis.dtx
	xelatex ustcthesis.dtx
	makeindex -s gind.ist ustcthesis.idx
	makeindex -s gglo.ist -o ustcthesis.gls ustcthesis.glo
	xelatex ustcthesis.dtx
	xelatex ustcthesis.dtx

clean :
	-rm -f $(AUX) $(CLS)

cleanall : clean
	-rm -f $(PDF)
