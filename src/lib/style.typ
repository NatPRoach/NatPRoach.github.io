// =============================================================================
// Shared page style and helpers for the résumé and CV.
//
//   #import "/lib/style.typ": *
//   #show: template.with(title: "…")
//
// The page geometry is translated from the original LaTeX résumé class
// (res.cls, "centered" name + "overlapped" section titles). Vertical spacing
// comes from the single scale in `space` below, shared by every document.
//
// Geometry notes carried over from res.cls and the original résumé:
//   * res.cls sets \resumewidth 6.5in and \sectionwidth 0.5in, so body text is
//     6.0in wide with a 0.5in gutter that section titles hang back into.
//     resume.tex then widens \textwidth by 0.8in -> a 6.8in body.
//   * Vertically res.cls sets \textheight 9in; resume.tex adds 1.2in and pulls
//     \topmargin back 0.6in, leaving a 0.4in band top and bottom.
//   * The page margins below encode exactly that: body text starts 1.1in in,
//     section titles sit at 0.6in, and the header spans the full 7.3in.
//   * 10pt text on a 12pt baseline (\baselineskip at 10pt), which the leading
//     below reproduces.
// =============================================================================

// The one vertical spacing scale. Every gap between blocks in both documents
// comes from here, so change a value here rather than adding a #v() nudge.
//
// Typst separates two paragraphs by `par.spacing`, but a block next to a
// paragraph uses the block's own `above`/`below`, which is how a list hugs the
// head lines of its entry while entries stay a full line apart.
#let space = (
  entry: 12pt,   // between entries, paragraphs and publications: one line
  list: 5pt,     // from an entry's head lines to its first bullet
  item: 6pt,     // between bullets, nested or not
  section: 16pt, // above a section title
  title: 5pt,    // below a section title
)

#let gutter = 0.5in // res.cls \sectionwidth for the "overlapped" style

// Pull content out into the section-title gutter (LaTeX's \hbox to 0pt{\hss ...}).
#let outdent(body) = pad(left: -gutter, body)

// URW Palladio L has no bold-italic face, so \textbf inside a \sl group fell
// back to upright bold in the original PDF. This preserves that; swap in
// `text(weight: "bold", body)` if you would rather have true bold-italic.
#let bu(body) = text(style: "normal", weight: "bold", body)

// The `palatino` package renders \textsc through a virtual font that simply
// scales URW Palladio's capitals to 80%, which is why the original PDF embeds
// no separate small-caps face. macOS Palatino has no `smcp` table and Typst's
// `smallcaps()` is a no-op with it, so reproduce that same trick here.
#let sc(body) = {
  show regex("[a-z]+"): m => text(size: 0.8em, upper(m.text))
  body
}

// Two columns of \textbullet lines, from cv.tex's paired 0.5\textwidth
// minipages. The left minipage indents its bullets by \hspace*{10mm}; the right
// one does not, and the interword space between the two boxes is what puts
// column two a couple of points past the halfway mark.
#let two-col(left, right) = block(above: 5pt, below: 4pt, grid(
  columns: (1fr, 1fr),
  column-gutter: 2.5pt,
  align: top,
  pad(left: 10mm, left), right,
))

#let bullets(..items) = items.pos().map(i => [• #i]).join(linebreak())

// Page, text and list setup shared by every document.
#let template(doc, title: none) = {
  set document(title: title, author: "Nathan P. Roach")

  set page(
    paper: "us-letter",
    margin: (top: 0.4in, bottom: 0.4in, left: 1.1in, right: 0.6in),
  )

  // \usepackage{palatino} -> URW Palladio L; TeX Gyre Pagella is its clone.
  set text(font: "TeX Gyre Pagella", size: 10pt, lang: "en", hyphenate: true)
  set par(justify: true, leading: 0.50em, spacing: space.entry)
  set block(spacing: space.entry)

  // Bullet then en dash, indented as LaTeX's itemize (\leftmargini 2.5em).
  set list(marker: ([•], [--]), indent: 1.4em, body-indent: 0.5em, spacing: space.item)

  // A list hugs the entry above it and leaves a full entry gap below. A nested
  // list sits in its parent item like one more bullet.
  show list: it => {
    show list: inner => block(above: space.item, below: space.item, inner)
    block(above: space.list, below: space.entry, it)
  }

  // \sectionfont is \bf; \sectionskip is 2.5ex plus 1ex minus -.2ex. Sticky
  // keeps a heading on the same page as whatever follows it.
  show heading: it => block(
    above: space.section,
    below: space.title,
    sticky: true,
    outdent(text(weight: "bold", size: 10pt, it.body)),
  )

  doc
}
