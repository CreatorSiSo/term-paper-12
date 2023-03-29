#let project(
  institution_hierarchy: ("Institution", "Department", "Area"),
  subject: "Schulfach",
  title: "Titel",
  author: "Verfasser",
  class: "Klasse",
  mentor: "Betreuer",
  place: "Ort",
  date: "Datum",
	bibliographies: (),
  body: [],
	appendix: []
) = {
	// --- General Styles ---

  set page(
    paper: "a4",
    margin: (
      left: 2.5cm,
      right: 2cm,
      top: 2cm,
      bottom: 2cm,
    )
  )
  set text(font: "Merriweather", size: 10.2pt, lang: "de", region: "DE")

  // Set paragraph spacing
  show par: set block(above: 1.6em, below: 1.6em)
  // Set space between lines
  set par(leading: 1.2em)

	// Set heading styles
	show heading.where(level: 1): h => {
		set block(below: 1.8em)
		h
	}

  // Set style for raw blocks:
  // ```lang
  // content...
  // ```
  show raw: r => {
    set text(font: "Fira Code", size: 9pt)
    set par(leading: 1em)
    r
  }
	let stroke = (
    top: luma(240) + 1pt,
    x: luma(240) + 1pt,
    bottom: luma(225) + 1pt,
  )
  show raw.where(block: true): block.with(
    width: 100%,
    fill: luma(245),
    inset: (x: 10pt, y: 9pt),
    stroke: stroke,
    radius: 3pt,
  )
  show raw.where(block: false): box.with(
    fill: luma(245),
    stroke: stroke,
    inset: (x: 3.5pt),
    outset: (y: 3.5pt),
    radius: 3pt,
  )

	// Set table styles
	set figure(gap: 1.4em)
	show figure: f => {
		set block(above: 2em, below: 2em)
		f
	}
	set table(rows: 2.2em, align: horizon, stroke: luma(100))

	// --- Content ---

  set document(author: author, title: title)

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

	// Outline styles
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

  // Main body styles
  set heading(numbering: "1.1")
  set par(justify: true)

  body

	pagebreak()

	// Bibliography styles
	{
		set par(justify: false)
		bibliography(
			title: "Quellenverzeichnis",
			bibliographies
		)
	}

	pagebreak()

	// Appendix heading style
	set heading(numbering: (..args) => {
		let nums = args.pos()
		if nums.len() == 1 {
			return [Anhang #numbering("A", ..nums) ---]
		}
		numbering("A.1", ..nums)
	})
	// Reset heading counter
	counter(heading).update(())

	appendix
}

#let TODO(body) = underline(text(fill: red)[TODO: #body.])
#let jb = linebreak(justify: true)
