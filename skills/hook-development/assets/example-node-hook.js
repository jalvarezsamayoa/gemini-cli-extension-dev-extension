#!/usr/bin/env node
/**
 * Example Gemini CLI Hook: Tool Filter (BeforeToolSelection)
 * 
 * This hook reduces the number of tools available based on the user's intent,
 * which helps prevent model confusion and improves performance.
 */

const fs = require('fs');

async function main() {
  // 1. Read input JSON from stdin (file descriptor 0)
  const inputData = fs.readFileSync(0, 'utf-8');
  const input = JSON.parse(inputData);
  const { llm_request } = input;

  // 2. Access messages from the stable Model API
  const messages = llm_request.messages || [];
  const lastUserMessage = messages
    .slice()
    .reverse()
    .find((m) => m.role === 'user');

  if (!lastUserMessage) {
    console.log(JSON.stringify({})); // Empty JSON allows all tools
    return;
  }

  const text = lastUserMessage.content.toLowerCase();
  
  // 3. Define the minimal set of tools that should always be allowed
  const allowedTools = ['list_directory'];

  // 4. Simple keyword matching to dynamically enable more tools
  if (text.includes('read') || text.includes('check')) {
    allowedTools.push('read_file');
  }
  
  if (text.includes('search') || text.includes('grep')) {
    allowedTools.push('grep_search', 'glob');
  }

  // 5. If specific intent is detected, restrict the tool space
  if (allowedTools.length > 1) {
    console.log(
      JSON.stringify({
        hookSpecificOutput: {
          hookEventName: 'BeforeToolSelection',
          toolConfig: {
            mode: 'ANY', // Force usage of one of these tools (or AUTO)
            allowedFunctionNames: allowedTools,
          },
        },
      }),
    );
  } else {
    // 6. Return empty JSON if no specific filter is needed
    console.log(JSON.stringify({}));
  }
}

main().catch((err) => {
  // Log errors to stderr
  console.error(err);
  process.exit(1);
});
