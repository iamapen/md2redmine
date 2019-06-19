const Filter = {"action": require("../src/filters/md2redmine")};

const pandoc = require('pandoc-filter');


describe("suite1", () => {
  test("phpCodeBlock", () => {
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
