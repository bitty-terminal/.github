# Bitty

**A programmable, microkernel terminal emulator built around a small Rust core and a two-tiered extension architecture.**

> Mechanism, not policy. Small core. Everything composable.

Bitty explores what a terminal can become when the terminal emulator itself
provides only the essential mechanisms, while upstream infrastructure crates
and downstream plugins compose the user experience on top.

Inspired by Neovim's architecture, Bitty strictly separates mechanism from
policy to avoid the "Emacs operating system trap" — keeping the terminal runtime
lean, blisteringly fast, and deeply programmable without turning into an
in-process operating system.

## Architecture

- **Small Rust core** — [bitty](https://github.com/bitty-terminal/bitty) owns
  the essential terminal mechanisms: PTY management, VT parsing, GPU rendering
  (`wgpu`), viewport/grid objects, and event hooks. Everything else lives
  outside the core.
- **Upstream Rust core extensions (L1)** — optional, reusable infrastructure
  capabilities (networking, IPC, platform notifications, URL detection,
  execution supervisor) developed as independent crates behind accepted
  contracts. The core never depends on them silently.
- **Downstream Lua plugins (L2)** — user-facing features and workflows
  (statuslines, palettes, file pickers, Git panels) written in pure Lua against
  the public host API, running inside an isolated
  [Phodopus](https://github.com/bitty-terminal/phodopus) sandbox runtime.
- **Independent AI sub-platform** —
  [bitty-ai](https://github.com/bitty-terminal/bitty-ai) develops the model,
  context, agent, and tool runtime separately from the terminal core.

## Repository map

### Terminal core

| Repository                                             | Purpose                                                                                                               |
| ------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------- |
| [bitty](https://github.com/bitty-terminal/bitty)       | Terminal runtime: PTY, VT parsing, GPU rendering, sessions, and panels                                                |
| [phodopus](https://github.com/bitty-terminal/phodopus) | Pure-Rust stackless Lua runtime: sandboxing, fuel, and modular stdlib. Pre-adoption; not yet the active Bitty runtime |

### Upstream Rust core extensions

Optional, decoupled capabilities developed behind accepted contracts.

| Repository                                                                           | Purpose                                                                                                                                               |
| ------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| [bitty-network](https://github.com/bitty-terminal/bitty-network)                     | Shared optional network runtime (API plus implementation). Default-off                                                                                |
| [bitty-ipc](https://github.com/bitty-terminal/bitty-ipc)                             | Generic out-of-process IPC bridge: DevTools and MCP protocols, bounded framing, and peer-credential auth. Pre-1.0                                     |
| [bitty-platform-services](https://github.com/bitty-terminal/bitty-platform-services) | Platform notification bridge (Linux D-Bus, macOS notification center, Windows Toast), fail-closed                                                     |
| [bitty-url-detector](https://github.com/bitty-terminal/bitty-url-detector)           | Pure-algorithm plaintext URL detector (bitty#1760; scanner over `&str`, no terminal/GPU types)                                                        |
| [bitty-execution](https://github.com/bitty-terminal/bitty-execution)                 | Execution supervisor: job lifetime, cancellation, process resources, and recovery. Landed and independently verified                                  |
| [bitty-graphics](https://github.com/bitty-terminal/bitty-graphics)                   | Bounded graphics decode (PNG-only) plus raster mechanics. Landed and independently verified                                                           |
| [bitty-a11y](https://github.com/bitty-terminal/bitty-a11y)                           | Accessibility adapter: snapshot, handle, focus, and action core with a headless backend. Landed and independently verified                            |
| [bitty-storage](https://github.com/bitty-terminal/bitty-storage)                     | Bounded isolated storage mechanics: snapshots, atomic commits, per-plugin key-value backend, and transcript descriptors. Landed; verification pending |
| [bitty-observability](https://github.com/bitty-terminal/bitty-observability)         | Read-only observation seam: API, bounded buffering, filtering, and redaction helpers. Pre-1.0; not consumed by the core yet                           |

### Plugin platform

The downstream plugin ecosystem. All official and community Lua plugins live
and register through the plugin directory.

| Repository                                                                       | Purpose                                                                                    |
| -------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| [bitty-plugins](https://github.com/bitty-terminal/bitty-plugins)                 | Plugin registry, store frontend, and official plugin collection                            |
| [bitty-plugin-sdk](https://github.com/bitty-terminal/bitty-plugin-sdk)           | Plugin SDK: manifest validation, Lua API declarations, mock host, and conformance fixtures |
| [bitty-plugin-template](https://github.com/bitty-terminal/bitty-plugin-template) | Reproducible starting point and generator for new independent plugin repositories          |

### AI

| Repository                                                   | Purpose                                                                                                                                           |
| ------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| [bitty-ai](https://github.com/bitty-terminal/bitty-ai)       | AI subsystem: model providers, context providers, agent runtime, and tool bus. Experimental and pre-alpha, docs-first                             |
| [bitty-agent](https://github.com/bitty-terminal/bitty-agent) | AI agent protocol layer: messages, tool-call stubs, observations, and bounded queues. Pre-1.0; contract accepted, implementation not yet verified |

### Documentation & manual

Canonical documentation and user guides. Start from
[bitty-docs](https://github.com/bitty-terminal/bitty-docs) for governance and
architecture, or [bitty-manual](https://github.com/bitty-terminal/bitty-manual)
for user guides and configuration.

| Repository                                                                   | Scope                                                                                             |
| ---------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| [bitty-docs](https://github.com/bitty-terminal/bitty-docs)                   | Canonical governance: decisions, security, architecture, and project state                        |
| [bitty-manual](https://github.com/bitty-terminal/bitty-manual)               | Canonical user manual, configuration reference, Lua API, and troubleshooting (English & 简体中文) |
| [bitty-website](https://github.com/bitty-terminal/bitty-website)             | Public website and published documentation frontend ([bitty.run](https://bitty.run))              |
| [bitty-terminal-docs](https://github.com/bitty-terminal/bitty-terminal-docs) | Terminal platform and core engineering documentation                                              |
| [bitty-ai-docs](https://github.com/bitty-terminal/bitty-ai-docs)             | AI architecture and runtime documentation                                                         |
| [bitty-plugins-docs](https://github.com/bitty-terminal/bitty-plugins-docs)   | Plugin system and ecosystem documentation                                                         |

### Tooling and packaging

| Repository                                                                     | Purpose                                                                                                                   |
| ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------- |
| [bitty-compat-lab](https://github.com/bitty-terminal/bitty-compat-lab)         | External compatibility validation suite. Suite migrated 2026-10-04 (6887d08); landed, acceptance and verification pending |
| [bitty-perf](https://github.com/bitty-terminal/bitty-perf)                     | External performance validation suite. Suite migrated 2026-10-04 (73aa233); landed, acceptance and verification pending   |
| [bitty-plugin-manager](https://github.com/bitty-terminal/bitty-plugin-manager) | External plugin package-manager candidate. Metadata-only; no installer exists                                             |
| [scoop-bucket](https://github.com/bitty-terminal/scoop-bucket)                 | Scoop packaging channel for the Bitty terminal                                                                            |
| [homebrew-tap](https://github.com/bitty-terminal/homebrew-tap)                 | Homebrew packaging channel for the Bitty terminal                                                                         |

## Philosophy

Bitty is built around core design tenets:

- **Mechanism, not policy (inspired by Neovim)** — Keep the core focused on
  fundamental mechanisms (PTY, grid, rendering, event hooks); extensions and
  user configuration decide the experience.
- **Microkernel boundaries, not an OS** — Avoid the "Emacs operating system
  trap." Bitty stays a lean, fast, programmable terminal emulator, not an
  in-process operating system.
- **Two-tiered extension architecture** — Upstream Rust crates share
  infrastructure mechanisms; downstream Lua plugins compose user workflows.
- **Composable by design** — Features should be independently replaceable and
  reusable.
- **Programmable by default** — Configuration and extension are part of the
  platform, not afterthoughts.
- **Keyboard first** — Terminal workflows should remain fast without requiring
  pointer-driven interaction.

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
