#!/usr/bin/env bash
# generate_status_codes.sh
# Auto-generate StatusCodes.hh and StatusCodes.m
# Usage: ./generate_status_codes.sh <path_to_cpp_dir> <output_dir>

set -euo pipefail

usage() {
  echo "Usage: $0 <path_to_cpp_dir> <output_dir>"
  echo ""
  echo "Example:"
  echo "  ./generate_status_codes.sh ../cpp ../objc"
  echo ""
  echo "This will look for:"
  echo "  ../cpp/include/braincloud/http_codes.h"
  echo "and generate:"
  echo "  ../objc/Shared/StatusCodes.hh"
  echo "  ../objc/Shared/StatusCodes.m"
  exit 1
}

if [[ $# -ne 2 ]]; then
  usage
fi

SRC_DIR="$(cd "$1" && pwd)"
OUT_DIR="$(mkdir -p "$2" && cd "$2" && pwd)"
mkdir -p "$OUT_DIR"

SRC_HEADER="$SRC_DIR/include/braincloud/http_codes.h"
OUT_HEADER="$OUT_DIR/StatusCodes.hh"
OUT_IMPL="$OUT_DIR/StatusCodes.m"

if [[ ! -f "$SRC_HEADER" ]]; then
  echo "❌ Missing header file: $SRC_HEADER"
  exit 1
fi

echo "🔍 Parsing: $SRC_HEADER"

# ------------------------------
# Extract all static const int identifiers
# ------------------------------
consts=$(
  grep -E 'static[[:space:]]+const[[:space:]]+int[[:space:]]+[A-Za-z0-9_]+[[:space:]]*=' "$SRC_HEADER" \
    | sed -E 's/.*static[[:space:]]+const[[:space:]]+int[[:space:]]+([A-Za-z0-9_]+)[[:space:]]*=.*/\1/' \
    | grep -E '^[A-Za-z_][A-Za-z0-9_]*$' \
    | sort -u
)

if [[ -z "$consts" ]]; then
  echo "⚠️ No valid constants found in $SRC_HEADER"
  exit 0
fi

echo "✅ Found constants:"
printf '%s\n' "$consts" | sed 's/^/   - /'

# ------------------------------
# Generate .hh file
# ------------------------------
echo "🧩 Generating $OUT_HEADER"

cat > "$OUT_HEADER" <<'EOF'
// Copyright 2025 bitHeads, Inc. All Rights Reserved.
#import <Foundation/Foundation.h>

#pragma once
EOF

printf '%s\n' "$consts" | while IFS= read -r c; do
  echo "extern const NSInteger BC_$c;" >> "$OUT_HEADER"
done

echo "✅ Wrote $OUT_HEADER"

# ------------------------------
# Generate .m file
# ------------------------------
echo "🧩 Generating $OUT_IMPL"

cat > "$OUT_IMPL" <<EOF
// Copyright 2025 bitHeads, Inc. All Rights Reserved.
#include "StatusCodes.hh"
EOF

printf '%s\n' "$consts" | while IFS= read -r c; do
  # Extract the value from the original header
  value=$(grep -E "static[[:space:]]+const[[:space:]]+int[[:space:]]+BC_$c[[:space:]]*=" "$SRC_HEADER" \
    | sed -E 's/.*=[[:space:]]*([^;]+);.*/\1/')
  echo "const NSInteger BC_$c = $value;" >> "$OUT_IMPL"
done

echo "✅ Wrote $OUT_IMPL"

echo
echo "✨ Generation complete!"
echo "  - $OUT_HEADER"
echo "  - $OUT_IMPL"
