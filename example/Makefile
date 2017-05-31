SRC  = $(wildcard *.md)
HTML = $(SRC:.md=.html)
PDF  = $(SRC:.md=.pdf)

REFS = references.bib

.PHONY: all clean

all: $(HTML) $(PDF)

clean:
	$(RM) $(HTML) $(PDF)

WD := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
include ../template/settings.mk
