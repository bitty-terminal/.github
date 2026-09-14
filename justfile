# .github profile quality commands

prettier_version := "3.9.6"
markdownlint_version := "0.23.1"
actionlint_version := "1.7.12"

# Format every file type supported by Prettier inside this repository.
fmt:
    bunx --bun prettier@{{prettier_version}} --write . --ignore-unknown

# Check formatting without changing files.
fmt-check:
    bunx --bun prettier@{{prettier_version}} --check . --ignore-unknown

# Lint every Markdown file selected by .markdownlint-cli2.jsonc.
markdownlint:
    bunx --bun markdownlint-cli2@{{markdownlint_version}}

# Validate GitHub Actions syntax using the locally installed actionlint.
actionlint:
    @installed="$(actionlint --version | head -n 1)"; test "$installed" = "{{actionlint_version}}" || { echo "actionlint {{actionlint_version}} required; found $installed" >&2; exit 1; }
    actionlint -color -shellcheck=

# Run the same logical gates as CI. All recipes are read-only.
check:
    just fmt-check
    just markdownlint
    just actionlint
