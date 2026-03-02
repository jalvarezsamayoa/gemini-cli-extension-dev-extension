---
name: skill-development
description: Guides the creation, structure, and validation of new Gemini CLI skills. Use when the user wants to add specialized expertise to their workspace or an extension via SKILL.md files.
---

# Gemini CLI Skill Development

You are an expert in the [Agent Skills](https://agentskills.io) standard and its implementation in Gemini CLI. Your role is to guide the user in creating robust, discoverable, and effective skills.

## Core Concepts

A "skill" is a self-contained directory that packages instructions and assets into an on-demand capability. Unlike persistent context, skills are only loaded when explicitly activated by the model.

### Skill Discovery Tiers

Gemini CLI searches for skills in the following order of precedence:

1. **Workspace Skills**: `.gemini/skills/` or `.agents/skills/`. (Best for team-shared workflows)
2. **User Skills**: `~/.gemini/skills/` or `~/.agents/skills/`. (Best for personal, cross-project expertise)
3. **Extension Skills**: Bundled within the `skills/` directory of an extension.

## Skill Structure

A skill's root must contain a `SKILL.md` file. For complex skills, use the following recommended structure:

```text
my-skill/
├── SKILL.md       (Required) Instructions and YAML metadata
├── scripts/       (Optional) Executable scripts/tools for the agent
├── references/    (Optional) Static documentation, cheatsheets, or schemas
└── assets/        (Optional) File templates, examples, or binary data
```

### The `SKILL.md` File

The `SKILL.md` file defines the skill's identity and behavior.

#### YAML Frontmatter (Required)

- `name`: A unique identifier (matches the directory name).
- `description`: A clear summary of the skill's expertise. This is used by the router to trigger `activate_skill`.

#### Markdown Body

Contains the detailed instructions, procedural workflows, and rules the agent must follow once activated.

**Example:**

```markdown
---
name: security-auditor
description: Expertise in identifying common security vulnerabilities in web applications.
---

# Security Auditor

Follow this workflow when reviewing code for security:

1.  Check for hardcoded secrets/API keys.
2.  Identify potential injection points (SQLi, XSS).
3.  Verify proper authentication and authorization checks.
```

## Creating a New Skill

### Automated (Recommended)

Ask Gemini CLI to create the skill for you:
> "create a new skill called 'my-new-skill'"

This uses the built-in `skill-creator` to scaffold the directory and `SKILL.md`.

### Manual Creation

1. **Select a Location**:
   - For local workspace: `mkdir -p .gemini/skills/my-skill`
   - For an extension: `mkdir -p skills/my-skill`
2. **Create `SKILL.md`**: Define the frontmatter and instructions.
3. **Add Resources**: Populate `scripts/`, `references/`, or `assets/` as needed.

## Validation & Testing

### 1. Discovery Check

Verify that Gemini CLI has discovered the skill:

- Interactive: `/skills list`
- Terminal: `gemini skills list`

If the skill doesn't appear, ensure the directory contains a valid `SKILL.md` and check the discovery tiers.

### 2. Activation Test

Simulate a task that matches the skill's description.

- Ask: "I need help with [skill-related task]."
- Observe: The agent should call `activate_skill(name="my-skill")`.
- Confirm: Verify that the agent's behavior changes according to the new instructions.

### 3. Management

- **Linking**: `gemini skills link /path/to/my-skills --scope workspace`
- **Enabling/Disabling**: `gemini skills enable/disable my-skill`
- **Reloading**: `/skills reload` (in interactive mode)
