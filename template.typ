#let project(
  institution_hierarchy: ("Institution", "Department", "Area"),
  subject: "Schulfach",
  title: "Titel",
  author: "Verfasser",
  class: "Klasse",
  mentor: "Betreuer",
  place: "Ort",
  date: "Datum",
  body
) = {
  set document(author: author, title: title)
  set page(
    paper: "a4",
    margin: (
      left: 2.5cm,
      right: 2cm,
      top: 2cm,
      bottom: 2cm,
    )
  )
  set text(font: "Merriweather", lang: "de", region: "DE")

  // Set paragraph spacing
  show par: set block(above: 1.6em, below: 1.6em)
  // Set space between lines
  set par(leading: 1.2em)

  let stroke = (
    top: luma(250) + 1pt,
    x: luma(235) + 1pt,
    bottom: luma(220) + 1pt,
  )

  // Set style for raw blocks:
  // ```lang
  // content...
  // ```
  show raw: r => {
    set text(font: "Fira Code", size: 9pt)
    set text(font: "Fira Code", ligatures: false, size: 9pt)
    set par(leading: 1.1em)
    r
  }
  show raw.where(block: true): block.with(
    width: 100%,
    fill: luma(240),
    inset: (x: 10pt, y: 9pt),
    stroke: stroke,
    radius: 3pt,
  )
  show raw.where(block: false): box.with(
    fill: luma(240),
    stroke: stroke,
    inset: (x: 3.5pt),
    outset: (y: 3.5pt),
    radius: 3pt,
  )

  // Hierarchy of institutions
  for institution in institution_hierarchy {
    institution + "\n"
  }

  align(
    horizon,
    stack(
      spacing: 4em,
      text(16pt, weight: 600, "Facharbeit im Fach " + subject),
      text(18pt, weight: 700, title),
    )
  )

  {
    set align(bottom)
    set terms(tight: false, spacing: 1em)

    [
      / Verfasser: #author\
      / Klasse: #class \
      / Betreuer: #mentor \
      / Ort, Datum: #place, #date \
    ]
  }

  pagebreak()

	{
		// Use consistent indent for items with depth 2
		show hide: _ => h(1em)

		outline(
			depth: 2,
			indent: true,
		)
	}

  pagebreak()

  // Enable page numbers
  set page(
    numbering: "1",
    number-align: end,
  )
	// Start with page number 1 on first content page
  counter(page).update(1)

  // Set heading numbering style
  set heading(numbering: "1.1")

  set par(justify: true)

  body
}
