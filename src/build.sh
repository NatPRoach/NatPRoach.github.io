#!/usr/bin/env bash
# Compile résumé documents with the vendored fonts in src/fonts.
#
#   Usage: src/build.sh [-o out-dir] [file.typ ...]
#
# With no files, builds every top-level document (src/*.typ) into
# docs/assets/pdfs. Given files, such as a tailored résumé in src/tailored/,
# builds each one next to its source. -o sends the output elsewhere.
#
# Typst only warns when a font is missing and falls back to another one, so
# treat "unknown font family" as a failure rather than shipping the wrong font.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
out_dir=""

while getopts "o:" opt; do
  case "$opt" in
    o) out_dir="$OPTARG" ;;
    *) echo "usage: $0 [-o out-dir] [file.typ ...]" >&2; exit 2 ;;
  esac
done
shift $((OPTIND - 1))

if (( $# == 0 )); then
  set -- "$root"/src/*.typ
  out_dir="${out_dir:-$root/docs/assets/pdfs}"
fi

for doc in "$@"; do
  name="$(basename "$doc" .typ)"
  dest="${out_dir:-$(dirname "$doc")}"
  mkdir -p "$dest"
  # --root src lets documents in subdirectories import ../lib and ../data.
  log=$(typst compile --root "$root/src" --font-path "$root/src/fonts" \
    --ignore-system-fonts "$doc" "$dest/$name.pdf" 2>&1) || {
    echo "$log" >&2
    exit 1
  }
  [[ -n "$log" ]] && echo "$log"
  if grep -q "unknown font family" <<<"$log"; then
    echo "error: $doc uses a font that is not in src/fonts" >&2
    exit 1
  fi
done
