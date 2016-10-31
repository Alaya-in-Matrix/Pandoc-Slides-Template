SOURCE      = example.md
TARGET      = example
MAINFONT    = 'Noto Sans'
CJKMAINFONT = 'Noto Sans CJK SC'
MONOFONT    = 'Consolas' # font for code
LATEXENG    = xelatex

DEP=meta.yaml    \
	custom.latex \
	makefile 	 \
	ref.bib      \
	template.latex

.PHONY: all slides tidy clean

all:$(TARGET).tex $(TARGET).pdf

slides: $(TARGET).pdf

$(TARGET).pdf:$(TARGET).tex
	$(LATEXENG) $(TARGET)
	biber       $(TARGET)
	$(LATEXENG) $(TARGET)
	$(LATEXENG) $(TARGET)

$(TARGET).tex:$(SOURCE) $(DEP)
	pandoc \
		-s \
		-t beamer \
		-f markdown \
		-H custom.latex \
		--template=template.latex \
		--latex-engine=$(LATEXENG) \
		--highlight=haddock \
		-V mainfont=$(MAINFONT) \
		-V CJKmainfont=$(CJKMAINFONT) \
		-V monofont=$(MONOFONT) \
		--filter pandoc-crossref \
		--biblatex \
		-V bibliography=ref.bib \
		-V biblio-title=References \
		-V biblio-style=ieee \
		meta.yaml $< -o $@

tidy:
	find ./ -name "$(TARGET).*" | grep -vE "$(SOURCE)|$(TARGET).pdf" | xargs rm -vf

clean: tidy
	rm -vf $(TARGET).pdf
