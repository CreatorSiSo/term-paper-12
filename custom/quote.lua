function Quoted(el)
  if el.quotetype == "DoubleQuote" then
    return {pandoc.Str("„"), pandoc.Span(el.content), pandoc.Str("”")}
  elseif el.quotetype == "SingleQuote" then
    return {pandoc.Str("‚"), pandoc.Span(el.content), pandoc.Str("’")}
	end
end
