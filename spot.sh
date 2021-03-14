#!/usr/bin/env bash

if [ -z "$1" ]; then
  printf "%s\n" "spot v0.1.0"
  printf "%s\n\n" "Recursively search files in the directory tree"
  printf "%s\n" "Usage: spot <file>"
  exit 1
fi

IFS=$'\n'

paths+=($(find "$PWD" -type f -iname "*$1*" -prune 2>&1 | grep -v "No such file or directory" | grep -v "Operation not permitted" | grep -v "Permission denied"))
paths=($(printf "%s\n" "${paths[@]}" | sort -u));

if [ "${#paths[@]}" -gt 0 ]; then
  printf "%s\n" "${paths[@]}"
  printf "%s\n" "Number of results: ${#paths[@]}"
fi