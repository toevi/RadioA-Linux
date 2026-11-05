#!/bin/bash
# usage: build-site.sh <release files dir> <output dir>
# Any mismatch fails the job: the previous deployment then stays online, instead of a broken APT repository.
set -euo pipefail
dl=$1
out=$2
fingerprint=${SIGNING_FINGERPRINT:-7B94EDA6999DF3F0E34A7D3C8548DB2819D97E04}
apt="$out/apt"

rm -rf "$out"
cp -r docs "$out"
mkdir -p "$apt"
tar -xzf "$dl/radioa-apt-dists.tar.gz" -C "$apt"

# InRelease must be signed by the project's key, whatever key file came with the release.
home=$(mktemp -d)
gpg --homedir "$home" --quiet --import "$dl/radioa-signing-key.asc"
status=$(gpg --homedir "$home" --status-fd 1 --verify "$apt/dists/stable/InRelease" 2>/dev/null || true)
if ! grep -q "^\[GNUPG:\] VALIDSIG $fingerprint " <<<"$status"; then
  echo "InRelease: no valid signature by $fingerprint" >&2
  exit 1
fi

# The Packages file must match what InRelease signed, and the package what Packages names.
packages=dists/stable/main/binary-amd64/Packages
want=$(awk '/^SHA256:/{s=1;next} /^[^ ]/{s=0} s && $3=="main/binary-amd64/Packages"{print $1}' "$apt/dists/stable/InRelease")
have=$(sha256sum "$apt/$packages" | cut -d' ' -f1)
if [ -z "$want" ] || [ "$want" != "$have" ]; then
  echo "Packages does not match InRelease" >&2
  exit 1
fi

filename=$(awk '/^Filename: /{print $2; exit}' "$apt/$packages")
sum=$(awk '/^SHA256: /{print $2; exit}' "$apt/$packages")
deb="$dl/$(basename "$filename")"
if [ ! -f "$deb" ]; then
  echo "Missing $deb" >&2
  exit 1
fi
if [ "$(sha256sum "$deb" | cut -d' ' -f1)" != "$sum" ]; then
  echo "$deb does not match Packages" >&2
  exit 1
fi

mkdir -p "$apt/$(dirname "$filename")"
cp "$deb" "$apt/$filename"
echo "Site built with APT package $filename"
