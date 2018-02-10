#!/bin/bash

set -eu

version=1.1

cd "$(dirname "${BASH_SOURCE[0]}")"

rm -f "Knoxify-${version}.zip"
zip -r "Knoxify-${version}.zip" \
    common config.sh dist META-INF module.prop system
