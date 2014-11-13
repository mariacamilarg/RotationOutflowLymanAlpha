#MAKEFILE

#Name of tex file
FILE_TEX  = ms
#Latex compiler
LATEX = pdflatex
#Latex editor
TEXEDIT = texstudio
#Folder of data for Figures
DATAFOLD = figures


pdflatex:	$(FILE_TEX).tex  
		$(LATEX) $(FILE_TEX).tex 
		bibtex ${FILE_TEX}
		$(LATEX) $(FILE_TEX).tex 
		$(LATEX) $(FILE_TEX).tex 

clean:
		rm -f $(FILE_TEX).aux
		rm -f $(FILE_TEX).out
		rm -f $(FILE_TEX).bbl
		rm -f $(FILE_TEX).log
		rm -f $(FILE_TEX).synctex.gz

edit:
		$(TEXEDIT) $(FILE_TEX).tex &

help:
		@echo -e 'Makefile Help:'
		@echo -e '\tpdflatex:\t compile the pdf file'
		@echo -e '\tclean:\t\t clean all temporal files'
		@echo -e '\tview:\t\t view the pdf file with standard viewer ($(VIEWER))'
		@echo -e '\tedit:\t\t edit the tex file with standard editor ($(TEXEDIT))'
		@echo -e '\tcompile:\t compile the required c codes in $(ACODESFOLD) and $(FCODESFOLD)'
		@echo -e '\thelp:\t\t this help!'
