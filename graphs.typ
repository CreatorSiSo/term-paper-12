#let column_graph(labels_x: (), labels_y: (), data: (), col_align: bottom) = {
	let max = data.fold(0, (accum, num) => {
		if num > accum { num } else { accum }
	})

	set text(size: 9pt)
	let full_w = rect.with(width: 100%, height: auto, inset: 0pt)
	let full_h = rect.with(width: auto, height: 100%, inset: 0pt)

	style(styles => {
		let labels = (
			x: stack(
				dir: ttb,
				spacing: 2pt,
				..labels_x.map(label => rotate(
						origin: top + right,
						20deg,
						box(height: 10pt, stroke: blue, label)
					)
				)
			),
			y: [testing]
		)
		let sizes = (
			x: measure(labels.x, styles),
			y: measure(labels.y, styles),
		)
		let labels = (
			x: box(stroke: red, height: sizes.x.width, rotate(-90deg, align(right + top, labels.x))),
			y: box(stroke: red, height: sizes.y.height, rotate(-90deg, labels.y)),
		)

		let cols = stack(
			dir: ltr,
			spacing: 2pt,
			..data.map(num => {
				set align(col_align)
				set block(spacing: 0pt)
				rect(
					width: 10pt,
					height: 95% * (num / max),
					fill: blue,
				)
				set align(center)
				rect(
					width: 1pt,
					height: 4pt,
					fill: black
				)
			})
		)

		box(
			grid(
				columns: (auto, 1fr),
				rows: (8cm, auto),
				labels.y,
				box(stroke: black, cols),
				[],
				labels.x,
			)
		)
	})
}

#let data = json("./data/stackoverflow-survey-2022.json")
#column_graph(
	labels_x: data.map(lang => lang.name),
	data: data.map(lang => lang.votes),
)
