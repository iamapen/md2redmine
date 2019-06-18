// import {action} from "../src/filters/md2redmine";
import * as Filter from "../src/filters/md2redmine.js";

const pandoc = require('pandoc-filter');


describe("action", () => {
  test("fuga", () => {
    const block = [
      [
        "",
        [
          "php"
        ],
        [{"key1": "val1"}]
      ],
      "<?php\nphpinfo();"
    ];
    const ex = new pandoc.RawBlock("html", "<pre><code class=\"php\"><?php\nphpinfo();</code></pre>\n");

    expect(Filter.action("CodeBlock", block)).toStrictEqual(ex);
  });

  test("empty", () => {
    expect(Filter.action()).toBe(undefined);
  });
});
