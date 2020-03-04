.PHONY:
all: \
  gh-pages/favicon.ico \
  gh-pages/TLC.png \
  gh-pages/img/triplets.png \
  gh-pages/index.html \
  gh-pages/css/style.css \
  gh-pages/css/styles.css

.PHONY: all
publish:
	-scripts/publish

gh-pages/favicon.ico: favicon.ico
	-rsync --relative $< gh-pages

gh-pages/TLC.png: TLC.png
	-rsync --relative $< gh-pages

gh-pages/img/triplets.png: img/triplets.png
	-rsync --relative $< gh-pages

gh-pages/css/style.css: css/style.css
	-rsync --relative $< gh-pages

gh-pages/css/styles.css: css/styles.css
	-rsync --relative $< gh-pages

gh-pages/index.html: Makefile README.org
	-mkdir -p gh-pages
	-pandoc \
	  --standalone \
	  -t html5 \
	  -o gh-pages/index.html \
	README.org
