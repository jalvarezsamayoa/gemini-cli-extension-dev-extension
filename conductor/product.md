# Initial Concept

Gemini CLI extension (`extension-dev`) for developing and testing Gemini extensions.

# Product Guide: Gemini CLI Extension Developer Kit

## Core Concept

A specialized Gemini CLI extension (`extension-dev`) designed for **Extension Creators** to simplify the process of scaffolding, developing, and extending Gemini CLI extensions.

## Goal

To provide a robust **Scaffolding** environment that enforces best practices, facilitates **Quickstart Templates**, and offers a **Local Simulation** sandbox for testing and debugging extensions seamlessly within the existing **Toolchain Integration**.

## Target Audience

- **Extension Creators:** Developers building new Gemini CLI extensions.
- **QA & Testers:** Users testing and validating extension functionality.

## MVP Key Features

- **Quickstart Templates:** Instant generation of new extension templates.
- **Local Simulation:** A sandboxed environment to run and test extensions locally.
- **Toolchain Integration:** Deep integration with common terminal tools and IDEs.
- **Scaffolding and Extension:** Capabilities to both create new extensions and extend existing ones.

## Technology Summary (Inferred)

- **Runtime:** Node.js (ESM)
- **Linting:** `markdownlint-cli2`, `taplo` (TOML)
- **Configuration:** `gemini-extension.json`, `package.json`
