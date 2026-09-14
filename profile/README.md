# Bitty

Bitty is a small, programmable, cross-platform terminal platform: a compact
Rust core keeps the mechanisms a correct terminal needs, while plugins compose
most of the user experience.

> Small core. Stable API. Everything composable. Extensions own the experience.

Bitty is pre-1.0 and developed in the open. Design and governance
documentation is intentionally ahead of implementation; no stable public API,
finished product, or supported release is claimed yet.

## Core

- [bitty](https://github.com/bitty-terminal/bitty) — terminal runtime and core
  implementation.
- [bitty-ai](https://github.com/bitty-terminal/bitty-ai) — AI subsystem: model
  providers, context providers, agent runtime, and tool bus.

## Documentation

- [bitty-docs](https://github.com/bitty-terminal/bitty-docs) — canonical design
  corpus and documentation aggregator; start here.
- [bitty-terminal-docs](https://github.com/bitty-terminal/bitty-terminal-docs) —
  terminal platform specifications and engineering documentation.
- [bitty-ai-docs](https://github.com/bitty-terminal/bitty-ai-docs) — AI core
  documentation.
- [bitty-plugins-docs](https://github.com/bitty-terminal/bitty-plugins-docs) —
  plugin ecosystem documentation.

## Plugin ecosystem

- [bitty-plugins](https://github.com/bitty-terminal/bitty-plugins) — plugin
  registry, store frontend, and official plugin submodules.
- [bitty-plugin-sdk](https://github.com/bitty-terminal/bitty-plugin-sdk) — SDK,
  typings, and test harness for plugin authors.
- [bitty-plugin-template](https://github.com/bitty-terminal/bitty-plugin-template) —
  starter template for independent plugin repositories.

Plugins are the repositories without a `bitty` prefix:
[activity](https://github.com/bitty-terminal/activity) (privacy-first local
activity timeline), [palette](https://github.com/bitty-terminal/palette)
(command palette and picker UI), and
[statusline](https://github.com/bitty-terminal/statusline) (cwd, mode, Git,
and task statusline).

## Also in this organization

- [bitty-website](https://github.com/bitty-terminal/bitty-website) — website
  and published documentation frontend.
- [bitty-devtools](https://github.com/bitty-terminal/bitty-devtools) —
  developer tools and debug frontend.
- [scoop-bucket](https://github.com/bitty-terminal/scoop-bucket) and
  [homebrew-tap](https://github.com/bitty-terminal/homebrew-tap) — Scoop and
  Homebrew distribution channels.

## Public addresses

The website and plugin registry are planned at `bitty.run` and
`plugins.bitty.run`; neither is live yet. Website and registry deployment is
deferred to the 0.1.0 timeframe.
