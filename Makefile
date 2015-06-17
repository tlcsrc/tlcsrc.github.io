.PHONY: all

all: gh-pages/index.html gh-pages/css/style.css

gh-pages/css/style.css: css/style.css
	rsync css/style.css gh-pages/css/style.css

gh-pages/index.html: Makefile README.org
	pandoc --smart --css=css/style.css README.org -o gh-pages/index.html
