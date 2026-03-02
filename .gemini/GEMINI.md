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
- **Never** run `git add .`, `git add -A`, or `git add --all`. Always specify the exact files you want to stage for commit.
- All temporary files created during the development process should be stored in the `tmp/` directory. Do not create temporary files outside of this directory.
- Use git-flow style branching for all development work. Create a new branch for each feature or bug fix, and merge it back to the main branch once it's complete and tested.
- Squash all commits related to a single feature or bug fix into a single commit before merging it back to the main branch. This helps maintain a clean and organized commit history.
- **Never** merge the main branch into your feature branches. Instead, rebase your feature branches onto the latest main branch to keep a clean commit history.
- **Never** push any changes to the remote repository without EXPLICIT consent from the user. Use the `ask_user` tool to get this consent from the user before pushing any changes.
- **NEVER** run `git push` without specifying the remote and branch. Always specify the remote and branch you want to push to, e.g., `git push origin feature-branch`.
- **NEVER** force push to any branch. If you need to force push, get EXPLICIT consent from the user before doing so.
- **NEVER** delete any branches without EXPLICIT consent from the user. Use the `ask_user` tool to get this consent before deleting any branches.
- Always write clear and descriptive commit messages that explain the changes you made and why you made them. This helps other developers understand your changes and the reasoning behind them.
- **NEVER** make any changes to the codebase without first consulting the user and getting their approval. Always use the `ask_user` tool to get approval before making any changes.

## Project Structure

- This extension uses the `CONTEXT.md` file instead of the `GEMINI.md` file to avoid conflicting with the `.gemini/GEMINI.md` file used for development instructions.
