#!/bin/bash
# Usage: ./build.sh [/path/to/aax-sdk]
set -e
cd "$(dirname "$0")"
ARGS=(-DCMAKE_BUILD_TYPE=Release)
[ -n "$1" ] && ARGS+=(-DAAX_SDK_PATH="$1")
cmake -B build "${ARGS[@]}"
cmake --build build --config Release -j
./installer/build_mac_pkg.sh
