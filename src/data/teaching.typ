// Teaching positions, rendered with teaching(). Courses are most recent first;
// `bullets` may be empty.
#let teaching = (
  jhu-ta: (
    org: [Johns Hopkins University],
    role: [Teaching Assistant],
    courses: (
      (
        id: "quant-bio-lab",
        title: [Quantitative Biology Lab],
        term: [Fall 2019],
        bullets: (
          (
            id: "one-on-one",
            tags: ("mentoring",),
            long: [Worked one-on-one with students to assist them in
              understanding the biological relevance behind, and computational
              processes necessary for, their assignments.],
          ),
        ),
      ),
      (
        id: "quant-bio-bootcamp",
        title: [Quantitative Biology Bootcamp],
        term: [Fall 2019],
        bullets: (
          (
            id: "hands-on",
            tags: ("mentoring",),
            long: [Worked hands-on with students to ensure understanding of
              material.],
          ),
          (
            id: "assessment",
            tags: ("assessment",),
            long: [Assessed student work to target areas for further discussion
              and explanation.],
          ),
        ),
      ),
      (
        id: "quant-bio-biophysics",
        title: [Quantitative Biology and Biophysics],
        term: [Spring 2019],
        bullets: (
          (
            id: "lab-sessions",
            tags: ("mentoring",),
            long: [Led weekly lab sessions, working directly with students to
              understand core concepts.],
          ),
          (
            id: "gmm-assignment",
            tags: ("curriculum", "python"),
            long: [Developed an assignment focusing on simulating data and
              fitting Gaussian Mixture Models to data in Python.],
          ),
        ),
      ),
      (
        id: "human-genetics",
        title: [Human Genetics],
        term: [Fall 2018],
        bullets: (
          (
            id: "guest-lecture",
            tags: ("lecturing",),
            long: [Presented a guest lecture on DNA sequencing.],
          ),
        ),
      ),
      (
        id: "human-brain",
        title: [Introduction to the Human Brain],
        term: [Spring 2018],
        bullets: (),
      ),
      (
        id: "chromosomes",
        title: [Chromosomes, Chromatin, and the Cell Nucleus],
        term: [Fall 2017],
        bullets: (),
      ),
      (
        id: "protein-engineering",
        title: [Protein Engineering and Biochemistry Lab],
        term: [Fall 2016--Spring 2017],
        bullets: (),
      ),
    ),
  ),
)
