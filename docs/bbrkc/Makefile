all: pdf

R_OPTS=--no-save --no-restore --no-init-file --no-site-file

pdf: bbrkc.Rmd
	R ${R_OPTS} -e 'library(knitr); knit("bbrkc.Rmd"); knit("app.Rmd")' 
	pandoc -V geometry:margin=1in bbrkc.md -o bbrkc.pdf --bibliography=../references/Gmacs.bib 
	pandoc -V geometry:margin=1in app.md -o app.pdf 

clean:
	rm bbrkc.md 
	rm app.md 
