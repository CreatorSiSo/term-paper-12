# https://pandoc.org/MANUAL.html#option--reference-doc

mkdir _preview

quarto render --to docx --cache &&
	cd _out &&
	# soffice facharbeit-2022.docx &&
	soffice --headless --convert-to pdf facharbeit-2022.docx &&
	# evince stops watching a file if it gets deleted
	# so we can preview this copy which will never be deleted
	cp ./facharbeit-2022.pdf ../_preview/facharbeit-2022.pdf -f
