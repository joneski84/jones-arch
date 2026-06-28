#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

mkdir -p iso-share
rm -f iso-share/*.iso iso-share/SHA256SUMS.txt

latest_iso="$(
    find "$SCRIPT_DIR" \
        -maxdepth 2 \
        -type f \
        -path "$SCRIPT_DIR/out-*/*.iso" \
        -printf '%T@ %p\n' 2>/dev/null \
    | sort -n \
    | tail -1 \
    | cut -d' ' -f2-
)"

if [ -z "${latest_iso:-}" ]; then
    echo "Ei ISO-tiedostoa löytynyt out-* kansioista."
    exit 1
fi

cp "$latest_iso" iso-share/

cd iso-share
sha256sum *.iso > SHA256SUMS.txt

echo "Viety jakoon:"
ls -lh
