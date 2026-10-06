# Bitty

**A programmable terminal platform built around a small Rust core and a composable extension ecosystem.**

> Small core. Stable interfaces. Everything composable.

Bitty explores what a terminal can become when the terminal emulator itself
provides only the essential mechanisms, while plugins, panels, tools, and AI
compose the user experience on top.

It is designed to stay useful as a minimal terminal while remaining extensible
enough to grow into a deeply customized development environment.

## What Bitty is

- **Small Rust core** — [bitty](https://github.com/bitty-terminal/bitty) owns
  the terminal mechanisms: PTY, VT parsing, GPU rendering, sessions, and
  panels. Everything else lives outside the core.
- **Rust extensions** — optional capabilities (networking, IPC, observability,
  execution, graphics, accessibility, storage) are developed as independent
  crates behind accepted contracts. The core never depends on them silently.
- **Lua plugins** — user-facing features (command palette, statusline, file
  manager, git panel, developer tools) are plugins written against the public
  host API, running on a sandboxed Lua runtime.
- **Independent AI sub-platform** —
  [bitty-ai](https://github.com/bitty-terminal/bitty-ai) develops the model,
  context, agent, and tool runtime separately from the terminal core.

## Repository map

### Terminal core

| Repository                                             | Purpose                                                                                                               |
| ------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------- |
| [bitty](https://github.com/bitty-terminal/bitty)       | Terminal runtime: PTY, VT parsing, GPU rendering, sessions, and panels                                                |
| [phodopus](https://github.com/bitty-terminal/phodopus) | Pure-Rust stackless Lua runtime: sandboxing, fuel, and modular stdlib. Pre-adoption; not yet the active Bitty runtime |

### AI

| Repository                                                   | Purpose                                                                                                                                           |
| ------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| [bitty-ai](https://github.com/bitty-terminal/bitty-ai)       | AI subsystem: model providers, context providers, agent runtime, and tool bus. Experimental and pre-alpha, docs-first                             |
| [bitty-agent](https://github.com/bitty-terminal/bitty-agent) | AI agent protocol layer: messages, tool-call stubs, observations, and bounded queues. Pre-1.0; contract accepted, implementation not yet verified |

### Rust core extensions

Optional Rust capabilities developed outside the terminal core. Each one is
consumed only through its accepted contract.

| Repository                                                                   | Purpose                                                                                                                                               |
| ---------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| [bitty-network](https://github.com/bitty-terminal/bitty-network)             | Shared optional network runtime (API plus implementation). Default-off                                                                                |
| [bitty-ipc](https://github.com/bitty-terminal/bitty-ipc)                     | Generic out-of-process IPC bridge: DevTools and MCP protocols, bounded framing, and peer-credential auth. Pre-1.0                                     |
| [bitty-observability](https://github.com/bitty-terminal/bitty-observability) | Read-only observation seam: API, bounded buffering, filtering, and redaction helpers. Pre-1.0; not consumed by the core yet                           |
| [bitty-execution](https://github.com/bitty-terminal/bitty-execution)         | Execution supervisor: job lifetime, cancellation, process resources, and recovery. Landed and independently verified                                  |
| [bitty-graphics](https://github.com/bitty-terminal/bitty-graphics)           | Bounded graphics decode (PNG-only) plus raster mechanics. Landed and independently verified                                                           |
| [bitty-a11y](https://github.com/bitty-terminal/bitty-a11y)                   | Accessibility adapter: snapshot, handle, focus, and action core with a headless backend. Landed and independently verified                            |
| [bitty-storage](https://github.com/bitty-terminal/bitty-storage)             | Bounded isolated storage mechanics: snapshots, atomic commits, per-plugin key-value backend, and transcript descriptors. Landed; verification pending |

### Plugin platform

| Repository                                                                       | Purpose                                                                                    |
| -------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| [bitty-plugins](https://github.com/bitty-terminal/bitty-plugins)                 | Plugin registry, store frontend, and official plugin collection                            |
| [bitty-plugin-sdk](https://github.com/bitty-terminal/bitty-plugin-sdk)           | Plugin SDK: manifest validation, Lua API declarations, mock host, and conformance fixtures |
| [bitty-plugin-template](https://github.com/bitty-terminal/bitty-plugin-template) | Reproducible starting point and generator for new independent plugin repositories          |

### Plugins

Independent repositories without the `bitty` prefix. Early-stage plugins are
marked as such; nothing below is a finished product.

| Repository                                                     | Purpose                                                                                                  |
| -------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| [activity](https://github.com/bitty-terminal/activity)         | Privacy-first local activity timeline plugin                                                             |
| [bar](https://github.com/bitty-terminal/bar)                   | Consolidated workspace bar, tabs, and statusline presentation over generic chrome insets                 |
| [palette](https://github.com/bitty-terminal/palette)           | Command palette and picker UI through the overlay slot                                                   |
| [statusline](https://github.com/bitty-terminal/statusline)     | Working-directory, mode, Git, and task presentation through the statusline slot                          |
| [file-manager](https://github.com/bitty-terminal/file-manager) | Tiled-panel file listing, navigation, and preview                                                        |
| [git-panel](https://github.com/bitty-terminal/git-panel)       | Tiled-panel Git branch, status, diff, and log presentation                                               |
| [devtools](https://github.com/bitty-terminal/devtools)         | Read-only inspection and event tracing of the plugin runtime. Pre-release; not usable on a real host yet |
| [wheel](https://github.com/bitty-terminal/wheel)               | Official agent-harness plugin (AI-owned). Pre-implementation scaffold                                    |
| [composer](https://github.com/bitty-terminal/composer)         | Lua policy package for the modal command line over the public host API                                   |
| [copy-mode](https://github.com/bitty-terminal/copy-mode)       | Lua policy package for modal copy mode over the public history snapshot API                              |
| [history](https://github.com/bitty-terminal/history)           | Lua policy package for opt-in history reads over the public host API                                     |
| [search](https://github.com/bitty-terminal/search)             | Lua policy package for bounded scrollback search over the public history API                             |
| [beacon](https://github.com/bitty-terminal/beacon)             | Planning scaffold. No installable manifest or Lua implementation exists; not onboarded in the registry   |

### Documentation

Canonical documentation is split by subsystem. Start from
[bitty-docs](https://github.com/bitty-terminal/bitty-docs) for governance,
decisions, security, and project state.

| Repository                                                                   | Scope                                                    |
| ---------------------------------------------------------------------------- | -------------------------------------------------------- |
| [bitty-docs](https://github.com/bitty-terminal/bitty-docs)                   | Canonical governance: decisions, security, project state |
| [bitty-terminal-docs](https://github.com/bitty-terminal/bitty-terminal-docs) | Terminal platform and core engineering                   |
| [bitty-ai-docs](https://github.com/bitty-terminal/bitty-ai-docs)             | AI architecture and runtime                              |
| [bitty-plugins-docs](https://github.com/bitty-terminal/bitty-plugins-docs)   | Plugin system and ecosystem                              |

The public website and documentation frontend are maintained in
[bitty-website](https://github.com/bitty-terminal/bitty-website).

### Tooling and packaging

| Repository                                                                     | Purpose                                                                              |
| ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ |
| [bitty-plugin-manager](https://github.com/bitty-terminal/bitty-plugin-manager) | External plugin package-manager candidate. Metadata-only; no installer exists        |
| [bitty-compat-lab](https://github.com/bitty-terminal/bitty-compat-lab)         | External compatibility-suite candidate. Metadata-only; no fixtures or tests migrated |
| [bitty-perf](https://github.com/bitty-terminal/bitty-perf)                     | External performance-suite candidate. Metadata-only; no benchmarks migrated          |
| [scoop-bucket](https://github.com/bitty-terminal/scoop-bucket)                 | Scoop packaging channel for the Bitty terminal                                       |
| [homebrew-tap](https://github.com/bitty-terminal/homebrew-tap)                 | Homebrew packaging channel for the Bitty terminal                                    |

### Archive and research

| Repository                                                         | Purpose                                                                                                  |
| ------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------- |
| [bitty-mcp](https://github.com/bitty-terminal/bitty-mcp)           | Archived 2026-09-14. MCP functionality is covered by `bitty-ai`; kept read-only for history              |
| [bitty-devtools](https://github.com/bitty-terminal/bitty-devtools) | Archived 2026-10-01. Superseded by the [devtools](https://github.com/bitty-terminal/devtools) Lua plugin |
| [research](https://github.com/bitty-terminal/research)             | Design discussion records and code-review campaigns behind the docs corpora                              |

## Philosophy

Bitty is built around a few ideas:

- **Small core** — keep the terminal runtime focused on fundamental mechanisms.
- **Composable extensions** — features should be independently replaceable and reusable.
- **Programmable by default** — configuration and extension are part of the platform, not afterthoughts.
- **Keyboard first** — terminal workflows should remain fast without requiring pointer-driven interaction.
- **Platform, not bundle** — Bitty defines primitives and interfaces; extensions decide the experience.

## Project status

Bitty is currently **pre-1.0** and under active development.

Architecture and specifications may intentionally lead implementation while the
core interfaces are being established (docs-first). APIs, plugin interfaces,
and repository boundaries may continue to evolve before the first stable
release. Repositories marked as scaffolds, candidates, or pre-release above
are plans and validation work, not shipped features.

The project is developed in the open, and the repositories should be treated as
an evolving platform rather than a finished product.

---

**Website:** [bitty.run](https://bitty.run)
**GitHub:** [github.com/bitty-terminal](https://github.com/bitty-terminal)
