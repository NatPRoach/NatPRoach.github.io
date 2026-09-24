// Name, location and contact links for header(). A link's `icon` is either a
// file in src/assets/ (sized by `icon-width`) or content drawn in place.
//
// The résumé is public, so no phone number or street address.

// LinkedIn's "in" badge, drawn to match the other black 5mm icons.
#let _linkedin-icon = box(
  width: 5mm,
  height: 5mm,
  radius: 0.7mm,
  fill: black,
  align(center + horizon, text(fill: white, weight: "bold", size: 10.5pt, top-edge: "x-height", bottom-edge: "baseline")[in]),
)

#let contact = (
  name: [Nathan P. Roach PhD],
  location: [Boulder, CO · Remote],
  links: (
    (
      url: "mailto:natproach@gmail.com",
      label: [natproach\@gmail.com],
      icon: "envelope.png",
      icon-width: 5mm,
    ),
    (
      url: "https://orcid.org/0000-0001-9353-4615",
      label: [0000-0001-9353-4615],
      icon: "orcid_logo.png",
      icon-width: 6mm,
    ),
    (
      url: "https://github.com/NatPRoach",
      label: [NatPRoach],
      icon: "githubmark.png",
      icon-width: 5mm,
    ),
    (
      url: "https://www.linkedin.com/in/nathan-roach-b5b54219b/",
      label: [LinkedIn],
      icon: _linkedin-icon,
    ),
  ),
)
