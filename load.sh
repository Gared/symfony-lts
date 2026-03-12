#!/usr/bin/env bash
set -euo pipefail

# Usage: ./load.sh [version_constraint]
# Example: ./load.sh ">=7.5"
# Defaults to ">=7.5" if no argument is provided.
VERSION_CONSTRAINT="${1:->=7.5}"

echo "Using version constraint: ${VERSION_CONSTRAINT}"

symfony_pkgs_json=$(
  curl -fsSL 'https://packagist.org/packages/list.json?vendor=symfony' \
    | jq -r '.packageNames[] | select(startswith("symfony/") and (startswith("symfony/ux-") | not) and (startswith("symfony/ai-") | not) and (startswith("symfony/polyfill") | not))' \
    | jq -Rn --arg ver "${VERSION_CONSTRAINT}" '[inputs] | unique | map({(.): $ver}) | add')

jq --argjson sym "$symfony_pkgs_json" '
  .conflict = ({} + $sym)
' composer.json > composer.json.tmp && mv composer.json.tmp composer.json

echo "composer.json updated successfully."
