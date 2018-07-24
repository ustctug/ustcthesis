MAIN = main
NAME = ustcthesis
CLSFILES = $(NAME).cls $(NAME)-extra.sty
BSTFILES = ustcthesis-numerical.bst ustcthesis-authoryear.bst ustcthesis-bachelor.bst

SHELL = bash
LATEXMK = latexmk -xelatex -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1
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
	texlua build.lua check --halt-on-error

save:
	-texlua build.lua save titlepage
	-texlua build.lua save titlepage-english
	-texlua build.lua save titlepage-master
	-texlua build.lua save titlepage-secret
	-texlua build.lua save titlepage-bachelor
	-texlua build.lua save statement
	-texlua build.lua save statement-secret
	-texlua build.lua save main
	-texlua build.lua save main-english
	-texlua build.lua save main-bachelor
	-texlua build.lua save main-bachelor-arabic
	-texlua build.lua save main-bachelor-english

clean : FORCE_MAKE
	latexmk -c $(MAIN).tex
	latexmk -c $(NAME).dtx
	rm -rf build

distclean :
	latexmk -C $(MAIN).tex
	latexmk -C $(NAME).dtx
	rm -rf build

install : cls doc
	mkdir -p $(TEXMF)/{doc,source,tex}/latex/$(NAME)
	mkdir -p $(TEXMF)/bibtex/bst/$(NAME)
	cp $(BSTFILES) $(TEXMF)/bibtex/bst/$(NAME)
	cp $(NAME).pdf $(TEXMF)/doc/latex/$(NAME)
	cp $(NAME).dtx $(TEXMF)/source/latex/$(NAME)
	cp $(CLSFILES) $(TEXMF)/tex/latex/$(NAME)

zip : main doc
	ln -sf . $(NAME)
	zip -r ../$(NAME)-$(VERSION).zip $(NAME)/{README.md,LICENSE,\
	$(NAME).dtx,$(NAME).pdf,$(NAME).cls,$(NAME)-*.bst,figures,\
	$(MAIN).tex,$(NAME)-extra.sty,chapters,bib,$(MAIN).pdf,\
	latexmkrc,Makefile}
	rm $(NAME)
