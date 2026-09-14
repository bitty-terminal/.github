# .github agent guide

## Scope and authority

- This repository is the `bitty-terminal` organization profile repository; it
  is not a product repository.
- `profile/README.md` renders on <https://github.com/bitty-terminal> and is the
  public entry point for the organization. The root `README.md` describes this
  repository itself.
- Product code, specifications, and canonical documentation do not live here.
  They belong to the repositories linked from `profile/README.md`; the
  canonical design corpus is `bitty-docs`.
- Do not infer sibling repository boundaries or grouping decisions from this
  repository; verify them from the owning repository and the workspace
  guidance.

## Content rules

- Keep `profile/README.md` concise, accurate, and link-oriented.
- Never describe planned, proposed, or unverified behavior as implemented.
- Link only to repositories and pages that exist; planned addresses stay
  unlinked and clearly labeled as not live.
- Do not add hardcoded local or machine-specific paths, usernames, or hosts.

## Quality gates

- Run `just check` (Prettier, markdownlint, actionlint) before pushing; the
  same gates run in CI via `.github/workflows/ci.yml`.
- Validate workflow changes with `actionlint` and `act -n` before pushing.
