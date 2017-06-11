SOURCE      = paper.md
TARGET      = paper
LATEXENG    = pdflatex

DEP=meta.yaml    \
	custom.latex \
	makefile 	 \
	ref.bib      \
	template.latex

.PHONY: all tidy clean

all:$(TARGET).tex $(TARGET).pdf

$(TARGET).pdf:$(TARGET).tex
	$(LATEXENG) $(TARGET)
	biber       $(TARGET)
	$(LATEXENG) $(TARGET)

$(TARGET).tex:$(SOURCE) $(DEP)
	pandoc \
		-f markdown \
		-H custom.latex \
		--template=template.latex \
		--latex-engine=$(LATEXENG) \
		--filter pandoc-crossref \
		--biblatex \
		-V bibliography=ref.bib \
		-V biblio-style=ieee \
		meta.yaml $< -o $@

tidy:
	find ./ -name "$(TARGET).*" | grep -vE "$(SOURCE)|$(TARGET).pdf" | xargs rm -vf

clean: tidy
	rm -vf $(TARGET).pdf
