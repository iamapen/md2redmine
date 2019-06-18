#!/bin/bash
THIS_SCRIPT=$(readlink $0)
BASE_DIR=$(cd $(dirname "$THIS_SCRIPT")/..;pwd)

VERSION=0.1.0

function usage() {
  cat <<__EOF__
Markdown to Redmine-wiki Converter - ver $VERSION

Usage: $0 <input md> [output]
  ex) $0 input.md
  ex) $0 input.md output.txt

__EOF__
}

INPUT=$1
FILENAME=$(basename "$INPUT")

if [ $# -eq 1 ]; then
  OUTPUT=$FILENAME.textile
elif [ $# -eq 2 ]; then
  OUTPUT=$2
else
  usage
  exit 1
fi

pandoc --from=gfm --to=textile "$INPUT" -o "$OUTPUT" --filter="$BASE_DIR/src/filters/md2redmine.js"

