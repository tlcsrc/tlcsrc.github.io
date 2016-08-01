.PHONY:
all: \
  gh-pages/favicon.ico \
  gh-pages/TLC.png \
  gh-pages/index.html \
  gh-pages/css/style.css \
  gh-pages/css/styles.css

.PHONY: all
publish:
	-bin/publish

gh-pages/favicon.ico: favicon.ico
	-rsync favicon.ico gh-pages/favicon.ico

gh-pages/TLC.png: TLC.png
	-rsync TLC.png gh-pages/TLC.png

gh-pages/css/style.css: css/style.css
	-mkdir -p gh-pages/css
	-rsync css/style.css gh-pages/css/style.css

gh-pages/css/styles.css: css/styles.css
	-mkdir -p gh-pages/css
	-rsync css/styles.css gh-pages/css/styles.css

gh-pages/index.html: Makefile README.org
	-mkdir -p gh-pages
	-pandoc \
	  --smart \
	  --css=css/styles.css \
	  --css=css/style.css \
	  -t html5 \
	  -o gh-pages/index.html \
	README.org
