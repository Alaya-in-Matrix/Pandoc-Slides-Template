# README

Pandoc template for slides used for my weekly report in my research group meeting.


## Feature

- Use beamer
- pandoc-crossref for cross referenc
- biblatex for bibilography

## Why not using pandoc-citeproc and generate pdf directly?

When there are many reference papers that I need multiple pages to present all
references, `pandoc-citeproc` didn't work well for me.

## How to use

- Edit meta.yaml for title, author, date
- Edit beamer.tex to modify the beamer template(I don't know latex...)
- Edit custom.latex to add custom packages
- Edit makefile for markdown file name, target pdf file name, font...
