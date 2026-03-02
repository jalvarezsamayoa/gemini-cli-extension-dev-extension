---
name: hook-development
description: Expertise in creating, managing, and validating Gemini CLI hooks for both local projects and extensions.
---

# Hook Development Assistant

You are an expert in developing hooks for Gemini CLI. Use this skill to guide the creation of scripts that intercept agent interactions, tool calls, and model responses.

## The Golden Rule of Hooks

- **`stdout`**: Reserved EXCLUSIVELY for the final JSON response. Any other output here will cause hook failure.
- **`stderr`**: Used for all logging, debugging, and feedback to the user.
- **`exit 0`**: Success. `stdout` is parsed as JSON.
- **`exit 2`**: System Block. The action is blocked; `stderr` is used as the rejection reason.

## Hook Implementation Tiers

### 1. Local Development Hooks (Project-level)

These are specific to a single repository and stored in the project's `.gemini` folder.

- **Location**: `.gemini/hooks/` (e.g., `.gemini/hooks/my-hook.sh`).
- **Configuration**: Define in `.gemini/settings.json`.
- **Command Path**: Use `$GEMINI_PROJECT_DIR` (e.g., `"$GEMINI_PROJECT_DIR/.gemini/hooks/my-hook.sh"`).
- **Security**: The CLI prompts for consent when a new hook is detected or if a hook's command changes.

### 2. Extension Hooks

Shared across all projects where the extension is enabled.

- **Location**: In the extension's root or a subdirectory (e.g., `hooks/`).
- **Configuration**: Define in a `hooks/hooks.json` file in the extension root.
- **Command Path**: Use `${extensionPath}` (e.g., `"${extensionPath}/hooks/my-hook.sh"`).

## Core Hook Events

- **`BeforeAgent`**: Fires before planning. Used for prompt validation or context injection.
- **`BeforeTool`**: Fires before a tool is called. Used for argument validation or security checks.
- **`AfterTool`**: Fires after tool execution. Used for result auditing or hiding sensitive output.
- **`AfterAgent`**: Fires after the final response. Used for response validation and retries.
- **`BeforeModel` / `AfterModel`**: Intercept requests/responses at the LLM level.

## Reference Examples

When creating new hooks, you can reference the following examples in the `assets/` directory:

- **Bash Hook**: `assets/example-bash-hook.sh` (A secret scanner using `grep` and `jq`).
- **Node.js Hook**: `assets/example-node-hook.js` (A tool-filtering hook using the Model API).
- **Extension Config**: `assets/example-extension-hooks.json` (A sample `hooks.json` for extensions).
- **Project Config**: `assets/example-project-settings.json` (A sample `.gemini/settings.json` for local projects).

## Validation & Debugging

### 1. Manual Testing

Test scripts by piping sample JSON to them and checking the output and exit code.

```bash
# Test bash hook
cat test-input.json | .gemini/hooks/my-hook.sh
echo "Exit code: $?"

# Test node hook
cat test-input.json | node .gemini/hooks/my-hook.js
```

### 2. CLI Diagnostics

- Use `/hooks list` (or `/hooks panel`) inside Gemini CLI to see registered hooks and their status.
- Use `--debug` flag when running `gemini` to see `stderr` output from hooks.

### 3. Extension Validation

- Run `gemini extensions validate <path>` to verify the extension's structure and its `hooks/hooks.json` configuration.
