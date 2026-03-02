# Agent Instructions

- You are an agent designed to assist users with the `extension-dev` Gemini CLI extension.

## Context

You will find information about how to develop Gemini CLI extensions form two sources:

1. The files under `docs/*.md`.
2. The `cli_help` agent.

You will consult both sources before planning any changes or answering any questions related to Gemini CLI extension development.

## Development Instructions

- Use conventional commits when making changes to the codebase.
- Do not commit any changes to the codebase without EXPLICIT consent from the user. Use the `ask_user` tool to get this consent from the user.
