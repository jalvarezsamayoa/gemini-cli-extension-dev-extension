# Product Guidelines: Gemini CLI Extension Developer Kit

## Prose Style
- **Technical & Concise:** Focus on direct, clear instructions for developers.
- Avoid unnecessary filler; prioritize high-signal output.

## UX Principles
- **Efficiency First:** Optimize commands for speed and power-user workflows.
- **Safety & Clarity:** Ensure every action is safe and reversible; provide clear feedback on state changes.
- **Proactive Assistance:** Automatically detect and suggest fixes for common development issues.

## Visual Output
- **Monochrome & Minimalist:** Use clean, standard terminal output without excessive colors or decorative elements.
- Focus on readability and standard terminal conventions.

## Development Standards
- **Strict Linting:** Enforce Markdown and TOML linting rules consistently.
- **Documentation as Code:** All documentation should be treated as part of the source and subjected to the same quality checks.
- **Tool-Centric Design:** Prioritize automation through existing terminal tools (e.g., `markdownlint-cli2`, `taplo`).