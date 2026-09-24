// Degrees, most recent first, rendered with degree().
//
//   org, degree, field, dates
//   department, advisors   optional extra lines under the degree
//   dissertation           optional; printed as Dissertation: "…"
//   bullets                optional (id:, tags:, long:)
#let education = (
  jhu: (
    org: [Johns Hopkins University],
    degree: [Doctor of Philosophy (PhD)],
    field: [Biology],
    dates: [2015--2020],
    department: [Cell, Molecular, Developmental Biology and Biophysics (CMDB) Department],
    advisors: [Laboratories of Dr. James Taylor and Dr. John Kim],
    dissertation: [Computational Analysis of the Transcriptome Using Long-Read
      RNA Sequencing],
  ),
  unc: (
    org: [The University of North Carolina at Chapel Hill],
    degree: [Bachelor of Science (BS)],
    field: [Biology (with Highest Honors) and Computer Science],
    dates: [2011--2015],
    bullets: (
      (
        id: "research-on-request",
        tags: ("resume",),
        long: [Details of undergraduate research available on request.],
      ),
    ),
  ),
)
