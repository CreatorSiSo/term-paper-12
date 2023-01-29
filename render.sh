# https://pandoc.org/MANUAL.html#option--reference-doc

mkdir _preview

quarto render --to docx --cache &&
	cd _out &&
	# soffice Facharbeit.docx &&
	soffice --headless --convert-to pdf Facharbeit.docx &&
	# evince stops watching a file if it gets deleted
	# so we can preview this copy which will never be deleted
	cp ./Facharbeit.pdf ../_preview/Facharbeit.pdf -f
