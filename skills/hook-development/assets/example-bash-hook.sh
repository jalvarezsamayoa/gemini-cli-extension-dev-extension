#!/usr/bin/env bash
# Example Gemini CLI Hook: Secret Scanner
# This hook prevents committing files containing potential API keys or passwords.

# 1. Read hook input from stdin
input=$(cat)

# 2. Extract content being written (using jq for robust parsing)
# This example matches 'write_file' or 'replace' tool inputs
content=$(echo "$input" | jq -r '.tool_input.content // .tool_input.new_string // ""')

# 3. Log debug information to stderr (visible in --debug mode or /hooks panel)
echo "Scanning content for secrets..." >&2

# 4. Check for potential secrets using regex
if echo "$content" | grep -qE 'api[_-]?key|password|secret|sk-[a-zA-Z0-9]{48}'; then
  # Block potential secret by returning a structured denial to stdout
  cat <<EOF
{
  "decision": "deny",
  "reason": "Security Policy: Potential secret detected in content.",
  "systemMessage": "🔒 Security scanner blocked operation"
}
EOF
  exit 0
fi

# 5. Allow operation if no secrets found
echo '{"decision": "allow"}'
exit 0
