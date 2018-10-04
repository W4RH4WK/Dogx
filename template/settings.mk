TPL_DIR = $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
TP_DIR  = $(realpath $(TPL_DIR)/../third_party)

PAN              = pandoc

PANFLAGS         = --self-contained \
                   --katex \
                   --no-highlight \
                   --filter pandoc-fignos \
                   -M fignos-cleveref=On \
                   -M fignos-plus-name=Figure \
                   -M fignos-star-name=Figure \
                   --filter $(TPL_DIR)/pandoc-embed \
                   --filter $(TPL_DIR)/pandoc-exec \
                   --filter $(TPL_DIR)/pandoc-latex \
                   --variable TP_DIR:$(TP_DIR) \
                   --variable TPL_DIR:$(TPL_DIR)

ifdef REFS
	PANFLAGS := $(PANFLAGS) --bibliography $(REFS)
endif

PANFLAGS_DOC     = --to html5 \
                   --number-sections \
                   --section-divs \
                   --toc \
                   --toc-depth 2 \
                   --filter $(TPL_DIR)/pandoc-prism \
                   --template $(TPL_DIR)/doc.html

PANFLAGS_SLIDES  = --to revealjs \
                   --toc \
                   --slide-level 2 \
                   --template $(TPL_DIR)/slides.html

HTMLTOPDF        = chromium

HTMLTOPDFFLAGS   = --headless \
                   --disable-gpu \
                   --virtual-time-budget=1000

%.html: %.md
	$(PAN) $(PANFLAGS) $(PANFLAGS_DOC) -o $@ $^

%.pdf: %.html
	$(HTMLTOPDF) $(HTMLTOPDFFLAGS) --print-to-pdf=$@ "file://$(WD)/$<?print-pdf"

%_slides.html: %_slides.md
	$(PAN) $(PANFLAGS) $(PANFLAGS_SLIDES) -o $@ $^
