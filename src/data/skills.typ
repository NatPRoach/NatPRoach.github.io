// Technical skills, rendered with skills(). A category has either `items` or
// `levels`, each level with its own `items`.
#let skills = (
  (
    id: "cloud",
    label: [Cloud & DevOps],
    items: (
      [AWS (EC2, ECS, ECR, Lambda, S3, EFS, SQS, CloudWatch)], [Docker], [Git],
      [GitHub Actions], [GitLab CI], [CircleCI],
    ),
  ),
  (
    id: "languages",
    label: [Programming Languages],
    levels: (
      (label: [Proficient], items: ([Bash], [Python], [Rust])),
      (label: [Experienced], items: ([Nextflow], [R], [Snakemake])),
      (
        label: [Familiar],
        items: (
          [Awk], [C], [C\#], [C++], [HTML], [Java], [JavaScript], [TypeScript],
          [Matlab], [Nim], [Scala], [WDL],
        ),
      ),
    ),
  ),
  (
    id: "backend",
    label: [Web Backend],
    items: ([FastAPI], [PostgreSQL], [SQLAlchemy]),
  ),
  (
    id: "python-libraries",
    label: [Python Libraries],
    items: ([NumPy], [pandas], [Matplotlib], [seaborn], [pysam]),
  ),
  (
    id: "bioinformatics-tools",
    label: [Bioinformatics Tools],
    items: ([samtools], [htslib], [BWA-MEM], [minimap2], [StringTie2]),
  ),
  (
    id: "methods",
    label: [Methods],
    items: (
      [Hidden Markov models], [Digital signal processing],
      [Algorithm design], [Performance optimization],
    ),
  ),
  (
    id: "genomics",
    label: [Genomics],
    items: (
      [NGS], [Variant calling], [RNA-seq (bulk, direct, and small)],
      [Long-read Nanopore sequencing], [Transcriptome assembly],
      [Droplet digital PCR],
    ),
  ),
  (
    id: "os",
    label: [Operating Systems],
    items: ([macOS], [Linux], [Windows]),
  ),
)
