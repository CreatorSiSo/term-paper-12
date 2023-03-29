#import "./template.typ": *
#import "./graphs.typ": column_graph

#project(
  institution_hierarchy: (
    "Berufliches Schulzentrum für Bau und Technik Dresden",
    "Fachoberschule",
    "Fachrichtung Technik"
  ),
  subject: "Informatik",
  title: "Merkmale und Konzepte einer\nProgrammiersprache der nächsten Generation",
  author: "Simon Sommer",
  class: "FOS21B",
  mentor: "Herr Rottmann",
  place: "Dresden",
  date: "26.03.2023",
	bibliographies: (
		"cite/general.bib",
		"cite/standards.bib",
		"cite/books.bib"
	),
  body: [
		#include "chapters/01_intro.typ"
		#pagebreak()
		#include "chapters/02_charactaristics.typ"
		#pagebreak()
		#include "chapters/03_analysis.typ"
		#pagebreak()
		#include "chapters/04_concept.typ"
		#pagebreak()
		#include "chapters/05_conclusion.typ"
	],
	appendix: [
		#include "appendix/rym_overview.typ"
		#pagebreak()
		#include "appendix/code_examples.typ"
	]
)
