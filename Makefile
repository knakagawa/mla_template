SECTION_TEX_FILES := $(patsubst %.md,%.tex,$(wildcard *.md))

%.tex : %.md
	pandoc --biblatex -o $@ $<

clean:
	rm paper.aux
	rm paper.bbl
	rm paper.bcf
	rm paper.blg
	rm paper.dvi
	rm paper.log
	rm paper.out
	rm paper.run.xml
	rm paper.pdf
	rm $(SECTION_TEX_FILES)

all:
	make $(SECTION_TEX_FILES)
	latex paper.tex
	biber paper
	latex paper.tex
	pdflatex paper.tex
	wc -w *.md # get a general idea of the wordcount of the paper

.DEFAULT_GOAL := all
