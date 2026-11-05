#!/bin/bash
# usage: check-public.sh <built site dir> <page url>
# deploy-pages can report success while the old site stays online (seen on v0.1.4: two deployments of one commit
# within seconds). So compare the public address with what this run built, and fail the job if it never matches.
set -uo pipefail
site=$1
url=${2%/}
tries=${CHECK_TRIES:-15}
pause=${CHECK_PAUSE:-20}
tmp=$(mktemp)
package=$(awk '/^Filename: /{print $2; exit}' "$site/apt/dists/stable/main/binary-amd64/Packages")

public_matches() {
  local attempt=$1 file
  # The query string gets past the CDN's cached copy (max-age=600).
  for file in apt/dists/stable/Release index.html; do
    curl -fsS -o "$tmp" "$url/$file?check=$RANDOM-$attempt" || return 1
    cmp -s "$tmp" "$site/$file" || return 1
  done
  curl -fsSI -o /dev/null "$url/apt/$package?check=$RANDOM-$attempt"
}

for ((i = 1; i <= tries; i++)); do
  if public_matches "$i"; then
    echo "Public site matches this build, with $package (attempt $i)"
    exit 0
  fi
  [ "$i" -lt "$tries" ] && sleep "$pause"
done

echo "The public site does not match this build. Run: gh workflow run pages.yml --ref master" >&2
exit 1
