.PHONY:
all: \
  gh-pages/favicon.ico \
  gh-pages/TLC.png \
  gh-pages/index.html \
  gh-pages/invitation/index.html \
  gh-pages/css/style.css \
  gh-pages/css/styles.css

.PHONY: all
publish:
	bin/publish

gh-pages/favicon.ico: favicon.ico
	rsync favicon.ico gh-pages/favicon.ico

gh-pages/TLC.png: TLC.png
	rsync TLC.png gh-pages/TLC.png

gh-pages/css/style.css: css/style.css
	rsync css/style.css gh-pages/css/style.css

gh-pages/css/styles.css: css/styles.css
	rsync css/styles.css gh-pages/css/styles.css

gh-pages/index.html: Makefile README.org
	pandoc \
	  --smart \
	  --css=css/style.css \
	  --css=css/styles.css \
	  -t html5 \
	  -o gh-pages/index.html \
	README.org

gh-pages/invitation/index.html: Makefile invitation/index.org
	pandoc \
	  --smart \
	  --css=../css/style.css \
	  --css=../css/styles.css \
	  -t html5 \
	  -o gh-pages/invitation/index.html \
	invitation/index.org
