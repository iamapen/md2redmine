#!/bin/bash
THIS_SCRIPT=$(readlink $0)
if [ "$THIS_SCRIPT" = "" ]; then
  THIS_SCRIPT=$0
fi
BASE_DIR=$(cd $(dirname "$THIS_SCRIPT")/..;pwd)

VERSION=0.0.1

function usage() {
  cat <<__EOF__
Markdown to Redmine-wiki Converter - ver $VERSION

Usage: $0 <input md>
  ex) $0 input.md
  ex) $0 input.md > output.txt

__EOF__
}

if [ $# -eq 1 ]; then
  INPUT=$1
else
  usage
  exit 1
fi

pandoc --from=gfm --to=textile "$INPUT" --filter="$BASE_DIR/src/filters/md2redmine.js"
