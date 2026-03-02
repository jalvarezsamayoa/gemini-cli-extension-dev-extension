---
name: extension-development
description: Expertise in developing, building, and managing Gemini CLI extensions. Use when the user wants to create a new extension, understand the extension structure, or add features like MCP servers, custom commands, hooks, or skills to an extension.
---

# Gemini CLI Extension Development

You are an expert developer assistant specialized in the Gemini CLI extension ecosystem. Your role is to guide the user through the lifecycle of an extension: from initial scaffolding to complex feature implementation and release.

## Extension Structure

A Gemini CLI extension is a directory containing a manifest file and optional subdirectories for specialized features.

### Core Manifest: `gemini-extension.json`
This file defines the extension's behavior and is located in the root directory.
- `name`: Unique lowercase name with dashes.
- `version`: Semantic Versioning (SemVer).
- `description`: A brief summary of the extension's purpose.
- `mcpServers`: Defines Model Context Protocol servers. Use `${extensionPath}` for portability.
- `contextFileName`: (Optional) Specifies a markdown file for persistent context (default: `GEMINI.md`).
- `settings`: Defines user-configurable settings (e.g., API keys). Use `sensitive: true` for secrets.
- `excludeTools`: Restricts access to specific tools (e.g., `run_shell_command(rm -rf *)`).
- `themes`: Custom UI color schemes.

### Standard Subdirectories
- `commands/`: TOML files for custom slash commands.
  - Structure: `commands/group/name.toml` -> `/group:name`.
- `skills/`: `SKILL.md` files for on-demand expert workflows.
- `hooks/`: `hooks.json` for intercepting CLI lifecycle events.
- `agents/`: (Preview) Markdown files for delegatable sub-agents.
- `policies/`: TOML files for safety and tool-call governance.
- `src/` / `dist/`: Recommended for source code and build artifacts (e.g., TypeScript).

### Context and Instructions
- `GEMINI.md` / `CONTEXT.md`: Persistent instructions loaded into the model's context for every session. Keep it concise and goal-focused.

## Development Workflow

1. **Scaffolding**:
   ```bash
   gemini extensions new <path> [template]
   ```
   Templates include `mcp-server`, `context`, and `custom-commands`.

2. **Linking for Local Iteration**:
   ```bash
   gemini extensions link .
   ```
   This creates a symbolic link to the global extensions directory, allowing for immediate testing.

3. **Configuration**:
   ```bash
   gemini extensions config <name>
   ```
   Used to set values for variables defined in the `settings` manifest.

4. **Debugging**:
   - Use the **F12 debug console** in interactive mode to inspect tool calls and responses.
   - Run MCP server commands directly in the terminal to verify they start correctly.

## Best Practices & Security

- **Least Privilege**: Only request the permissions and tools your extension strictly needs.
- **Input Validation**: Rigorously validate all user-provided tool inputs to prevent RCE or unauthorized access.
- **Secure Secrets**: Always mark API keys as `sensitive: true` in the manifest to ensure they are stored in the system keychain.
- **TypeScript**: Prefer TypeScript for type safety and better developer experience.
- **Bundling**: Use tools like `esbuild` to bundle dependencies and reduce installation overhead.
- **Versioning**: Follow SemVer strictly to communicate breaking changes, new features, and bug fixes clearly.
