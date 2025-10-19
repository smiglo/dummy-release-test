#!/usr/bin/env bash

set -e

set -xv
version="${1:-0.1.0-unknown}"
cmake -S . -B build -DPROJECT_VERSION=$version
cmake --build build
dist_name="hello_world-$version"
dist_path="build/$dist_name"
mkdir -p "$dist_path"
git checkout-index -a -f --prefix="$dist_path/"
sed -i -e '/# <VERSION_BLOCK>/,/# <\/VERSION_BLOCK>/cset(PROJECT_VERSION \"'"$version"'\")' "$dist_path/CMakeLists.txt"
tar -czf "build/$dist_name.tar.gz" -C "build" "$dist_name"
ls -al "build/$dist_name.tar.gz"

