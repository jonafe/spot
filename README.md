# Spot

Recursively search files.

## Usage

```shell
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

```shell
$ curl -sSL https://github.com/jonafe/spot/releases/download/v0.2.0/spot.sh > /usr/local/bin/spot && chmod 755 /usr/local/bin/spot
```