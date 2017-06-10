TPL_DIR = $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
TP_DIR  = $(realpath $(TPL_DIR)/../third_party)

PAN              = pandoc

PANFLAGS         = --smart \
                   --self-contained \
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
                   --slide-level 2 \
                   --template $(TPL_DIR)/slides.html

HTMLTOPDF        = wkhtmltopdf

HTMLTOPDFFLAGS   = --page-size A4 \
                   --javascript-delay 500

HTMLTOPDF_DOC    = -T 25mm -B 25mm -L 25mm -R 25mm \
                   --print-media-type \
                   --footer-center "[page]"

HTMLTOPDF_SLIDES = --orientation Landscape

%.html: %.md
	$(PAN) $(PANFLAGS) $(PANFLAGS_DOC) -o $@ $^

%.pdf: %.html
	$(PAN) --smart --to html5 --template $(TPL_DIR)/doc_cover.html $(<:.html=.md) | \
	$(HTMLTOPDF) $(HTMLTOPDFFLAGS) $(HTMLTOPDF_DOC) cover - toc --xsl-style-sheet $(TPL_DIR)/doc_toc.xsl "file://$(WD)/$<?print-pdf" $@


%_slides.html: %_slides.md
	$(PAN) $(PANFLAGS) $(PANFLAGS_SLIDES) -o $@ $^

%_slides.pdf: %_slides.html
	$(HTMLTOPDF) $(HTMLTOPDFFLAGS) $(HTMLTOPDF_SLIDES) "file://$(WD)/$<?print-pdf" $@
