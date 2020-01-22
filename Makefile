# .SUFFIXES: .html .md
SRCS := $(wildcard markdown/*.md)
HTML := $(SRCS:markdown/%.md=%.html)
vpath %.md markdown
vpath %.html html

%.html: %.md
	pandoc --standalone --slide-level 2 -t revealjs -o docs/$@ $<

default: example.html

build: $(HTML) index.md
	pandoc --standalone --slide-level 2  -t revealjs -o docs/index.html index.md
	cp -R images reveal.js docs/
