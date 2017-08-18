MAIN = main
NAME = ustcthesis
CLSFILES = $(NAME).cls ustcextra.sty
BSTFILES = ustcnumerical.bst ustcauthoryear.bst ustcbachelor.bst

SHELL = bash
LATEXMK = latexmk -xelatex -halt-on-error -interaction=nonstopmode -synctex=1
VERSION = $(shell cat $(NAME).dtx | egrep -o "\[\d\d\d\d/\d\d\/\d\d v.+\]" \
	  | egrep -o "v\S+")
LOCAL = $(shell kpsewhich --var-value TEXMFLOCAL)
UTREE = $(shell kpsewhich --var-value TEXMFHOME)

.PHONY : main cls doc clean all inst install distclean zip FORCE_MAKE

main : $(MAIN).pdf

all : main doc

cls : $(CLSFILES) $(BSTFILES)

doc : $(NAME).pdf

$(MAIN).pdf : $(MAIN).tex $(CLSFILES) $(BSTFILES) FORCE_MAKE
	$(LATEXMK) $<

$(NAME).cls $(BSTFILES) : $(NAME).dtx
	xetex $<

$(NAME).pdf : $(NAME).dtx FORCE_MAKE
	$(LATEXMK) $<

clean : FORCE_MAKE
	latexmk -c $(MAIN).tex
	latexmk -c $(NAME).dtx

distclean :
	latexmk -C $(MAIN).tex
	latexmk -C $(NAME).dtx

inst : cls doc
	mkdir -p $(UTREE)/{doc,source,tex}/latex/$(NAME)
	mkdir -p $(UTREE)/bibtex/bst/$(NAME)
	cp $(BSTFILES) $(UTREE)/bibtex/bst/$(NAME)
	cp $(NAME).pdf $(UTREE)/doc/latex/$(NAME)
	cp $(NAME).dtx $(UTREE)/source/latex/$(NAME)
	cp $(CLSFILES) $(UTREE)/tex/latex/$(NAME)

install : cls doc
	mkdir -p $(LOCAL)/{doc,source,tex}/latex/$(NAME)
	mkdir -p $(LOCAL)/bibtex/bst/$(NAME)
	cp $(BSTFILES) $(LOCAL)/bibtex/bst/$(NAME)
	cp $(NAME).pdf $(LOCAL)/doc/latex/$(NAME)
	cp $(NAME).dtx $(LOCAL)/source/latex/$(NAME)
	cp $(CLSFILES) $(LOCAL)/tex/latex/$(NAME)

zip : main doc
	ln -sf . $(NAME)
	zip -r ../$(NAME)-$(VERSION).zip $(NAME)/{README.md,$(NAME).dtx,\
	$(NAME).cls,$(NAME).pdf,figures,ustcnumerical.bst,ustcauthoryear.bst,\
	ustcbachelor.bst,ustcextra.sty,$(MAIN).tex,$(MAIN).pdf,chapters,bib,\
	.latexmkrc,Makefile}
	rm $(NAME)
