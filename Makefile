.PHONY: all clean

all: main.pdf

main.pdf: main.tex ustcthesis.cls
	latexmk -xelatex -shell-escape -use-make $<
clean:
	latexmk -C
