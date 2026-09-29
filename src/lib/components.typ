// =============================================================================
// Components that render the dictionaries in src/data/.
//
// Components take all their vertical spacing from `space` in style.typ, so
// both documents share one scale. Section headings stay in the document files.
//
// Entries that carry bullets store them as dictionaries:
//
//   (id: "…", tags: ("…",), long: […], short: […], sub: ([…],))
//
// `short` and `sub` are optional. Components take `bullets: auto` for every
// bullet in data order, or an array of ids to choose which ones appear and in
// what order. `short: true` prints each bullet's short text, or an array of ids
// shortens just those; a bullet with no short text keeps its long one.
// =============================================================================

#import "style.typ": bullets, outdent, sc, space, two-col

// Pick items from an array of dictionaries by `id`, in the order given. With no
// ids, `tags` keeps the items that carry any of those tags; with neither, every
// item is returned.
#let select(items, ..ids, tags: none) = {
  let ids = ids.pos()
  if ids.len() > 0 {
    ids.map(id => {
      let found = items.filter(i => i.id == id)
      assert(found.len() == 1, message: "select: no item with id \"" + id + "\"")
      found.first()
    })
  } else if tags != none {
    items.filter(i => i.at("tags", default: ()).any(t => t in tags))
  } else {
    items
  }
}

// `auto` keeps every item; an array of ids picks those, so `()` picks none.
#let _pick(items, which) = if which == auto { items } else { which.map(id => select(items, id).first()) }

// "Title, detail  dates", with the detail and dates both optional.
#let _role(r) = {
  emph(r.title)
  if "detail" in r [, #r.detail]
  if "dates" in r [ #h(1fr) #r.dates]
}

// A short variant stands alone, so it drops the nested bullets too.
#let _item(b, short) = {
  let want = if type(short) == array { b.id in short } else { short }
  if want and "short" in b { b.short } else if "sub" in b [#b.long #list(..b.sub)] else { b.long }
}

// Head lines, then the bullets as a list. The head is a sticky block so it
// never ends a page without at least the start of its bullets. Its spacing
// reproduces a plain paragraph's: `space.list` to the bullets, a full
// `space.entry` to the next entry when there are none, and `space.list` above,
// which the larger gap below a list or a section title's `space.title` wins
// over.
#let _entry(lines, items, short) = {
  let has = items.len() > 0
  block(
    above: space.list,
    below: if has { space.list } else { space.entry },
    sticky: has,
    lines.join(linebreak()),
  )
  if has { list(..items.map(b => _item(b, short))) }
}

// -----------------------------------------------------------------------------
// Name, contact icons and the rule beneath them.
// -----------------------------------------------------------------------------
#let header(c) = outdent(block(below: 0pt)[
  #set par(justify: false, spacing: 0pt)
  #set block(spacing: 0pt)

  #align(center, text(size: 12pt, weight: "bold", c.name))
  #if "location" in c {
    v(4pt)
    align(center, c.location)
  }
  #v(7pt)
  #align(center, grid(
    columns: c.links.len(),
    column-gutter: 0.35in,
    row-gutter: 3pt,
    align: center + horizon,

    // An icon is either a file in src/assets/ or content drawn in place.
    // image() resolves paths relative to this file, not the calling document.
    ..c.links.map(l => link(l.url, if type(l.icon) == str {
      image("../assets/" + l.icon, width: l.icon-width)
    } else {
      l.icon
    })),
    ..c.links.map(l => link(l.url, l.label)),
  ))
  #block(above: 3pt, below: 0pt, line(length: 100%, stroke: 0.4pt))
  // res.cls draws \fullline with \nointerlineskip, so the first section title
  // follows the rule more closely than a full \sectionskip would place it.
  #v(-3pt)
])

