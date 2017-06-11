# README

My pandoc template for slides and article reports.

There is also an experimental supprot for IEEE style papers.

## Dependency

- Use beamer for slides
- pandoc-crossref for cross referenc
- biblatex for bibilography, I use biber.

## Why not using pandoc-citeproc and generate pdf directly?

When there are many reference papers that I need multiple pages to present all
references, `pandoc-citeproc` didn't work well for beamer slides.

## How to use

- Edit meta.yaml for title, author, date
- Edit beamer.tex to modify the beamer template(I don't know latex...)
- Edit custom.latex to add custom packages
- Edit makefile for markdown file name, target pdf file name, font...
