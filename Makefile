.PHONY: all

all: gh-pages/index.html gh-pages/css/style.css gh-pages/css/styles.css

gh-pages/css/style.css: css/style.css
	rsync css/style.css gh-pages/css/style.css

gh-pages/css/styles.css: css/styles.css
	rsync css/styles.css gh-pages/css/styles.css

gh-pages/index.html: Makefile README.org
	pandoc \
	  --smart \
	  --css css/styles.css \
	  --css=css/style.css \
	  -t html5 \
	  -o gh-pages/index.html \
	README.org