// -----------------------------------------------------------------------------
// A job or research position: the organization in bold, one line per role,
// then bullets. An entry-level `dates` goes on the organization line instead
// of the role line. `org: false` drops the organization line, for an entry
// that continues the previous one's organization.
// -----------------------------------------------------------------------------
#let job(j, bullets: auto, short: false, org: true) = {
  let lines = ()
  if org {
    lines.push(if "dates" in j [*#j.org* #h(1fr) #j.dates] else [*#j.org*])
  }
  lines += j.roles.map(_role)
  _entry(lines, _pick(j.at("bullets", default: ()), bullets), short)
}

// A degree. Passing a `research` entry folds its first role and bullets in
// under the degree, as the résumé's combined education and research section
// does; the department then follows the role and the advisors line is dropped,
// since the role's detail already names the labs. The dissertation is dropped
// there too, to keep the résumé short; it prints only in the plain form.
#let degree(e, research: none, bullets: auto, short: false) = {
  let lines = ([*#e.org*], _role((title: e.degree, detail: e.field, dates: e.dates)))
  let items = e.at("bullets", default: ())
  if research != none {
    let r = research.roles.first()
    lines.push(_role((title: r.title, detail: r.detail)))
    lines.push(e.department)
    items = research.bullets
  } else {
    for k in ("department", "advisors") {
      if k in e { lines.push(e.at(k)) }
    }
    if "dissertation" in e { lines.push([Dissertation: "#e.dissertation"]) }
  }
  _entry(lines, _pick(items, bullets), short)
}

// -----------------------------------------------------------------------------
// The original used \bibliographystyle{acm} with bibentry to inline chosen
// entries from bibliography.bib, each wrapped in \hangpara{10mm}{1}. The ACM
// style is reproduced literally — small-caps authors, italic journal and
// volume, month/year in parens, then the doi on its own line — so that the
// author's own name can stay bold, the way it was marked up in the .bib.
// Each entry is a plain paragraph, so entries sit `space.entry` apart and the
// first one follows its section title like any other paragraph.
// -----------------------------------------------------------------------------
#let pub(p) = par(hanging-indent: 10mm)[
  #sc(p.authors) #p.title #p.venue \
  doi: #link(p.doi)[#p.doi]
]

// "Title." Event, Date (Poster). An entry with no public title prints its
// description in place of the quoted title, and no note, since the
// description already says what it was.
#let talk(t) = {
  if "title" in t {
    let note = (poster: [ (Poster)], moderator: [ (Moderator)]).at(t.format, default: none)
    par["#t.title." #t.event, #t.date#note.]
  } else {
    par[#t.description, #t.event, #t.date.]
  }
}

#let award(a) = par[*#a.title* #h(1fr) #a.year \ #a.org]

// The organization and role, then each course with its term. A course with
// bullets gets a list; consecutive courses without bullets share one
// paragraph, a line each.
#let teaching(t, short: false) = {
  [*#t.org*, #t.role]
  linebreak()
  for (i, c) in t.courses.enumerate() {
    if i > 0 {
      if t.courses.at(i - 1).bullets.len() > 0 { parbreak() } else { linebreak() }
    }
    [#c.title #h(1fr) #c.term]
    if c.bullets.len() > 0 { list(..c.bullets.map(b => _item(b, short))) }
  }
}

// One line per category. A category either lists items directly or breaks
// them into indented levels on the lines below it.
#let skills(s) = {
  // Skill names are short and often technical; never split one across lines.
  set text(hyphenate: false)
  let lines = ()
  for c in s {
    if "levels" in c {
      lines.push([*#c.label:*])
      lines += c.levels.map(l => [#h(10mm)#l.label: #l.items.join([, ])])
    } else {
      lines.push([*#c.label:* #c.items.join([, ])])
    }
  }
  lines.join(linebreak())
}

// Each area's courses in two columns, the left one taking the extra course
// when the count is odd. An area with `columns: 1` lists them one per line
// instead, indented to match the left column.
//
// Each area is one unbreakable block so its label never strands at the foot of
// a page. The block spacing reproduces the original flow, where a one-column
// area shared a paragraph with the next label (5pt of leading) and a two-column
// block ended with 4pt below.
#let coursework(areas) = for a in areas {
  let one = a.at("columns", default: 2) == 1
  block(breakable: false, above: 4pt, below: if one { 5pt } else { 4pt }, {
    [*#a.area*]
    if one {
      linebreak()
      a.courses.map(c => [#h(10mm)• #c]).join(linebreak())
    } else {
      let n = calc.ceil(a.courses.len() / 2)
      two-col(bullets(..a.courses.slice(0, n)), bullets(..a.courses.slice(n)))
    }
  })
}
