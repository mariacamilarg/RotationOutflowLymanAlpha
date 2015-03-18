#MAKEFILE

#Name of tex file
FILE_NAME  = ms
FILE_TEX = $(FILE_NAME).tex
FILE_PDF = $(FILE_NAME).pdf

#Latex compiler
LATEX = pdflatex
#Latex editor
TEXEDIT = texstudio
#Folder of data for Figures
DATAFOLD = figures

all: $(FILE_PDF)

$(FILE_PDF) : $(FILE_TEX) references.bib
	$(LATEX) $(FILE_TEX)
	bibtex $(FILE_NAME)
	$(LATEX) $(FILE_TEX)
	$(LATEX) $(FILE_TEX)

clean:
		rm -f $(FILE_NAME).pdf
		rm -f $(FILE_NAME).aux
		rm -f $(FILE_NAME).out
		rm -f $(FILE_NAME).bbl
		rm -f $(FILE_NAME).log
		rm -f $(FILE_NAME).synctex.gz
		rm -f $(FILE_NAME).blg
		rm -f $(FILE_NAME)Notes.bib

edit:
		$(TEXEDIT) $(FILE_TEX) &

help:
		@echo -e 'Makefile Help:'
		@echo -e '\tpdflatex:\t compile the pdf file'
		@echo -e '\tclean:\t\t clean all temporal files'
		@echo -e '\tview:\t\t view the pdf file with standard viewer ($(VIEWER))'
		@echo -e '\tedit:\t\t edit the tex file with standard editor ($(TEXEDIT))'
		@echo -e '\tcompile:\t compile the required c codes in $(ACODESFOLD) and $(FCODESFOLD)'
		@echo -e '\thelp:\t\t this help!'
