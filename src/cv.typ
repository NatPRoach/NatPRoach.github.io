// =============================================================================
// Nathan P. Roach — Curriculum Vitae
//
// Translated from old/cv.tex, which used res.cls in its default configuration
// ("centered" name + "overlapped" section titles). Page geometry and the
// spacing scale live in lib/style.typ.
//
//   Build:   src/build.sh src/cv.typ
//   Watch:   typst watch --root src --font-path src/fonts --ignore-system-fonts src/cv.typ
//
// The master document: renders everything in data/. Pages break wherever the
// content falls; headings are sticky, so a section title never strands at the
// foot of a page.
// =============================================================================

#import "/lib/style.typ": *
#import "/lib/components.typ": *
#import "/lib/data.typ": data as d

#show: template.with(title: "Nathan P. Roach — Curriculum Vitae")

#header(d.contact)

= PROFESSIONAL EXPERIENCE

#for j in d.experience.values() { job(j) }

= EDUCATION

#degree(d.education.jhu)

#degree(d.education.unc, bullets: ())

= RESEARCH EXPERIENCE

#job(d.research.jhu)

#job(d.research.unc-jacobson)

// Still at UNC, so the organization line is not repeated.
#job(d.research.unc-hedrick, org: false)

#job(d.research.unc-hollins, org: false)

#job(d.research.hwi)

= TECHNICAL SKILLS

#skills(d.skills)

= HONORS AND AWARDS

#for a in d.awards { award(a) }

= RELEVANT COURSEWORK

#coursework(d.coursework)

= PUBLICATIONS

#for p in d.publications { pub(p) }

= CONFERENCE PRESENTATIONS

#for t in d.talks.filter(t => t.kind == "conference") { talk(t) }

= INTERNAL PRESENTATIONS

#for t in d.talks.filter(t => t.kind == "internal") { talk(t) }

= TEACHING EXPERIENCE

#for t in d.teaching.values() { teaching(t) }
