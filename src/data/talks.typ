// Presentations, rendered with talk(). `kind` picks the CV section
// (conference or internal); entries are most recent first within each kind.
// `format` is talk, poster or moderator; talk() adds "(Poster)" or
// "(Moderator)" after the date, so neither `event` nor `date` carries it, and
// talk() supplies all the punctuation:
//
//   "Title." Event, Date (Poster).
//
// An entry whose title can't be made public has a `description` instead and
// prints as description, event, date.
//
// Careful when rewrapping: a line inside […] that begins with digits and a
// period (e.g. "2018.") is parsed as a numbered-list item, not as text.
#let talks = (
  (
    id: "london-calling-2018",
    format: "talk",
    kind: "conference",
    title: [Measuring the transcriptome of the #emph[C. elegans] lifecycle
      using direct RNA sequencing],
    event: [2nd Annual London Calling Conference, Transcriptomics Breakout
      Session],
    date: [May 2018],
  ),
  (
    id: "genome-informatics-2019",
    format: "poster",
    kind: "conference",
    title: [The full-length transcriptome of #emph[C. elegans] using direct
      RNA sequencing],
    event: [Genome Informatics],
    date: [November 2019],
  ),
  (
    id: "lsg-optical-simulation-2026",
    format: "talk",
    kind: "internal",
    title: [Optical Simulation of Droplets – evaluating the efficacy of
      algorithm design in the absence of experimental ground truth],
    event: [Bio-Rad LSG Software Team Meeting],
    date: [2026],
  ),
  (
    id: "innovation-exchange-2026-poster",
    format: "poster",
    kind: "internal",
    description: [Poster on a web platform for antibody prioritization],
    event: [Annual Bio-Rad Innovation Exchange],
    date: [2026],
  ),
  (
    id: "innovation-exchange-2025-poster",
    format: "poster",
    kind: "internal",
    description: [Poster on simulation-driven design of on-instrument
      algorithms],
    event: [Annual Bio-Rad Innovation Exchange],
    date: [2025],
  ),
  (
    id: "software-summit-qx-2023",
    format: "talk",
    kind: "internal",
    title: [QX Processing – From Detector Data to Droplet Data],
    event: [Annual Bio-Rad Software Summit],
    date: [2023],
  ),
  (
    id: "software-summit-roundtable-2023",
    format: "moderator",
    kind: "internal",
    title: [Tools in (Bio)informatics Roundtable],
    event: [Annual Bio-Rad Software Summit],
    date: [2023],
  ),
  (
    id: "innovation-exchange-hmm-2023",
    format: "talk",
    kind: "internal",
    title: [Hidden Markov Model (HMM) Based Chunking],
    event: [Annual Bio-Rad Innovation Exchange],
    date: [2023],
  ),
  (
    id: "cmdb-progress-2019-11",
    format: "talk",
    kind: "internal",
    title: [The full-length transcriptome of #emph[C. elegans] using direct
      RNA sequencing],
    event: [Johns Hopkins University CMDB Departmental Progress Reports],
    date: [November 2019],
  ),
  (
    id: "cmdb-progress-2019-01",
    format: "talk",
    kind: "internal",
    title: [Interrogating the developmental transcriptome of #emph[C.
      elegans] using direct RNA sequencing],
    event: [Johns Hopkins University CMDB Departmental Progress Reports],
    date: [January 2019],
  ),
  (
    id: "genomics-working-group-2018",
    format: "talk",
    kind: "internal",
    title: [Characterization of the #emph[C. elegans] transcriptome by
      direct RNA sequencing],
    event: [Johns Hopkins University Genomics Working Group Meeting],
    date: [November 2018],
  ),
  (
    id: "cmdb-retreat-2018",
    format: "poster",
    kind: "internal",
    title: [Direct RNA Sequencing across #emph[C. elegans] development],
    event: [Johns Hopkins University CMDB Departmental Retreat],
    date: [October 2018],
  ),
  (
    id: "cmdb-progress-2018-04",
    format: "talk",
    kind: "internal",
    title: [Building a developmental transcriptome of #emph[C. elegans]
      using direct RNA sequencing],
    event: [Johns Hopkins University CMDB Departmental Progress Reports],
    date: [April 2018],
  ),
  (
    id: "cmdb-retreat-2017",
    format: "poster",
    kind: "internal",
    title: [Nanopore sequencing of RNA: Computational Approaches and Initial
      Results],
    event: [Johns Hopkins University CMDB Departmental Retreat],
    date: [October 2017],
  ),
  (
    id: "cmdb-retreat-2016",
    format: "poster",
    kind: "internal",
    title: [The Glycolytic Body: Characterizing a Novel Cellular Granule],
    event: [Johns Hopkins University CMDB Departmental Retreat],
    date: [October 2016],
  ),
)
