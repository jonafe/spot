# Spot

Recursively search files

## Usage

```console
$ spot

Recursively search files

Usage:
  spot <file> [path]

Options:
  -h, --help               Get help
  -v, --version            Print version

Examples:
  spot document.txt        Search 'document.txt' recursively starting from current working directory
  spot script /usr/local/  Search 'script' recursively starting from /usr/local/
```

## Installation

```console
curl -sS https://raw.githubusercontent.com/jonafe/spot/HEAD/spot.sh > /usr/local/bin/spot && chmod 755 /usr/local/bin/spot
```