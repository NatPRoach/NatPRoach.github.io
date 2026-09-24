# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Personal website and résumé/CV for Nathan P. Roach, served by GitHub Pages.

## Layout

- `src/` holds the Typst sources. Content and presentation are separate, so that tailored résumés can be assembled from the same master content:
  - `src/data/*.typ` holds all public content as Typst dictionaries (experience, education, research, publications, talks, teaching, skills, awards, coursework, contact). It has no layout.
  - `src/lib/data.typ` collects all of `src/data/` into one dictionary, `data`. Documents import it with `#import "/lib/data.typ": data as d`.
  - `src/lib/style.typ` holds `template(doc, title:)`, which sets up the page, fonts, lists and headings; `space`, the one vertical spacing scale; and small helpers (`outdent`, `sc`, `bu`, `two-col`, `bullets`).
  - `src/lib/components.typ` renders the data: `header`, `job`, `degree`, `pub`, `talk`, `award`, `teaching`, `skills`, `coursework`, and `select`.
  - `src/cv.typ` is the master document and renders everything. `src/resume.typ` is the public résumé; it picks entries and bullets by id and holds its own Overview text.
  - `src/tailored/` is gitignored and holds company-specific résumés.
  - `src/fonts/` vendors TeX Gyre Pagella, the only font used. `src/assets/favicon.typ` is the source of the site favicons in `docs/`.
- `docs/` is the Jekyll site. It uses the `pages-themes/minimal` remote theme, overridden by `docs/_layouts/main-style.html` (sidebar nav and headshot) and `docs/assets/css/override_style.css`. `about.md` is the home page (`permalink: /`). `resume.md` just embeds `assets/pdfs/resume.pdf` in an `<object>`. `curriculum_vitae.md` does the same for the CV but has `published: false`, since the CV is not published.

The PDFs are build output and are not committed (`docs/assets/pdfs/*.pdf` is gitignored). The Pages workflow compiles the résumé into `docs/assets/pdfs/` before running Jekyll, so a change to `src/` reaches the site on the next deploy with no manual step.

Sidebar nav links are hardcoded in `main-style.html`, so adding a page means adding a link there too.

## Commands

```sh
# Compile every top-level document (src/*.typ) into docs/assets/pdfs/
src/build.sh

# ... or into another directory
src/build.sh -o /tmp/pdfs

# Compile one document; the PDF lands next to its source unless -o is given
src/build.sh src/tailored/acme.typ

# Iterate on one document (--root src is needed for the /lib and /data imports)
typst watch --root src --font-path src/fonts --ignore-system-fonts src/cv.typ

# Serve the site locally (run src/build.sh first so the résumé page has content)
cd docs && bundle install
bundle exec jekyll serve --config _config.yml,_config_dev.yml

# Lint Markdown the way CI does (the local docs/_site/ must be excluded)
npx markdownlint-cli2 '**/*.md' '#docs/_site'

# Regenerate the favicons from src/assets/favicon.typ (they are committed, not built in CI)
t() { typst compile --root src --font-path src/fonts --ignore-system-fonts src/assets/favicon.typ "$@"; }
t --format svg docs/favicon.svg
t --ppi 202.5 docs/apple-touch-icon.png   # 180 px
t --ppi 36 /tmp/favicon-32.png && sips -s format ico /tmp/favicon-32.png --out docs/favicon.ico
```

`src/build.sh` passes `--ignore-system-fonts` and fails if Typst reports `unknown font family`. Typst on its own only warns and substitutes another font, so without the script a missing font would silently produce wrong-looking PDFs. Any new font must be added to `src/fonts/`.

`_config_dev.yml` is layered on for local serving because it fakes `site.github.is_user_page`, which is otherwise only set on GitHub Pages.

## Tailored résumés

Copy `src/resume.typ` to `src/tailored/<company>.typ`. It compiles unchanged, because documents import with root-relative paths (`/lib/…`, `/data/…`) and `build.sh` passes `--root src`. Then edit the copy:

- Rewrite the Overview, which lives in the document rather than in `data/`.
- Choose bullets and their order by id, for example `job(d.experience.biorad, bullets: ("rust-port", "memory-reductions"))`. `bullets: auto` (the default) shows every bullet in data order, and `()` shows none. `select(items, tags: ("rust",))` filters any id-bearing array by tag instead.
- Pass `short: true` to use each bullet's short variant, or `short: ("id", …)` to shorten only some. A bullet without a `short` falls back to its `long` text, and a short variant drops that bullet's nested `sub` bullets.

New facts go in `src/data/`, never directly in a document. Give every new bullet an `id`, `tags` and `long`, plus a `short` if the long one runs past a line.

## Confidentiality

The GitHub repository is public, so everything in `src/` is published, even content the site never shows, such as the CV. Never add employer-confidential information anywhere in this repository, in local build output, or in any document built from it, including tailored résumés sent to other companies. That covers internal codenames, internal metrics and details of unreleased products, and it applies to ids and comments as well as rendered text. If unsure whether something is confidential, leave it out and ask.

- Fold-change improvements (for example "cut memory use 2–4×") and organization names such as LSG are fine.
- Describe work in general terms instead, for example "near-perfect agreement with manual segmentation" or "real-time signal processing algorithms for instrument hardware".
- A talk or poster whose title can't be made public gets a `description` instead of a `title`, and `talk()` prints it without quotes.

## CI

- `.github/workflows/checks.yml` runs on every push. It runs markdownlint (rules in `.markdownlint.jsonc`) and a throwaway `src/build.sh` build of every top-level document, so the CV is still checked even though it is not published.
- `.github/workflows/pages.yml` runs on pushes to `main` and by manual dispatch. It builds only `src/resume.typ`, runs `actions/jekyll-build-pages` on `docs/`, then deploys through `actions/deploy-pages`. This requires the repo's Pages source to be set to "GitHub Actions".

## Conventions and gotchas

- The page geometry (margins, the outdented section titles, 10pt text on a 12pt baseline) is ported from an older LaTeX `res.cls` résumé; the header comments in `src/lib/style.typ` explain it. All vertical spacing comes from the `space` scale in the same file, shared by both documents: `entry` between entries and paragraphs, `list` from an entry's head lines to its bullets, `item` between bullets, and `section`/`title` around section titles. Change a value there instead of adding a `#v()` nudge or a one-off `above:`/`below:`.
- Spacing depends on structure: Typst separates two paragraphs by `par.spacing`, but a block next to a paragraph uses the block's own `above`/`below`, and two adjacent blocks take the larger gap. After changing a component, render to PNG (`typst compile --root src --font-path src/fonts --ignore-system-fonts --ppi 150 src/cv.typ 'out/cv-{p}.png'`) and compare the result with the previous output.
- Both documents let pages break naturally. Section titles and entry head lines are `sticky`, so neither is left at the foot of a page without what follows it, and each coursework area is unbreakable. After adding content, check the page count (`src/build.sh`, then open the PDFs); the résumé should stay at two pages. If a manual `#pagebreak()` is ever needed, it goes in the document, not a component.
- `image()` paths resolve relative to the file that calls `image()`, so `header()` in `src/lib/components.typ` loads icons from `../assets/`.
- Inside `[...]` content, a line that starts with digits and a period (such as `2018.`) is parsed as a numbered-list item. Take care when rewrapping text in `src/data/`.
- Publications are written out by hand in ACM style in `src/data/publications.typ`, not generated from a bibliography. `src/assets/bibliography.bib` is kept only as the source of record.
- `.markdownlint.jsonc` allows only the `object`, `p`, `a` and `img` HTML elements in Markdown. Extend that list if a page genuinely needs more.
