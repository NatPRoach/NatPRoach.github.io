// =============================================================================
// Collects everything in src/data/ into one dictionary.
//
//   #import "/lib/data.typ": data as d
//
// The repository is public, so src/data/ must never contain
// employer-confidential information: codenames, internal metrics, or details
// of unreleased products. If unsure, leave it out.
// =============================================================================

#import "/data/awards.typ": awards
#import "/data/contact.typ": contact
#import "/data/coursework.typ": coursework
#import "/data/education.typ": education
#import "/data/experience.typ": experience
#import "/data/publications.typ": publications
#import "/data/research.typ": research
#import "/data/skills.typ": skills
#import "/data/talks.typ": talks
#import "/data/teaching.typ": teaching

#let data = (
  awards: awards,
  contact: contact,
  coursework: coursework,
  education: education,
  experience: experience,
  publications: publications,
  research: research,
  skills: skills,
  talks: talks,
  teaching: teaching,
)
