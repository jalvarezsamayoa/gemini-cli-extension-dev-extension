#!/usr/bin/env bash
# Read hook input from stdin
input=$(cat)

# Extract the file path from the tool arguments using jq
file_path=$(echo "$input" | jq -r '.tool_input.file_path // ""')

# Check if it's a markdown file and run the command
if [[ "$file_path" == *.md ]]; then
  echo "Markdown file modified: $file_path. Running lint..." >&2
  # Run make lint-md and redirect all output to stderr
  make lint-md >&2
fi

# Always output valid JSON to stdout
echo "{}"
exit 0
