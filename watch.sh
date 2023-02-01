evince _preview/facharbeit-2022.pdf &
exa --git-ignore --no-filesize --no-time --no-permissions --no-user custom/reference-doc.docx _quarto.yml cite/*.bib index.qmd ./**/*.qmd | entr ./render.sh
