#!/usr/bin/env bash

VERSION="v0.1.2"
IFS=$'\n'

print_usage() {
  printf "\nRecursively search files\n\n"
  printf "Usage:\n"
  printf "  spot <file> [path]\n\n"
  printf "Options:\n"
  printf "  -h, --help               Get help\n"
  printf "  -v, --version            Print version\n\n"
  printf "Examples:\n"
  printf "  spot document.txt        Search 'document.txt' recursively starting from current working directory\n"
  printf "  spot script /usr/local/  Search 'script' recursively starting from /usr/local/\n\n"
  exit 0
}

print_version() {
  echo "spot $VERSION"
  exit 0
}

search() {
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
}

if [ -z "$1" ]; then
  print_usage
fi

case "$1" in
  -h|--help)
    print_usage
    ;;
  -v|--version)
    print_version
    ;;
  *)
    search "$1" "$2"
    ;;
esac