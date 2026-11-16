MAIN = main
NAME = ustcthesis
CLSFILES = $(NAME).cls
BSTFILES = $(NAME)-numeric.bst $(NAME)-authoryear.bst
BBXFILES = $(NAME)-numeric.bbx $(NAME)-authoryear.bbx
CBXFILES = $(NAME)-numeric.cbx $(NAME)-authoryear.cbx

SHELL = bash
LATEXMK = latexmk -xelatex
VERSION = $(shell cat $(NAME).cls | egrep -o "\\ustcthesisversion{[0-9.]+[0-9a-z.-]*" \
	  | egrep -o "[0-9.]+[0-9a-z.-]*")

.PHONY : main doc test save clean cleanall all install zip FORCE_MAKE

main : $(MAIN).pdf

all : main doc

doc : $(NAME)-doc.pdf

$(MAIN).pdf : $(MAIN).tex $(CLSFILES) $(BSTFILES) $(BBXFILES) $(CBXFILES) FORCE_MAKE
	$(LATEXMK) $<

$(NAME)-doc.pdf : $(NAME)-doc.tex FORCE_MAKE
	$(LATEXMK) $<

test:
	l3build check

save:
	bash tests/save.sh

clean : FORCE_MAKE
	$(LATEXMK) -c $(MAIN).tex $(NAME)-doc.tex
	rm -rf build/

cleanall :
	$(LATEXMK) -C $(MAIN).tex $(NAME)-doc.tex
	l3build clean

install : doc
	l3build install --full

zip : main doc
	ln -sf . $(NAME)
	zip -r $(NAME)-v$(VERSION).zip $(NAME)/{*.md,LICENSE,\
	$(NAME)-doc.tex,$(NAME)-doc.pdf,$(NAME).cls,*.bst,*.bbx,*.cbx,figures,\
	$(MAIN).tex,ustcsetup.tex,references.bib,chapters/*.tex,$(MAIN).pdf,\
	latexmkrc,Makefile}
	rm $(NAME)
