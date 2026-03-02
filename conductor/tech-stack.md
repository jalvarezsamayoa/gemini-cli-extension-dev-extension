# Tech Stack: Gemini CLI Extension Developer Kit

## Core Stack
- **Runtime:** Node.js (v20+), ESM
- **Language:** TypeScript/JavaScript
- **Architecture:** Gemini CLI Extension (native integration)

## Tooling & Quality
- **Linting (Prose):** `markdownlint-cli2`
- **Formatting/Linting (Config):** `taplo` (TOML)
- **Version Control:** Git

## Configuration Files
- `package.json`: Project metadata and dependencies.
- `gemini-extension.json`: Extension-specific settings and tool definitions.
- `CONTEXT.md`: Dynamic context loading for the Gemini CLI.

## Deployment & Distribution
- **Package Manager:** npm (v10+)
- **CI/CD:** GitHub Actions (inferred)
- **Registry:** npm (for public release)