#!/usr/bin/env bash

bdir="build"
while [[ ! -z $1 ]]; do
  case $1 in
  -c | --clean) rm -rf $bdir;;
  *) break;;
  esac; shift
done

[[ -e $bdir ]] || cmake -B $bdir "$@"
cmake --build $bdir

