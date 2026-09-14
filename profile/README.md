# Bitty

**A programmable terminal platform built around a small Rust core and a composable extension ecosystem.**

> Small core. Stable interfaces. Everything composable.

Bitty explores what a terminal can become when the terminal emulator itself
provides only the essential mechanisms, while plugins, panels, tools, and AI
compose the user experience on top.

It is designed to stay useful as a minimal terminal while remaining extensible
enough to grow into a deeply customized development environment.

## Architecture

| Project                                                                              | Purpose                                                                      |
| ------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------- |
| [**bitty**](https://github.com/bitty-terminal/bitty)                                 | Terminal runtime, rendering, input, sessions, and core platform              |
| [**bitty-ai**](https://github.com/bitty-terminal/bitty-ai)                           | AI runtime, model providers, context providers, agents, and tool integration |
| [**bitty-plugins**](https://github.com/bitty-terminal/bitty-plugins)                 | Plugin registry, official plugin collection, and plugin discovery            |
| [**bitty-plugin-sdk**](https://github.com/bitty-terminal/bitty-plugin-sdk)           | SDK, APIs, typings, and tooling for plugin authors                           |
| [**bitty-plugin-template**](https://github.com/bitty-terminal/bitty-plugin-template) | Starting point for independent Bitty plugins                                 |

## Philosophy

Bitty is built around a few ideas:

* **Small core** — keep the terminal runtime focused on fundamental mechanisms.
* **Composable extensions** — features should be independently replaceable and reusable.
* **Programmable by default** — configuration and extension are part of the platform, not afterthoughts.
* **Keyboard first** — terminal workflows should remain fast without requiring pointer-driven interaction.
* **Platform, not bundle** — Bitty defines primitives and interfaces; extensions decide the experience.

## Plugin ecosystem

Plugins are first-class parts of the Bitty platform and can live as independent
repositories.

Some official plugins include
[activity](https://github.com/bitty-terminal/activity),
[palette](https://github.com/bitty-terminal/palette), and
[statusline](https://github.com/bitty-terminal/statusline).

The ecosystem is designed to expand beyond traditional terminal extensions into
panels, developer tools, task integrations, AI interfaces, and other
terminal-native applications.

## Documentation

The documentation is split by subsystem while remaining connected through the
main documentation project.

| Documentation                                                                    | Scope                                    |
| -------------------------------------------------------------------------------- | ---------------------------------------- |
| [**bitty-docs**](https://github.com/bitty-terminal/bitty-docs)                   | Documentation hub and architecture index |
| [**bitty-terminal-docs**](https://github.com/bitty-terminal/bitty-terminal-docs) | Terminal platform and core engineering   |
| [**bitty-ai-docs**](https://github.com/bitty-terminal/bitty-ai-docs)             | AI architecture and runtime              |
| [**bitty-plugins-docs**](https://github.com/bitty-terminal/bitty-plugins-docs)   | Plugin system and ecosystem              |

The public website and documentation frontend are maintained in
[bitty-website](https://github.com/bitty-terminal/bitty-website).

## Project status

Bitty is currently **pre-1.0** and under active development.

Architecture and specifications may intentionally lead implementation while the
core interfaces are being established. APIs, plugin interfaces, and repository
boundaries may continue to evolve before the first stable release.

The project is developed in the open, and the repositories should be treated as
an evolving platform rather than a finished product.

---

**Website:** [bitty.run](https://bitty.run)
**GitHub:** [github.com/bitty-terminal](https://github.com/bitty-terminal)
