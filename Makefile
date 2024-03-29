paper:
	rm  -f paper.pdf
	latexmk --pvc --pdf --halt-on-error paper.tex
	killall Skim
diff: 
	git latexdiff --latexdiff-flatten --main paper.tex HEAD --
notes:
	rm  -f notes.pdf
	latexmk --pvc --pdf --halt-on-error notes.tex
	killall Skim
talk:
	rm  -f talk.pdf
	latexmk --pvc --pdf --halt-on-error talk.tex
	killall Skim
clean:
	latexmk -c

publish:
	cp paper.pdf DRAFT.pdf
	#cp main.pdf ${HOME}/Public/papers/.pdf && cp talk.pdf ${HOME}/Public/papers/talk.pdf && (cd ${HOME}/Public; make)

zip:
	zip main.zip abstract.tex paper.tex intro.tex 
	rm -rf /tmp/main; mkdir /tmp/main; 
	bash -c 'cd /tmp/main; unzip ~/1mm/main.zip; pdflatexn paper'

present:
	presentation.py -p 0 -d 15 talk.pdf 2>/dev/null

takemacros:
	mv ${HOME}/cvs/seqcomp/paper/macros.sty ${HOME}/cvs/seqcomp/paper/bib.bib .
	(cd ${HOME}/cvs/seqcomp/paper; ln -s ${HOME}/cvs/nonmca/bib.bib .; ln -s ${HOME}/cvs/nonmca/macros.sty .)
