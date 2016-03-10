.PHONY : main cls doc clean all release cleanall FORCE_MAKE

MAIN = main

main : $(MAIN).pdf

doc : ustcthesis.pdf

all : main doc

cls : ustcthesis.cls

# to delegate all the tasks to latexmk
%.pdf : %.tex ustcthesis.cls ustcthesis.bst FORCE_MAKE
	latexmk -xelatex -shell-escape -use-make $<

ustcthesis.pdf : ustcthesis.dtx FORCE_MAKE
	latexmk -xelatex $<

ustcthesis.cls : ustcthesis.dtx
	xetex $<

clean :
	latexmk -c
	latexmk -c ustcthesis.dtx

# for developers only:
release : cls doc
	mkdir ustcthesis
	cp -r bib chapters figures .latexmkrc main.tex Makefile README.md \
	ustcextra.sty ustcthesis.cls ustcthesis.dtx ustcthesis.pdf ustcthesis/
	zip -r ../ustcthesis.zip ustcthesis
	-rm -rf ustcthesis
cleanall :
	latexmk -C
	latexmk -C ustcthesis.dtx
