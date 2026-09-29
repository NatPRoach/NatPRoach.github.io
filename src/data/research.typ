// Research positions, most recent first, rendered with job() (or folded into
// a degree with degree(research: …)). Same shape as experience.typ, with a
// `detail` naming the lab on each role and an optional `short` on bullets.
//
// An entry-level `dates` is printed on the organization line rather than the
// role line; hwi uses it because the original CV did.
#let research = (
  jhu: (
    org: [Johns Hopkins University],
    roles: (
      (
        title: [Graduate Student Researcher],
        detail: [Laboratories of Dr. James Taylor and Dr. John Kim],
        dates: [2015--2020],
      ),
    ),
    bullets: (
      (
        id: "rna-seq-collaboration",
        tags: ("collaboration", "rna-seq"),
        long: [Collaborated directly with experimental biologists to determine
          the impact of various genetic mutants on the transcriptome through
          analysis of RNA-seq, direct RNA-seq, and small RNA-seq.],
        short: [Analyzed RNA-seq, direct RNA-seq, and small RNA-seq with experimental
          biologists to characterize genetic mutants.],
      ),
      (
        id: "direct-rna-seq",
        tags: ("nanopore", "rna-seq"),
        long: [Pioneered a research project utilizing direct RNA-seq from
          Oxford Nanopore Technologies to profile the transcriptome of
          #emph[C. elegans].],
        short: [Pioneered Nanopore direct RNA-seq profiling of the #emph[C. elegans]
          transcriptome.],
      ),
      (
        id: "methods-paper",
        tags: ("algorithms", "publication"),
        long: [Designed and implemented the computational analysis and
          published it as first author in #emph[Genome Research], providing
          full-length support for 20,902 splice isoforms, 2,188 of them novel.],
        short: [Designed the computational analysis and published it as first
          author in #emph[Genome Research].],
      ),
      (
        id: "side-projects",
        tags: ("hmm", "assembly", "rna-seq"),
        long: [Applied hidden Markov models, #emph[de novo] transcriptome assembly,
          and small RNA-seq analysis in collaborative side projects.],
        short: [Applied HMMs, #emph[de novo] transcriptome assembly, and small RNA-seq
          analysis in side projects.],
      ),
    ),
  ),
  unc-jacobson: (
    org: [The University of North Carolina at Chapel Hill],
    roles: (
      (
        title: [Undergraduate Researcher],
        detail: [Laboratory of Dr. Kenneth Jacobson],
        dates: [2014--2015],
      ),
    ),
    bullets: (
      (
        id: "membrane-folds",
        tags: ("imaging", "publication"),
        long: [Established methodology to characterize the size distribution
          of nanometer-scale folds of the cell membrane observed after drastic
          morphological change. The resulting analyses were included in a
          publication in PLOS Computational Biology.],
        short: [Characterized nanometer-scale cell membrane folds; the analyses were
          published in PLOS Computational Biology.],
      ),
      (
        id: "3d-migration",
        tags: ("imaging", "wet-lab"),
        long: [Developed and implemented a method to visualize cell migration
          in three dimensions, through embedding cells in a 3D collagen matrix.],
        short: [Visualized 3D cell migration by embedding cells in collagen matrices.],
      ),
    ),
  ),
  unc-hedrick: (
    org: [The University of North Carolina at Chapel Hill],
    roles: (
      (
        title: [Undergraduate Researcher],
        detail: [Laboratory of Dr. Tyson Hedrick],
        dates: [2012--2014],
      ),
    ),
    bullets: (
      (
        id: "flight-tracking",
        tags: ("computer-vision", "imaging"),
        long: [Developed and implemented computer vision approaches to quantify
          images of organisms in flight through image segmentation and 3D
          particle tracking methods.],
        short: [Quantified organisms in flight with image segmentation and 3D
          particle tracking.],
      ),
    ),
  ),
  unc-hollins: (
    org: [The University of North Carolina at Chapel Hill],
    roles: (
      (
        title: [Undergraduate Researcher],
        detail: [Laboratory of Dr. Mark Hollins],
        dates: [2011--2012],
      ),
    ),
    bullets: (
      (
        id: "data-collection-ui",
        tags: ("software",),
        long: [Designed and implemented a user interface used for data
          collection in the lab.],
      ),
    ),
  ),
  hwi: (
    org: [Hauptman-Woodward Research Institute],
    dates: [Summer 2013],
    roles: (
      (
        title: [Summer Research Assistant],
        detail: [Laboratory of Dr. Timothy Umland],
      ),
    ),
    bullets: (
      (
        id: "chorismate-synthase",
        tags: ("wet-lab", "structural-biology"),
        long: [Purified and crystallized the bacterial enzyme chorismate
          synthase to 5~Å resolution. Built experience with preparing buffers,
          sterile technique, several chromatography methods, and gel
          electrophoresis.],
        short: [Purified and crystallized chorismate synthase to 5~Å resolution.],
      ),
    ),
  ),
)
