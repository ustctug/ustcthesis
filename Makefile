.PHONY : main cls doc clean all inst install distclean zip FORCE_MAKE

NAME = ustcthesis
VERSION=$(shell cat ustcthesis.dtx | egrep -o "\[\d\d\d\d/\d\d\/\d\d v.+\]" | egrep -o "v\S+")
UTREE = $(shell kpsewhich --var-value TEXMFHOME)
LOCAL = $(shell kpsewhich --var-value TEXMFLOCAL)

main : cls FORCE_MAKE
	latexmk -xelatex -shell-escape -use-make

all : main doc

cls : $(NAME).cls

doc : $(NAME).pdf

$(NAME).cls : $(NAME).dtx
	xetex $<

$(NAME).pdf : $(NAME).dtx FORCE_MAKE
	latexmk -xelatex $<

clean :
	latexmk -c
	latexmk -c $(NAME).dtx

distclean :
	latexmk -C
	latexmk -C $(NAME).dtx

inst : cls doc
	mkdir -p $(UTREE)/{doc,source,tex}/latex/$(NAME)
	mkdir -p $(UTREE)/bibtex/bst/$(NAME)
	cp $(NAME).pdf $(UTREE)/doc/latex/$(NAME)
	cp $(NAME).dtx $(UTREE)/source/latex/$(NAME)
	cp $(NAME).cls $(UTREE)/tex/latex/$(NAME)
	cp ustc{numerical,authoryear}.bst $(UTREE)/bibtex/bst/$(NAME)

install : cls doc
	mkdir -p $(LOCAL)/{doc,source,tex}/latex/$(NAME)
	mkdir -p $(LOCAL)/bibtex/bst/$(NAME)
	cp $(NAME).dtx $(LOCAL)/source/latex/$(NAME)
	cp $(NAME).cls $(LOCAL)/tex/latex/$(NAME)
	cp $(NAME).pdf $(LOCAL)/doc/latex/$(NAME)
	cp ustc{numerical,authoryear}.bst $(LOCAL)/bibtex/bst/$(NAME)

zip : cls doc
	mkdir $(NAME)
	cp -r $(NAME).{dtx,cls,pdf} ustc*.bst README.md main.tex main.pdf ustcextra.sty \
		bib chapters figures .latexmkrc Makefile $(NAME)
	zip -r ../$(NAME)-$(VERSION).zip $(NAME)
	rm -r $(NAME)
