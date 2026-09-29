// =============================================================================
// Nathan P. Roach — Résumé
//
// Translated from old/resume.tex, which used res.cls in its default configuration
// ("centered" name + "overlapped" section titles).
//
//   Build:   src/build.sh src/resume.typ
//   Watch:   typst watch --root src --font-path src/fonts --ignore-system-fonts src/resume.typ
//
// Page geometry and the spacing scale live in lib/style.typ. Content
// lives in data/; this file picks the entries and bullets to show, in order.
// Pages break wherever the content falls; headings are sticky, so a section
// title never strands at the foot of a page.
// =============================================================================

#import "/lib/style.typ": *
#import "/lib/components.typ": *
#import "/lib/data.typ": data as d

#show: template.with(title: "Nathan P. Roach — Résumé")

#header(d.contact)

= OVERVIEW

#emph[Mid-career self-driven #bu[bioinformatics] professional with
specialization in #bu[high performance compute], #bu[algorithm design], and
focus on #bu[biological insights]].

= TECHNICAL SKILLS

// Trimmed to keep experience high on page 1; the CV lists every category.
#skills(select(d.skills, "languages", "cloud", "backend", "python-libraries", "bioinformatics-tools"))

= PROFESSIONAL EXPERIENCE

#job(
  d.experience.biorad,
  bullets: (
    "on-instrument-algorithms",
    "hmm-segmentation",
    "memory-reductions",
    "realtime-signal-processing",
    "tertiary-analysis-backend",
    "debarcoding-refactor",
    "docker-sizing",
    "ci-cd",
    "cross-functional",
    "intern-mentoring",
  ),
  short: false,
)

#job(
  d.experience.fulcrum,
  bullets: ("custom-tooling", "wgs-pipelines", "performance-optimization", "open-source"),
  short: true,
)

#job(d.experience.galaxyworks, bullets: ("galaxypro-workflows", "partner-pipelines", "tool-packaging"))

= EDUCATION & RESEARCH EXPERIENCE

#degree(
  d.education.jhu,
  research: d.research.jhu,
  bullets: ("rna-seq-collaboration", "direct-rna-seq", "methods-paper"),
)

#degree(d.education.unc, bullets: ())

= PUBLICATIONS

#for p in d.publications { pub(p) }
