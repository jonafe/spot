#!/usr/bin/env bash

if [ -z "$1" ]; then
  printf "%s\n" "spot v0.1.1"
  printf "%s\n\n" "Recursively search files"
  printf "%s\n" "Usage: spot <file> [path]"
  exit 1
fi

IFS=$'\n'

search_path="$PWD"
if [ "$2" != "" ]; then
  search_path="$2"
fi

paths+=($(find "$search_path" -type f -iname "*$1*" -prune 2>&1 | grep -v "No such file or directory" | grep -v "Operation not permitted" | grep -v "Permission denied"))
paths=($(printf "%s\n" "${paths[@]}" | sort -u));

if [ "${#paths[@]}" -gt 0 ]; then
  printf "%s\n" "${paths[@]}"
  printf "%s\n" "Number of results: ${#paths[@]}"
fi