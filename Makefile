# Makefile for Gemini CLI extension development project.

.PHONY: help install test lint lint-fix format clean validate link unlink

# Default target: show help
help: ## Display this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

install: ## Install dependencies
	npm install

test: ## Run tests
	npm test

lint: lint-md lint-toml ## Run all linters (markdown, toml)

lint-md: ## Run markdown linter
	npm run lint:md

lint-toml: ## Run toml linter
	npm run lint:toml

lint-fix: lint-md-fix lint-toml-fix ## Run all linters and attempt to fix errors

lint-md-fix: ## Run markdown linter fix
	npm run lint:md:fix

lint-toml-fix: ## Run toml formatter as linter fix
	npm run fmt:toml

format: fmt-toml ## Run all formatters

fmt-toml: ## Run toml formatter
	npm run fmt:toml

clean: ## Remove node_modules and lock files
	rm -rf node_modules
	rm -f package-lock.json

validate: ## Validate the extension manifest and structure
	gemini extensions validate .

link: ## Link this extension for local development
	gemini extensions link .

unlink: ## Unlink this extension
	gemini extensions uninstall extension-dev
