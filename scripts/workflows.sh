#!/bin/bash
set -eo pipefail
echo "name: check

on:
  push:
  pull_request:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: checkout
        uses: actions/checkout@v2" >.github/workflows/check.yml

for f in *.yml; do
	echo "
      - name: goreleaser check $f
        uses: goreleaser/goreleaser-action@v2
        with:
          distribution: goreleaser-pro
          args: check -q -f $f" >>.github/workflows/check.yml
done

