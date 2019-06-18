# md2redmine
Markdown to Redmine-wiki (subsets of Textile) Converter.

Github Flavored Markdown を Redmine-wiki 形式に変換する。

エンジニアがMarkdownで記述したものを、非エンジニア向けのRedmine-wikiに転記する場合に有用。


# Usage

```bash
md2redmine /PATH/TO/input.md > output.textile
```


# INSTALL

require

- [Pandoc](https://pandoc.org/)
  - install and setting `PATH` env var
- [npm](https://www.npmjs.com/) (+ [Node.js](https://nodejs.org/ja/))
  - install and setting `PATH` env var

```bash
cd /PATH/TO/md2redmine
npm install
```

必要であれば `bin/*` のsymlinkを作る。
