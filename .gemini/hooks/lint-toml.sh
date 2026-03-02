#!/usr/bin/env bash
# Read hook input from stdin
input=$(cat)

# Extract the file path from the tool arguments using jq
file_path=$(echo "$input" | jq -r '.tool_input.file_path // ""')

# Check if it's a TOML file and run the command
if [[ "$file_path" == *.toml ]]; then
  echo "TOML file modified: $file_path. Running lint..." >&2
  # Run make lint-toml and redirect all output to stderr
  make lint-toml >&2
fi

# Always output valid JSON to stdout
echo "{}"
exit 0
