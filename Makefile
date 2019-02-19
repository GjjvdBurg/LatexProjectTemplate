PDFS = $(patsubst %.tex,%.pdf,$(wildcard *.tex))
RAW_IMAGE_DIR=./raw_images/

.PHONY: all clean images total

total: images $(PDFS)

all: $(PDFS)

images:
	$(MAKE) -C $(RAW_IMAGE_DIR) all

%.pdf: %.tex
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode\
		--shell-escape" $<

clean:
	$(MAKE) -C $(RAW_IMAGE_DIR) clean
	latexmk -CA

# only does the diff for the first target in $(PDFS)
diff: $(PDFS)
	git-latexdiff --main $<.tex -v -o $<_changes.pdf \
		HEAD --
	rm $<_changes.pdf
	cp $<.pdf $<_changes.pdf
	$(MAKE) $<
