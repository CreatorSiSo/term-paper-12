# https://pandoc.org/MANUAL.html#option--reference-doc

quarto render &&
	cd _out &&
	# soffice Facharbeit.docx &&
	soffice --headless --convert-to pdf Facharbeit.docx &&
	evince Facharbeit.pdf
