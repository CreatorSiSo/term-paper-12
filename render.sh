# https://pandoc.org/MANUAL.html#option--reference-doc

mkdir _preview

quarto render --to docx &&
	cd _out &&
	# soffice Facharbeit.docx &&
	soffice --headless --convert-to pdf Facharbeit.docx &&
	cp ./Facharbeit.pdf ../_preview/Facharbeit.pdf -f #&&
# evince Facharbeit.pdf
