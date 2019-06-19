#!/usr/bin/env node
const pandoc = require('pandoc-filter');

const action = (key, value, format, meta) => {
  let lang = "";
  let code = "";

  if (key === 'CodeBlock') {
    [[, lang,], code] = value;
    const syntax = (lang.length) ? ` class="${lang}"` : '';
    return pandoc.RawBlock('html', `<pre><code${syntax}>${code}</code></pre>\n`);
  }
};

pandoc.toJSONFilter(action);

//export {action};

