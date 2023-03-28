#import "./template.typ": *
#import "./graphs.typ": column_graph

#show: body => project(
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
  body
)

#include "chapters/01_intro.typ"
#pagebreak()

#include "chapters/02_charactaristics.typ"
#pagebreak()

#include "chapters/03_analysis.typ"
#pagebreak()

#include "chapters/04_concept.typ"
#pagebreak()

#bibliography((
	"cite/general.bib",
	"cite/standards.bib",
	"cite/books.bib"
))
#pagebreak()

// Set heading style for appendix
#set heading(numbering: (..args) => {
	let nums = args.pos()
	if nums.len() == 1 {
		return [Anhang #numbering("A", ..nums) ---]
	}
	numbering("A.1", ..nums)
})
// Reset heading counter
#counter(heading).update(())

#include "appendix/rym_overview.typ"
#pagebreak()

#include "appendix/code_examples.typ"
