MAIN = main
NAME = ustcthesis
CLSFILES = $(NAME).cls
BSTFILES = $(NAME)-numerical.bst $(NAME)-authoryear.bst $(NAME)-bachelor.bst

SHELL = bash
LATEXMK = latexmk -xelatex
VERSION = $(shell cat $(NAME).dtx | egrep -o "\[\d\d\d\d/\d\d\/\d\d v.+\]" \
	  | egrep -o "v\S+")
TEXMF = $(shell kpsewhich --var-value TEXMFHOME)

.PHONY : main cls doc test save clean all install distclean zip FORCE_MAKE

main : $(MAIN).pdf

all : main doc

cls : $(CLSFILES) $(BSTFILES)

doc : $(NAME).pdf

$(MAIN).pdf : $(MAIN).tex $(CLSFILES) $(BSTFILES) FORCE_MAKE
	$(LATEXMK) $<

$(NAME).cls : $(NAME).dtx
	xetex $<

$(NAME).pdf : $(NAME).dtx FORCE_MAKE
	$(LATEXMK) $<

test:
	l3build check

save:
	bash test/save.sh

clean : FORCE_MAKE
	$(LATEXMK) -c $(MAIN).tex $(NAME).dtx

cleanall :
	$(LATEXMK) -C $(MAIN).tex $(NAME).dtx

install : cls doc
	mkdir -p $(TEXMF)/{doc,source,tex}/latex/$(NAME)
	mkdir -p $(TEXMF)/bibtex/bst/$(NAME)
	cp $(BSTFILES) $(TEXMF)/bibtex/bst/$(NAME)
	cp $(NAME).pdf $(TEXMF)/doc/latex/$(NAME)
	cp $(NAME).dtx $(TEXMF)/source/latex/$(NAME)
	cp $(CLSFILES) $(TEXMF)/tex/latex/$(NAME)

zip : main doc
	ln -sf . $(NAME)
	zip -r ../$(NAME)-$(VERSION).zip $(NAME)/{*.md,LICENSE,\
	$(NAME).dtx,$(NAME).pdf,$(NAME).cls,*.bst,figures,\
	$(MAIN).tex,ustcsetup.tex,math-commands.tex,chapters,bib,$(MAIN).pdf,\
	latexmkrc,Makefile}
	rm $(NAME)
