#!/bin/bash
set -eo pipefail
echo "name: check

on:
  push:
  pull_request:

jobs:" >.github/workflows/check.yml

for f in *.yml; do
	echo "  $(basename "$f" ".yml"):
    runs-on: ubuntu-latest
    steps:
      - name: checkout
        uses: actions/checkout@v2
      - name: check
        uses: goreleaser/goreleaser-action@v2
        with:
          distribution: goreleaser-pro
          args: check -q -f $f" >>.github/workflows/check.yml
done
