// Site favicon: an "NR" monogram in the résumé's typeface on the site's
// heading color (--heading in docs/assets/css/override_style.css).
//
// Regenerate docs/favicon.ico, docs/favicon.svg and docs/apple-touch-icon.png
// with the commands in CLAUDE.md. This lives in src/assets/ rather than src/
// so build.sh doesn't compile it as a document.

#set page(width: 64pt, height: 64pt, margin: 0pt, fill: none)
#set text(font: "TeX Gyre Pagella", weight: "bold", fill: white)

#box(
  width: 100%,
  height: 100%,
  radius: 10pt,
  fill: rgb("#222"),
  align(center + horizon, text(size: 34pt, tracking: -1pt)[NR]),
)
