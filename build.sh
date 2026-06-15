#!/bin/bash
# Build data.js from a git repo.
# Usage: ./build.sh [repo-path]
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
REPO="${1:-/Users/zop.dev/Downloads/klydo redesign}"

if [ ! -d "$REPO/.git" ]; then
    echo "error: $REPO is not a git repo"
    exit 1
fi

python3 "$DIR/build.py" "$REPO" "$DIR/data.js"
