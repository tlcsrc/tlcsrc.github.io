index.html: Makefile README.org css/style.css
	pandoc --css=css/style.css README.org -o index.html
