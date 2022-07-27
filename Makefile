FILENAME=hungryserv
LATEX_COMPILER=xelatex -shell-escape

all: $(FILENAME).pdf

examples/%.pdf: examples/%.tex
	$(LATEX_COMPILER) -output-directory=examples $<

%.pdf: %.tex beeper.cls
	$(LATEX_COMPILER) $<
	$(LATEX_COMPILER) $<

clean:
	rm -f *.log *.aux *.log *.out *.bbl *.blg *.nav *.snm *.toc

.PHONY: all clean
