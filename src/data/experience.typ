// Professional experience, most recent first, rendered with job().
//
// Public: never put employer-confidential information here (codenames,
// internal metrics, details of unreleased products). See lib/data.typ.
//
//   org      the organization
//   roles    (title:, dates:) per position held, most recent first
//   bullets  (id:, tags:, long:, short:?, sub:?) — `sub` holds nested bullets
#let _qx = "https://www.bio-rad.com/en-us/product/qx-continuum-droplet-digital-pcr-system?ID=0c949aae-8c34-51ee-b416-b3fd5f6957ca"

#let experience = (
  biorad: (
    org: [Bio-Rad LLC],
    roles: (
      (title: [Bioinformatics Scientist IV], dates: [2026--Present]),
      (title: [Software Developer III], dates: [2023--2026]),
    ),
    bullets: (
      (
        id: "on-instrument-algorithms",
        tags: ("hpc", "algorithms", "instruments", "rust"),
        long: [Designed and implemented high-performance on-instrument analysis
          algorithms for the
          #link(_qx)[QX Continuum Droplet Digital PCR System]
          and an R&D instrument.],
        short: [Designed high-performance on-instrument analysis algorithms for
          the #link(_qx)[QX Continuum ddPCR System] and an R&D instrument.],
      ),
      (
        id: "docker-sizing",
        tags: ("docker", "python", "performance", "instruments"),
        long: [Shrank an on-instrument processing program's Docker image at
          least 5×.],
        short: [Shrank an on-instrument program's Docker image ≥5×, then ported
          it from Python to Rust.],
      ),
      (
        id: "hmm-segmentation",
        tags: ("algorithms", "statistics", "rust"),
        long: [Replaced the program's sample segmentation with a hidden Markov model
          grounded in empirical data distributions, achieving near-perfect
          agreement with manual segmentation.],
        short: [Rebuilt sample segmentation around a hidden Markov model,
          reaching near-perfect agreement with manual segmentation.],
      ),
      (
        id: "memory-reductions",
        tags: ("performance", "instruments", "rust"),
        long: [Cut the program's memory use 2--4× on three separate occasions as
          resource constraints on the instrument's microprocessor tightened
          during development.],
        short: [Cut memory use 2--4× on three occasions to fit a tightening
          microprocessor budget.],
      ),
      (
        id: "realtime-signal-processing",
        tags: ("algorithms", "signal-processing", "instruments", "python", "fpga"),
        long: [Designed real-time signal processing algorithms for instrument
          hardware, prototyping them in Python and guiding their FPGA
          implementation.],
        short: [Designed real-time signal processing algorithms for instrument
          hardware.],
      ),
      (
        id: "tertiary-analysis-backend",
        tags: ("python", "backend", "software", "instruments"),
        long: [Worked extensively on the Python API and analysis layers of web
          platforms for downstream analysis of instrument data.],
        short: [Developed Python API and analysis layers for instrument data web
          platforms.],
      ),
      (
        id: "ci-cd",
        tags: ("devops", "ci-cd", "software"),
        long: [Set up and managed CI/CD pipelines for large projects spanning multiple
          teams.],
      ),
      (
        id: "design-patterns",
        tags: ("software", "architecture"),
        long: [Applied architectural design patterns to improve codebase
          maintainability.],
      ),
      (
        id: "debarcoding-refactor",
        tags: ("leadership", "ngs", "performance", "rust"),
        long: [Led a team of three engineers refactoring and optimizing an internal
          next-generation sequencing debarcoding tool in Rust.],
        short: [Led three engineers refactoring an internal NGS debarcoding
          tool in Rust.],
      ),
      (
        id: "cross-functional",
        tags: ("collaboration", "instruments", "leadership"),
        long: [Collaborated on cross-functional projects with product managers and
          hardware, firmware, and systems engineers.],
        short: [Worked cross-functionally with product, hardware, firmware, and
          systems teams.],
      ),
      (
        id: "intern-mentoring",
        tags: ("mentoring", "leadership", "signal-processing", "rust"),
        long: [Mentored summer interns in 2025 and 2026 on Rust-based signal processing
          algorithms and data analysis.],
      ),
    ),
  ),
  fulcrum: (
    org: [Fulcrum Genomics LLC],
    roles: ((title: [Bioinformatics Scientist], dates: [2021--2023]),),
    bullets: (
      (
        id: "custom-tooling",
        tags: ("consulting", "workflows", "cloud", "rust"),
        long: [Developed custom bioinformatics tooling and workflows to
          address a range of software design and analysis problems for
          industry customers of Fulcrum Genomics including:],
        sub: (
          [Writing and modifying several variant calling workflows deployed in AWS.],
          [Developing tooling for forensic genealogy.],
          [Re-implementing established tooling in a more performant language (Rust).],
        ),
        short: [Built bioinformatics tooling and workflows for industry
          clients, from AWS variant calling pipelines to forensic genealogy.],
      ),
      (
        id: "wgs-pipelines",
        tags: ("workflows", "ngs", "wdl", "nextflow", "snakemake"),
        long: [Built whole-genome sequencing variant calling pipelines from scratch
          in WDL, Nextflow, and Snakemake.],
      ),
      (
        id: "neoantigen-calling",
        tags: ("variant-calling", "oncology", "workflows"),
        long: [Developed tumor-normal variant calling workflows for neoantigen
          prediction.],
      ),
      (
        id: "performance-optimization",
        tags: ("performance", "consulting"),
        long: [Optimized the performance and runtime of critical tooling within
          customer pipelines.],
      ),
      (
        id: "aws-infrastructure",
        tags: ("cloud", "infrastructure"),
        long: [Managed AWS infrastructure for genomics analysis.],
      ),
      (
        id: "legacy-audits",
        tags: ("consulting", "software"),
        long: [Audited and improved legacy codebases for customers.],
      ),
      (
        id: "open-source",
        tags: ("open-source",),
        long: [Contributed to open-source genomics libraries, including
          #link("https://github.com/fulcrumgenomics/fgbio/pulls?q=is%3Apr+author%3ANatPRoach")[fgbio],
          #link("https://github.com/fulcrumgenomics/fgoxide/pulls?q=is%3Apr+is%3Aclosed+author%3ANatPRoach")[fgoxide],
          #link("https://github.com/fulcrumgenomics/fgpyo/pulls?q=is%3Apr+author%3ANatPRoach")[fgpyo],
          #link("https://github.com/fulcrumgenomics/fqtk/pulls?q=is%3Apr+is%3Aclosed+author%3ANatPRoach")[fqtk],
          // Links to the repo itself: the initial implementation was written by me, but
          // its history was squashed before publication, so no PRs show it so dont add the same filter.
          #link("https://github.com/fulcrumgenomics/pybedlite")[pybedlite], and
          #link("https://github.com/myriad-opensource/samwell/pulls?q=is%3Apr+author%3ANatPRoach")[samwell].],
        short: [Contributed to open-source genomics libraries, including
          #link("https://github.com/fulcrumgenomics/fgbio/pulls?q=is%3Apr+author%3ANatPRoach")[fgbio],
          #link("https://github.com/fulcrumgenomics/fgpyo/pulls?q=is%3Apr+author%3ANatPRoach")[fgpyo],
          and
          #link("https://github.com/fulcrumgenomics/fqtk/pulls?q=is%3Apr+is%3Aclosed+author%3ANatPRoach")[fqtk].],
      ),
    ),
  ),
  galaxyworks: (
    org: [GalaxyWorks LLC],
    roles: ((title: [Computational Biologist], dates: [2020--2021]),),
    bullets: (
      (
        id: "galaxypro-workflows",
        tags: ("workflows",),
        long: [Designed computational workflows for the GalaxyPro platform.],
      ),
      (
        id: "partner-pipelines",
        tags: ("workflows", "pharma"),
        long: [Built and maintained end-to-end analysis pipelines for pharmaceutical
          partners.],
      ),
      (
        id: "tool-packaging",
        tags: ("open-source",),
        long: [Integrated new tools into the
          #link("https://github.com/bioconda/bioconda-recipes/pulls?q=is%3Apr+is%3Aclosed+author%3ANatPRoach")[Bioconda]
          and
          #link("https://github.com/galaxyproject/tools-iuc/pulls?q=is%3Aclosed+is%3Apr+author%3ANatPRoach+")[Galaxy]
          platforms.],
        short: [Packaged tools for
          #link("https://github.com/bioconda/bioconda-recipes/pulls?q=is%3Apr+is%3Aclosed+author%3ANatPRoach")[Bioconda]
          and
          #link("https://github.com/galaxyproject/tools-iuc/pulls?q=is%3Aclosed+is%3Apr+author%3ANatPRoach+")[Galaxy].],
      ),
    ),
  ),
)
