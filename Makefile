.PHONY : all pv clean

SOURCES = main.tex ustcthesis.cls ustcthesis-bachelor.def ustcthesis-doctor.def \
          ustcthesis-statement.def

pv : $(SOURCES)
	latexmk -xelatex -shell-escape -use-make -pv $<

all : main.pdf

main.pdf : $(SOURCES)
	latexmk -xelatex -shell-escape -use-make $<

clean :
	latexmk -C
	-rm -f main.bbl
