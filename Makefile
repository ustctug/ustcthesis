.PHONY : main cls doc clean all release zip cleanall FORCE_MAKE

MAIN = main
CLS = ustcthesis.cls ustcextra.sty
DTX = ustcthesis.dtx

main : $(MAIN).pdf

cls : $(CLS)

doc: ustcthesis.pdf

# to delegate all the tasks to latexmk
%.pdf : %.tex $(CLS) FORCE_MAKE
	latexmk -xelatex -shell-escape -use-make $<

$(CLS) : $(DTX)
	xetex $<

ustcthesis.pdf : $(DTX)
	latexmk -xelatex $<

clean :
	latexmk -c
	latexmk -c $(DTX)

# for developers only:
all : main doc
release : cls doc
	latexmk -C
	latexmk -c $(DTX)
zip : release
	mkdir ustcthesis
	cp -r bib chapters figures .latexmkrc main.tex Makefile README.md \
	ustcextra.sty ustcthesis.* ustcthesis/
	zip -r ../ustcthesis.zip ustcthesis
	-rm -rf ustcthesis
cleanall :
	latexmk -C
	latexmk -C $(DTX)
	-rm -f $(CLS)
