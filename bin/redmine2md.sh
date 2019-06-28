#!/bin/bash
THIS_SCRIPT=$(readlink $0)
if [ "$THIS_SCRIPT" = "" ]; then
  THIS_SCRIPT=$0
fi
BASE_DIR=$(cd $(dirname "$THIS_SCRIPT")/..;pwd)

VERSION=0.0.1

function usage() {
  cat <<__EOF__
Redmine-wiki to Markdown Converter - ver $VERSION

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

PANDOC_OPTS="--eol=lf"

# 構文木を使っていないので、このタグ処理は誤変換する可能性があるbuggyな実装。
cat "$INPUT" \
  | sed -e 's#<pre><code class="\(.*\)">#<pre class="\1">#g' \
  | sed -e 's#</code></pre>#</pre>#g' \
  | pandoc --eol=lf --from=textile --to=gfm

