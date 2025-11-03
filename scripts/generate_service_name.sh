#!/usr/bin/env bash
# generate_bc_service_name.sh
# Auto-generate BCServiceName.hh and BCServiceName.mm
# Usage: ./generate_bc_service_name.sh <path_to_ServiceName_dir> <output_dir>

set -euo pipefail

usage() {
  echo "Usage: $0 <path_to_ServiceName_dir> <output_dir>"
  echo ""
  echo "Example:"
  echo "  ./generate_bc_service_name.sh ../cpp/ ../objc"
  echo ""
  echo "This will look for:"
  echo "  ../cpp/include/braincloud/ServiceName.h"
  echo "  ../cpp/src/ServiceName.cpp"
  echo "and generate:"
  echo "  ../objc/Shared/BCServiceName.hh"
  echo "  ../objc/Shared/BCServiceName.mm"
  exit 1
}

if [[ $# -ne 2 ]]; then
  usage
fi

# Normalize input paths (fail early if cd fails)
SRC_DIR="$(cd "$1" && pwd)"
OUT_DIR="$(mkdir -p "$2" && cd "$2" && pwd)"

SRC_HEADER="$SRC_DIR/include/braincloud/ServiceName.h"
SRC_CPP="$SRC_DIR/src/ServiceName.cpp"
OUT_HEADER="$OUT_DIR/Shared/BCServiceName.hh"
OUT_IMPL="$OUT_DIR/Shared/BCServiceName.mm"

if [[ ! -f "$SRC_HEADER" ]]; then
  echo "❌ Missing header file: $SRC_HEADER"
  exit 1
fi

if [[ ! -f "$SRC_CPP" ]]; then
  echo "❌ Missing source file: $SRC_CPP"
  exit 1
fi

echo "🔍 Parsing: $SRC_HEADER"

# ------------------------------
# Robust extraction of identifiers
# ------------------------------
# Steps:
# 1) grep lines that declare static const ServiceName
# 2) sed extract the candidate token (the token immediately after ServiceName)
# 3) filter to only accept valid C++ identifiers (^[A-Za-z_][A-Za-z0-9_]*$)
# 4) unique + sort
#
# This prevents entries containing slashes, dots, or other garbage.
ops=$(
  grep -E 'static[[:space:]]+const[[:space:]]+ServiceName' "$SRC_HEADER" \
    | sed -E 's/.*ServiceName[[:space:]]+([A-Za-z0-9_]+)[[:space:]]*;.*/\1/' \
    | grep -E '^[A-Za-z_][A-Za-z0-9_]*$' \
    | sort -u
)

if [[ -z "$ops" ]]; then
  echo "⚠️ No valid operations found in $SRC_HEADER"
  exit 0
fi

echo "✅ Found operations:"
# Print each on its own line, indented
printf '%s\n' "$ops" | sed 's/^/   - /'

# ------------------------------
# Generate header
# ------------------------------
echo "🧩 Generating $OUT_HEADER"

cat > "$OUT_HEADER" <<'EOF'
#import <Foundation/Foundation.h>

#pragma once

@interface BCServiceName : NSObject
EOF

# Use a while-read to preserve whitespace safety (though ops are simple tokens)
printf '%s\n' "$ops" | while IFS= read -r op; do
  printf '+ (NSString *)%s;\n' "$op" >> "$OUT_HEADER"
done

cat >> "$OUT_HEADER" <<'EOF'

@end
EOF

# ------------------------------
# Generate implementation
# ------------------------------
echo "🧩 Generating $OUT_IMPL"

cat > "$OUT_IMPL" <<'EOF'
#import "BCServiceName.hh"
#import "braincloud/ServiceName.h"

@implementation BCServiceName
EOF

printf '%s\n' "$ops" | while IFS= read -r op; do
  cat >> "$OUT_IMPL" <<EOF

+ (NSString *)$op {
    return [NSString stringWithCString:BrainCloud::ServiceName::$op.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}
EOF
done

cat >> "$OUT_IMPL" <<'EOF'

@end
EOF

echo "✨ Generation complete!"
echo "  - $OUT_HEADER"
echo "  - $OUT_IMPL"
