#!/bin/sh
# Stamps the "Updated" dates in index.html with the current month and year.
# Run manually, or automatically via .githooks/pre-commit (see README).
set -e
cd "$(dirname "$0")/.."
LABEL=$(date +"%b %Y")
ISO=$(date +"%Y-%m")
sed -i '' -E "s#(<time id=\"updated(-footer)?\" datetime=\")[^\"]*(\">)[^<]*(</time>)#\1${ISO}\3${LABEL}\4#g" index.html
git add index.html 2>/dev/null || true
echo "Stamped index.html with ${LABEL}"
