#!/bin/bash

# Script to replace static paths with a variable in index.html
# This script is idempotent - running it multiple times won't create duplicate variables

set -e

BASE_PATH=$(echo "$WEBUI_URL" | cut -d'/' -f4-)
BASE_PATH="/${BASE_PATH%/}"

if [ -z "$BASE_PATH" ]; then
    echo "No base path detected --> index.html is not modified."
    exit 0
fi

HTML_FILE="/app/build/index.html"

if [ ! -f "$HTML_FILE" ]; then
    echo "HTML file $HTML_FILE does not exist. Cannot update base paths."
    exit 1
fi

if grep -q "${BASE_PATH}/" "$HTML_FILE"; then
    echo "BASE_PATH '${BASE_PATH}' is already present in $HTML_FILE - nothing to do"
    exit 0
fi

sed -i \
    -e "s|\"/|\"${BASE_PATH}/|g" \
    -e "s|'/|'${BASE_PATH}/|g" \
    -e "s|base: \"\"|base: \"${BASE_PATH}\", assets: \"${BASE_PATH}\"|g" \
    "$HTML_FILE"

echo "$HTML_FILE updated with BASE_PATH '${BASE_PATH}'"